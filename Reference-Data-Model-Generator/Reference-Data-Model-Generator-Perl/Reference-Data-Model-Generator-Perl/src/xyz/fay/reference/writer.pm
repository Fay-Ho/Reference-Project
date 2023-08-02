package writer;
use strict;
use warnings FATAL => 'all';

#
# MIT License
#
# Copyright (c) 2023 Fay-Ho
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#

use File::Path;
use Scalar::Util qw(looks_like_number);

require './lib/CamelCase.pm';

push(@INC, 'pwd');

# -------------------------------------------------------------------------------------------------------------------- #

my $ln = "\n";

my $comma = ',';

my $empty = '';

my $space = ' ';

my $read = '<';

my $write = '>';

my $is_array = 'ARRAY';

my $is_hash = 'HASH';

my $def_dir = './';

my $out_dir = 'out/';

my $java_dir = 'java/';

my $java = '.java';

my $kotlin_dir = 'kotlin/';

my $kotlin = '.kt';

my $objc_dir = 'objc/';

my $objc_h = '.h';

my $objc_m = '.m';

my $swift_dir = 'swift/';

my $swift = '.swift';

my $error = 'Something went wrong! Write file error!';

my $default_prefix_fr = 'FR';

my $default_prefix_ns = 'NS';

my $default_package = 'xyz.fay.reference';

# -------------------------------------------------------------------------------------------------------------------- #

my $flag_block = '%BLOCK%';

my $flag_class = '%CLASS%';

my $flag_copyright = '%COPYRIGHT%';

my $flag_define = '%DEFINE%';

my $flag_package = '%PACKAGE%';

my $flag_param = 'PARAM%';

my $flag_prefix = '%PREFIX%';

my $flag_string_type = 'String';

my $flag_double_type = 'Double';

my $flag_int_type = 'Int';

my $flag_java_double_type = 'Double';

my $flag_java_int_type = 'Integer';

my $flag_objc_double_type = 'double';

my $flag_objc_int_type = 'int';

my $flag_suffix = '%SUFFIX%';

my $flag_type = '%TYPE%';

my $flag_var = '%VAR%';

# -------------------------------------------------------------------------------------------------------------------- #

my $mit_license_android = 'MIT License

  Copyright (c) 2023 Fay-Ho

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE.';

my $mit_license_ios = 'MIT License
//
//  Copyright (c) 2023 Fay-Ho
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.';

# -------------------------------------------------------------------------------------------------------------------- #

my $flag_java_file = "package $flag_package;

/*
  $flag_copyright
*/

import androidx.annotation.NonNull;

import xyz.fay.parcel.Parcelable;
import xyz.fay.parcel.Parcelize;

\@Parcelize
public final class $flag_class$flag_suffix extends Parcelable {
$flag_define

    public $flag_class$flag_suffix(
$flag_param
    ) {
$flag_block
    }
}
";

my $flag_java_type_define = "    \@NonNull private final $flag_type$flag_suffix $flag_var;";

my $flag_java_type_list_define = "    \@NonNull private final $flag_type$flag_suffix\[] $flag_var;";

my $flag_java_type_param = "            \@NonNull $flag_type$flag_suffix $flag_var";

my $flag_java_type_list_param = "            \@NonNull $flag_type$flag_suffix\[] $flag_var";

my $flag_java_block = "        this.$flag_var = $flag_var;";

# -------------------------------------------------------------------------------------------------------------------- #

my $flag_kotlin_file = "package $flag_package

/*
  $flag_copyright
*/

import android.os.Parcelable
import kotlinx.parcelize.Parcelize

$flag_block
";

my $flag_kotlin_block = "\@Parcelize
data class $flag_class$flag_suffix(
$flag_define
) : Parcelable";

my $flag_kotlin_type_define = "    val $flag_var: $flag_type$flag_suffix";

my $flag_kotlin_type_list_define = "    val $flag_var: Array<$flag_type$flag_suffix>";

# -------------------------------------------------------------------------------------------------------------------- #

my $flag_objc_h_file = "//
//  $flag_copyright
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

\@class $flag_class;

$flag_block

NS_ASSUME_NONNULL_END
";

my $flag_objc_h_block = "\@interface $flag_prefix$flag_class$flag_suffix : NSObject

$flag_define

\@end";

my $flag_objc_h_type_define = "\@property (nonatomic, strong, readonly) $flag_prefix$flag_type$flag_suffix *$flag_var;";

my $flag_objc_h_type_number_define = "\@property (nonatomic, assign, readonly) $flag_prefix$flag_type$flag_suffix $flag_var;";

my $flag_objc_h_type_list_define = "\@property (nonatomic, strong, readonly) NSArray<$flag_prefix$flag_type$flag_suffix *> *$flag_var;";

my $flag_objc_m_file = "//
//  $flag_copyright
//

#import \"$flag_prefix$flag_class$flag_suffix.h\"

NS_ASSUME_NONNULL_BEGIN

$flag_block

NS_ASSUME_NONNULL_END
";

my $flag_objc_m_block = "\@interface $flag_prefix$flag_class$flag_suffix ()

$flag_define

\@end

\@implementation $flag_prefix$flag_class$flag_suffix

\@end";

my $flag_objc_m_type_define = "\@property (nonatomic, strong, readwrite) $flag_prefix$flag_type$flag_suffix *$flag_var;";

my $flag_objc_m_type_number_define = "\@property (nonatomic, assign, readwrite) $flag_prefix$flag_type$flag_suffix $flag_var;";

my $flag_objc_m_type_list_define = "\@property (nonatomic, strong, readwrite) NSArray<$flag_prefix$flag_type$flag_suffix *> *$flag_var;";

# -------------------------------------------------------------------------------------------------------------------- #

my $flag_swift_file = "//
//  $flag_copyright
//

$flag_block";

my $flag_swift_block = "struct $flag_class$flag_suffix : Codable {
$flag_define
}";

my $flag_swift_type_define = "    let $flag_var: $flag_type$flag_suffix";

my $flag_swift_type_list_define = "    let $flag_var: [$flag_type$flag_suffix]";

# -------------------------------------------------------------------------------------------------------------------- #

sub generate_java_file {
    my ($target_path, $target_prefix, $target_suffix, $target_package, $target_copyright, @data) = @_;

    foreach my $data (@data) {

        foreach my $target_class_name (keys %$data) {
            my ($target_class_value, $target_class_var_define, $target_class_var_param, $target_class_var_block) =
                ($$data{$target_class_name}, $empty, $empty, $empty);

            foreach my $target_define_name (sort keys %$target_class_value) {
                (my $target_define_type, my $target_define_value) =
                    ($target_class_name.camel_case($target_define_name), $$target_class_value{$target_define_name});

                if (ref $target_define_value eq $is_array) {
                    if (ref $$target_define_value[0] ne $is_hash) {
                        $target_class_var_define = create_java_define($flag_java_type_list_define, $flag_string_type, $empty, $target_define_name, $target_class_var_define);
                        $target_class_var_param = create_java_param($flag_java_type_list_param, $flag_string_type, $empty, $target_define_name, $target_class_var_param);
                    } else {
                        $target_class_var_define = create_java_define($flag_java_type_list_define, $target_define_type, $target_suffix, $target_define_name, $target_class_var_define);
                        $target_class_var_param = create_java_param($flag_java_type_list_param, $target_define_type, $target_suffix, $target_define_name, $target_class_var_param);
                    }
                } elsif (ref $target_define_value eq $is_hash) {
                    $target_class_var_define = create_java_define($flag_java_type_define, $target_define_type, $target_suffix, $target_define_name, $target_class_var_define);
                    $target_class_var_param = create_java_param($flag_java_type_param, $target_define_type, $target_suffix, $target_define_name, $target_class_var_param);
                } elsif ($target_define_value =~ /^[+-]?\d+$/) {
                    $target_class_var_define = create_java_define($flag_java_type_define, $flag_java_int_type, $empty, $target_define_name, $target_class_var_define);
                    $target_class_var_param = create_java_param($flag_java_type_param, $flag_java_int_type, $empty, $target_define_name, $target_class_var_param);
                } elsif ($target_define_value =~ /^-?(?:\d+(?:\.\d*)?|\.\d+)$/) {
                    $target_class_var_define = create_java_define($flag_java_type_define, $flag_java_double_type, $empty, $target_define_name, $target_class_var_define);
                    $target_class_var_param = create_java_param($flag_java_type_param, $flag_java_double_type, $empty, $target_define_name, $target_class_var_param);
                } else {
                    $target_class_var_define = create_java_define($flag_java_type_define, $flag_string_type, $empty, $target_define_name, $target_class_var_define);
                    $target_class_var_param = create_java_param($flag_java_type_param, $flag_string_type, $empty, $target_define_name, $target_class_var_param);
                }
                $target_class_var_block = create_java_block($target_define_name, $target_class_var_block);
            }

            create_java_file($target_path, $target_class_name, $target_suffix, $target_package, $target_copyright, $target_class_var_define, $target_class_var_param, $target_class_var_block);
        }
    }
}

sub create_java_define {
    my ($java_define_type, $java_type, $java_suffix, $java_var, $target_define) = @_;

    my $new_define = replace_string($java_define_type, (
        $flag_type   => $java_type,
        $flag_suffix => $java_suffix,
        $flag_var    => $java_var
    ));

    if ($target_define ne $empty) {
        $target_define = $target_define.$ln;
    }

    return $target_define.$new_define;
}

sub create_java_param {
    my ($java_param_type, $java_type, $java_suffix, $java_var, $target_param) = @_;

    my $new_param = replace_string($java_param_type, (
        $flag_type   => $java_type,
        $flag_suffix => $java_suffix,
        $flag_var    => $java_var
    ));

    if ($target_param ne $empty) {
        $target_param = $target_param.$comma.$ln;
    }

    return $target_param.$new_param;
}

sub create_java_block {
    my ($java_var, $target_block) = @_;

    my $new_block = replace_string($flag_java_block, (
        $flag_var => $java_var
    ));

    if ($target_block ne $empty) {
        $target_block = $target_block.$ln;
    }

    return $target_block.$new_block;
}

sub create_java_file {
    my ($target_path, $target_file, $target_suffix, $target_package, $target_copyright, $target_class_var_define, $target_class_var_param, $target_class_var_block) = @_;

    my $java_file = replace_string($flag_java_file, (
        $flag_package   => $target_package ne $empty ? $target_package : $default_package,
        $flag_copyright => $target_copyright ne $empty ? $target_copyright : $mit_license_android,
        $flag_class     => $target_file,
        $flag_suffix    => $target_suffix,
        $flag_define    => $target_class_var_define,
        $flag_param     => $target_class_var_param,
        $flag_block     => $target_class_var_block
    ));

    $target_path = create_path($target_path, $java_dir);

    create_file($target_path.$target_file.$target_suffix.$java, $java_file);
}

# -------------------------------------------------------------------------------------------------------------------- #

sub generate_kotlin_file {
    my ($target_path, $target_prefix, $target_suffix, $target_package, $target_copyright, @data) = @_;
    my ($target_file_name, $target_kotlin_block) = ($empty, $empty);

    foreach (keys @data) {
        my $data = $data[$_];

        foreach my $target_class_name (keys %$data) {
            if ($_ == 0) {
                $target_file_name = $target_class_name;
            }
            my ($target_class_value, $target_class_var_define) = ($$data{$target_class_name}, $empty);

            foreach my $target_define_name (sort keys %$target_class_value) {
                (my $target_define_type, my $target_define_value) =
                    ($target_class_name.camel_case($target_define_name), $$target_class_value{$target_define_name});

                if (ref $target_define_value eq $is_array) {
                    if (ref $$target_define_value[0] ne $is_hash) {
                        $target_class_var_define = create_kotlin_define($flag_kotlin_type_list_define, $flag_string_type, $empty, $target_define_name, $target_class_var_define);
                    } else {
                        $target_class_var_define = create_kotlin_define($flag_kotlin_type_list_define, $target_define_type, $target_suffix, $target_define_name, $target_class_var_define);
                    }
                } elsif (ref $target_define_value eq $is_hash) {
                    $target_class_var_define = create_kotlin_define($flag_kotlin_type_define, $target_define_type, $target_suffix, $target_define_name, $target_class_var_define);
                } elsif ($target_define_value =~ /^[+-]?\d+$/) {
                    $target_class_var_define = create_kotlin_define($flag_kotlin_type_define, $flag_int_type, $empty, $target_define_name, $target_class_var_define);
                } elsif ($target_define_value =~ /^-?(?:\d+(?:\.\d*)?|\.\d+)$/) {
                    $target_class_var_define = create_kotlin_define($flag_kotlin_type_define, $flag_double_type, $empty, $target_define_name, $target_class_var_define);
                } else {
                    $target_class_var_define = create_kotlin_define($flag_kotlin_type_define, $flag_string_type, $empty, $target_define_name, $target_class_var_define);
                }
            }

            $target_kotlin_block = create_kotlin_block($target_class_name, $target_suffix, $target_class_var_define, $target_kotlin_block)
        }
    }

    create_kotlin_file($target_path, $target_file_name, $target_suffix, $target_package, $target_copyright, $target_kotlin_block);
}

sub create_kotlin_define {
    my ($kotlin_define_type, $kotlin_type, $kotlin_suffix, $kotlin_var, $target_define) = @_;

    my $new_define = replace_string($kotlin_define_type, (
        $flag_type   => $kotlin_type,
        $flag_suffix => $kotlin_suffix,
        $flag_var    => $kotlin_var
    ));

    if ($target_define ne $empty) {
        $target_define = $target_define.$comma.$ln;
    }

    return $target_define.$new_define;
}

sub create_kotlin_block {
    my ($kotlin_class, $kotlin_suffix, $kotlin_define, $target_block) = @_;

    my $new_block = replace_string($flag_kotlin_block, (
        $flag_class  => $kotlin_class,
        $flag_suffix => $kotlin_suffix,
        $flag_define => $kotlin_define
    ));

    if ($target_block ne $empty) {
        $target_block = $target_block.$ln.$ln;
    }

    return $target_block.$new_block;
}

sub create_kotlin_file {
    my ($target_path, $target_file, $target_suffix, $target_package, $target_copyright, $target_kotlin_block) = @_;

    my $kotlin_file = replace_string($flag_kotlin_file, (
        $flag_package   => $target_package ne $empty ? $target_package : $default_package,
        $flag_copyright => $target_copyright ne $empty ? $target_copyright : $mit_license_android,
        $flag_block     => $target_kotlin_block
    ));

    $target_path = create_path($target_path, $kotlin_dir);

    create_file($target_path.$target_file.$target_suffix.$kotlin, $kotlin_file);
}

# -------------------------------------------------------------------------------------------------------------------- #

# sub generate_objc_file {
#     my ($target_path, $target_prefix, $target_suffix, $target_package, $target_copyright, @data) = @_;
#     my ($target_file_name, $target_objc_h_block, $target_objc_m_block) = ($empty, $empty, $empty);
#
#     if ($target_prefix eq $empty) {
#         $target_prefix = $default_prefix_fr;
#     }
#
#     foreach (reverse keys @data) {
#         my $data = $data[$_];
#
#         foreach my $target_class_name (keys %$data) {
#             if ($_ == 0) {
#                 $target_file_name = $target_class_name;
#             }
#             my ($target_class_value, $target_class_var_define) = ($$data{$target_class_name}, $empty);
#
#             foreach my $target_define_name (sort keys %$target_class_value) {
#                 (my $target_define_type, my $target_define_value) =
#                     ($target_class_name.camel_case($target_define_name), $$target_class_value{$target_define_name});
#
#                 if (ref $target_define_value eq $is_array) {
#                     $target_class_var_define = create_objc_define($flag_objc_h_type_list_define, $target_prefix, $target_define_type, $target_suffix, $target_define_name, $target_class_var_define);
#                 } elsif (ref $target_define_value eq $is_hash) {
#                     $target_class_var_define = create_objc_define($flag_objc_h_type_define, $target_prefix, $target_define_type, $target_suffix, $target_define_name, $target_class_var_define);
#                 } else {
#                     $target_class_var_define = create_objc_define($flag_objc_h_type_define, $default_prefix_ns, $flag_string_type, $empty, $target_define_name, $target_class_var_define);
#                 }
#             }
#
#             my @objc_block = create_objc_block($target_prefix, $target_class_name, $target_suffix, $target_class_var_define, $target_objc_h_block, $target_objc_m_block);
#             $target_objc_h_block = $objc_block[0];
#             $target_objc_m_block = $objc_block[1];
#         }
#     }
#
#     create_objc_file($target_path, $target_prefix, $target_file_name, $target_suffix, $target_copyright, $target_objc_h_block, $target_objc_m_block);
# }

sub generate_objc_file {
    my ($target_path, $target_prefix, $target_suffix, $target_package, $target_copyright, @data) = @_;
    my ($target_file_name, $target_class, $target_objc_h_block, $target_objc_m_block) = ($empty, $empty, $empty, $empty);

    if ($target_prefix eq $empty) {
        $target_prefix = $default_prefix_fr;
    }

    foreach (keys @data) {
        my $data = $data[$_];

        foreach my $target_class_name (keys %$data) {
            my ($target_class_value, $target_class_h_var_define, $target_class_m_var_define) = ($$data{$target_class_name}, $empty, $empty);

            foreach my $target_define_name (sort keys %$target_class_value) {
                (my $target_define_type, my $target_define_value) =
                    ($target_class_name.camel_case($target_define_name), $$target_class_value{$target_define_name});

                my @objc_define = ($target_class_h_var_define, $target_class_m_var_define);
                if (ref $target_define_value eq $is_array) {
                    if (ref $$target_define_value[0] ne $is_hash) {
                        @objc_define = create_objc_define($flag_objc_h_type_list_define, $flag_objc_m_type_list_define, $default_prefix_ns, $flag_string_type, $empty, $target_define_name, $target_class_h_var_define, $target_class_m_var_define);
                    } else {
                        @objc_define = create_objc_define($flag_objc_h_type_list_define, $flag_objc_m_type_list_define, $target_prefix, $target_define_type, $target_suffix, $target_define_name, $target_class_h_var_define, $target_class_m_var_define);
                    }
                } elsif (ref $target_define_value eq $is_hash) {
                    @objc_define = create_objc_define($flag_objc_h_type_define, $flag_objc_m_type_define, $target_prefix, $target_define_type, $target_suffix, $target_define_name, $target_class_h_var_define, $target_class_m_var_define);
                } elsif ($target_define_value =~ /^[+-]?\d+$/) {
                    @objc_define = create_objc_define($flag_objc_h_type_number_define, $flag_objc_m_type_number_define, $empty, $flag_objc_int_type, $empty, $target_define_name, $target_class_h_var_define, $target_class_m_var_define);
                } elsif ($target_define_value =~ /^-?(?:\d+(?:\.\d*)?|\.\d+)$/) {
                    @objc_define = create_objc_define($flag_objc_h_type_number_define, $flag_objc_m_type_number_define, $empty, $flag_objc_double_type, $empty, $target_define_name, $target_class_h_var_define, $target_class_m_var_define);
                } else {
                    @objc_define = create_objc_define($flag_objc_h_type_define, $flag_objc_m_type_define, $default_prefix_ns, $flag_string_type, $empty, $target_define_name, $target_class_h_var_define, $target_class_m_var_define);
                }
                $target_class_h_var_define = $objc_define[0];
                $target_class_m_var_define = $objc_define[1];
            }

            my @objc_block = create_objc_block($target_prefix, $target_class_name, $target_suffix, $target_class_h_var_define, $target_class_m_var_define, $target_objc_h_block, $target_objc_m_block);
            $target_objc_h_block = $objc_block[0];
            $target_objc_m_block = $objc_block[1];

            if ($_ == 0) {
                $target_file_name = $target_class_name;
            } else {
                $target_class = create_objc_class($target_prefix, $target_class_name, $target_suffix, $target_class);
            }
        }
    }

    create_objc_file($target_path, $target_prefix, $target_file_name, $target_suffix, $target_copyright, $target_class, $target_objc_h_block, $target_objc_m_block);
}

sub create_objc_define {
    my ($objc_h_define_type, $objc_m_define_type, $objc_prefix, $objc_type, $objc_suffix, $objc_var, $target_h_define, $target_m_define) = @_;

    my $new_h_define = replace_string($objc_h_define_type, (
        $flag_prefix => $objc_prefix,
        $flag_type   => $objc_type,
        $flag_suffix => $objc_suffix,
        $flag_var    => $objc_var
    ));

    my $new_m_define = replace_string($objc_m_define_type, (
        $flag_prefix => $objc_prefix,
        $flag_type   => $objc_type,
        $flag_suffix => $objc_suffix,
        $flag_var    => $objc_var
    ));

    if ($target_h_define ne $empty) {
        $target_h_define = $target_h_define.$ln;
    }

    if ($target_m_define ne $empty) {
        $target_m_define = $target_m_define.$ln;
    }

    return ($target_h_define.$new_h_define, $target_m_define.$new_m_define);
}

sub create_objc_block {
    my ($objc_prefix, $objc_class, $objc_suffix, $objc_h_define, $objc_m_define, $target_h_block, $target_m_block) = @_;

    my $new_h_block = replace_string($flag_objc_h_block, (
        $flag_prefix => $objc_prefix,
        $flag_class  => $objc_class,
        $flag_suffix => $objc_suffix,
        $flag_define => $objc_h_define
    ));

    my $new_m_block = replace_string($flag_objc_m_block, (
        $flag_prefix => $objc_prefix,
        $flag_class  => $objc_class,
        $flag_suffix => $objc_suffix,
        $flag_define => $objc_m_define
    ));

    if ($target_h_block ne $empty) {
        $target_h_block = $target_h_block.$ln.$ln;
    }

    if ($target_m_block ne $empty) {
        $target_m_block = $target_m_block.$ln.$ln;
    }

    return ($target_h_block.$new_h_block, $target_m_block.$new_m_block);
}

sub create_objc_class {
    my ($target_prefix, $target_class_name, $target_suffix, $target_class) = @_;

    $target_class_name = $target_prefix.$target_class_name.$target_suffix;
    if ($target_class ne $empty) {
        $target_class_name = $comma.$space.$target_class_name;
    }

    $target_class = $target_class.$target_class_name;

    return $target_class;
}

sub create_objc_file {
    my ($target_path, $target_prefix, $target_file, $target_suffix, $target_copyright, $target_class, $target_objc_h_block, $target_objc_m_block) = @_;

    my $objc_h_file = replace_string($flag_objc_h_file, (
        $flag_copyright => $target_copyright ne $empty ? $target_copyright : $mit_license_ios,
        $flag_class     => $target_class,
        $flag_block     => $target_objc_h_block
    ));

    my $objc_m_file = replace_string($flag_objc_m_file, (
        $flag_copyright => $target_copyright ne $empty ? $target_copyright : $mit_license_ios,
        $flag_prefix    => $target_prefix,
        $flag_class     => $target_file,
        $flag_suffix    => $target_suffix,
        $flag_block     => $target_objc_m_block
    ));

    $target_path = create_path($target_path, $objc_dir);

    create_file($target_path.$target_prefix.$target_file.$target_suffix.$objc_h, $objc_h_file);
    create_file($target_path.$target_prefix.$target_file.$target_suffix.$objc_m, $objc_m_file);
}

# -------------------------------------------------------------------------------------------------------------------- #

sub generate_swift_file {
    my ($target_path, $target_prefix, $target_suffix, $target_package, $target_copyright, @data) = @_;
    my ($target_file_name, $target_swift_block) = ($empty, $empty);

    foreach (keys @data) {
        my $data = $data[$_];

        foreach my $target_class_name (keys %$data) {
            if ($_ == 0) {
                $target_file_name = $target_class_name;
            }
            my ($target_class_value, $target_class_var_define) = ($$data{$target_class_name}, $empty);

            foreach my $target_define_name (sort keys %$target_class_value) {
                (my $target_define_type, my $target_define_value) =
                    ($target_class_name.camel_case($target_define_name), $$target_class_value{$target_define_name});

                if (ref $target_define_value eq $is_array) {
                    if (ref $$target_define_value[0] ne $is_hash) {
                        $target_class_var_define = create_swift_define($flag_swift_type_list_define, $flag_string_type, $empty, $target_define_name, $target_class_var_define);
                    } else {
                        $target_class_var_define = create_swift_define($flag_swift_type_list_define, $target_define_type, $target_suffix, $target_define_name, $target_class_var_define);
                    }
                } elsif (ref $target_define_value eq $is_hash) {
                    $target_class_var_define = create_swift_define($flag_swift_type_define, $target_define_type, $target_suffix, $target_define_name, $target_class_var_define);
                } elsif ($target_define_value =~ /^[+-]?\d+$/) {
                    $target_class_var_define = create_swift_define($flag_swift_type_define, $flag_int_type, $empty, $target_define_name, $target_class_var_define);
                } elsif ($target_define_value =~ /^-?(?:\d+(?:\.\d*)?|\.\d+)$/) {
                    $target_class_var_define = create_swift_define($flag_swift_type_define, $flag_double_type, $empty, $target_define_name, $target_class_var_define);
                } else {
                    $target_class_var_define = create_swift_define($flag_swift_type_define, $flag_string_type, $empty, $target_define_name, $target_class_var_define);
                }
            }

            $target_swift_block = create_swift_block($target_class_name, $target_suffix, $target_class_var_define, $target_swift_block)
        }
    }

    create_swift_file($target_path, $target_file_name, $target_suffix, $target_copyright, $target_swift_block);
}

sub create_swift_define {
    my ($swift_define_type, $swift_type, $swift_suffix, $swift_var, $target_define) = @_;

    my $new_define = replace_string($swift_define_type, (
        $flag_type   => $swift_type,
        $flag_suffix => $swift_suffix,
        $flag_var    => $swift_var
    ));

    if ($target_define ne $empty) {
        $target_define = $target_define.$ln;
    }

    return $target_define.$new_define;
}

sub create_swift_block {
    my ($swift_class, $swift_suffix, $swift_var_define, $target_block) = @_;

    my $new_block = replace_string($flag_swift_block, (
        $flag_class  => $swift_class,
        $flag_suffix => $swift_suffix,
        $flag_define => $swift_var_define
    ));

    if ($target_block ne $empty) {
        $target_block = $target_block.$ln.$ln;
    }

    return $target_block.$new_block;
}

sub create_swift_file {
    my ($target_path, $target_file, $target_suffix, $target_copyright, $target_swift_block) = @_;

    my $swift_file = replace_string($flag_swift_file, (
        $flag_copyright => $target_copyright ne $empty ? $target_copyright : $mit_license_ios,
        $flag_block     => $target_swift_block.$ln
    ));

    $target_path = create_path($target_path, $swift_dir);

    create_file($target_path.$target_file.$target_suffix.$swift, $swift_file);
}

# -------------------------------------------------------------------------------------------------------------------- #

sub camel_case {
    return String::CamelCase::camelize(ucfirst shift);
}

sub replace_string {
    my ($string, %replacement) = (shift, @_);

    my $regex = join "|", keys %replacement;
    $regex = qr/$regex/;
    $string =~ s/($regex)/$replacement{$1}/g;

    return $string;
}

sub create_path {
    my ($target_path, $target_dir) = @_;

    if ($target_path eq $empty) {
        $target_path = $def_dir;
    }
    $target_path = $target_path.$out_dir.$target_dir;

    File::Path::make_path($target_path);

    return $target_path;
}

sub create_file {
    open(my $fh, $write, shift) or die $error;
    print($fh shift);
    close($fh);
}

1;
