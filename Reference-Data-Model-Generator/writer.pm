package writer;
use strict;
use warnings FATAL => 'all';

use File::Path;

push(@INC, 'pwd');

# -------------------------------------------------------------------------------------------------------------------- #

my $ln = "\n";

my $empty = '';

my $read = '<';

my $write = '>';

my $string = 'String';

my $array = 'ARRAY';

my $hash = 'HASH';

my $out_java = '/out/java/';

my $java = '.java';

my $out_kotlin = '/out/kotlin/';

my $kotlin = '.kt';

my $out_objc = '/out/objc/';

my $objc_h = '.h';

my $objc_m = '.m';

my $out_swift = '/out/swift/';

my $swift = '.swift';

my $error = 'Something went wrong! Write file error!';

my $prefix = 'FR';

my $package = 'xyz.fay.reference';

# -------------------------------------------------------------------------------------------------------------------- #

my $flag_block = "%BLOCK%";

my $flag_class = "%CLASS%";

my $flag_define = "%DEFINE%";

my $flag_package = "%PACKAGE%";

my $flag_param = "%PARAM%";

my $flag_prefix = "%PREFIX%";

my $flag_suffix = "%SUFFIX%";

my $flag_type = "%TYPE%";

my $flag_var = "%VAR%";

# -------------------------------------------------------------------------------------------------------------------- #

my $flag_java_file = "package $flag_package;

import xyz.fay.parcel.Parcelable;
import xyz.fay.parcel.Parcelize;

\@Parcelize
public final class $flag_class$flag_suffix extends Parcelable {
$flag_define

    public $flag_class$flag_suffix($flag_param) {
$flag_block
    }
}
";

my $flag_java_type_define = "    private final $flag_type$flag_suffix $flag_var;";

my $flag_java_type_list_define = "    private final $flag_type$flag_suffix\[] $flag_var;";

my $flag_java_type_param = "$flag_type$flag_suffix $flag_var";

my $flag_java_type_list_param = "$flag_type$flag_suffix\[] $flag_var";

my $flag_java_block = "        this.$flag_var = $flag_var;";

# -------------------------------------------------------------------------------------------------------------------- #

my $flag_kotlin_file = "package $flag_package

import android.os.Parcelable
import kotlinx.parcelize.Parcelize

$flag_block";

my $flag_kotlin_block = "\@Parcelize
data class $flag_class$flag_suffix(
$flag_define
) : Parcelable";

my $flag_kotlin_type_define = "        val $flag_var: $flag_type$flag_suffix";

my $flag_kotlin_type_list_define = "        val $flag_var: Array<$flag_type$flag_suffix>";

# -------------------------------------------------------------------------------------------------------------------- #

my $flag_objc_h_file = "#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

$flag_block

NS_ASSUME_NONNULL_END
";

my $flag_objc_h_block = "\@interface $flag_prefix$flag_class$flag_suffix : NSObject

$flag_define

\@end";

my $flag_objc_h_type_define = "\@property (nonatomic, strong, nonnull) $flag_prefix$flag_type$flag_suffix *$flag_var;";

my $flag_objc_h_type_list_define = "\@property (nonatomic, strong, nonnull) NSArray<$flag_prefix$flag_type$flag_suffix *> *$flag_var;";

my $flag_objc_m_file = "#import \"$flag_prefix$flag_class$flag_suffix.h\"

$flag_block
";

my $flag_objc_m_block = "\@implementation $flag_prefix$flag_class$flag_suffix

\@end";

# -------------------------------------------------------------------------------------------------------------------- #

my $flag_swift_block = "struct $flag_class$flag_suffix : Codable {
$flag_define
}";

my $flag_swift_type_define = "    let $flag_var: $flag_type$flag_suffix";

my $flag_swift_type_list_define = "    let $flag_var: [$flag_type$flag_suffix]";

# -------------------------------------------------------------------------------------------------------------------- #

sub generate_java {
    my $target_suffix = ucfirst pop;
    my $target_prefix = pop;
    my $target_path = pop;
    my @data = @_;

    foreach my $data (@data) {
        foreach my $target_file (keys(%$data)) {
            my $value = $$data{$target_file};
            my $target_define = $empty;
            my $target_param = $empty;
            my $target_block = $empty;

            foreach my $sub_key (sort (keys(%$value))) {
                my $sub_value = $$value{$sub_key};

                if (ref $sub_value eq $array) {
                    $target_define = create_java_define($flag_java_type_list_define, ucfirst $sub_key, $target_suffix, $sub_key, $target_define);
                    $target_param = create_java_param($flag_java_type_list_param, ucfirst $sub_key, $target_suffix, $sub_key, $target_param);
                    $target_block = create_java_block($sub_key, $target_block);
                } elsif (ref $sub_value eq $hash) {
                    $target_define = create_java_define($flag_java_type_define, ucfirst $sub_key, $target_suffix, $sub_key, $target_define);
                    $target_param = create_java_param($flag_java_type_param, ucfirst $sub_key, $target_suffix, $sub_key, $target_param);
                    $target_block = create_java_block($sub_key, $target_block);
                } else {
                    $target_define = create_java_define($flag_java_type_define, $string, $empty, $sub_key, $target_define);
                    $target_param = create_java_param($flag_java_type_param, $string, $empty, $sub_key, $target_param);
                    $target_block = create_java_block($sub_key, $target_block);
                }
            }

            my $file = $flag_java_file =~ s/$flag_package/$package/gr;
            my $java_class = ucfirst $target_file;
            $file = $file =~ s/$flag_class/$java_class/gr;
            $file = $file =~ s/$flag_suffix/$target_suffix/gr;
            $file = $file =~ s/$flag_define/$target_define/gr;
            $file = $file =~ s/$flag_param/$target_param/gr;
            $file = $file =~ s/$flag_block/$target_block/gr;

            create_java_file($target_path, $java_class, $target_suffix, $file);
        }
    }
}

sub create_java_define {
    my $java_define = shift;
    my $java_type = shift;
    my $java_suffix = shift;
    my $java_var = shift;
    my $target_define = shift;

    my $define = $java_define =~ s/$flag_type/$java_type/gr;
    $define = $define =~ s/$flag_suffix/$java_suffix/gr;
    $define = $define =~ s/$flag_var/$java_var/gr;

    if ($target_define ne $empty) {
        $target_define = $target_define.$ln;
    }

    return $target_define.$define;
}

sub create_java_param {
    my $java_param = shift;
    my $java_type = shift;
    my $java_suffix = shift;
    my $java_var = shift;
    my $target_param = shift;

    my $param = $java_param =~ s/$flag_type/$java_type/gr;
    $param = $param =~ s/$flag_suffix/$java_suffix/gr;
    $param = $param =~ s/$flag_var/$java_var/gr;

    if ($target_param ne $empty) {
        $target_param = $target_param.", ";
    }

    return $target_param.$param;
}

sub create_java_block {
    my $java_var = shift;
    my $target_block = shift;

    my $block = $flag_java_block =~ s/$flag_var/$java_var/gr;

    if ($target_block ne $empty) {
        $target_block = $target_block.$ln;
    }

    return $target_block.$block;
}

sub create_java_file {
    my $path = shift;
    if ($path eq $empty) {
        $path = './';
    }
    my $target_path = $path.$out_java;
    File::Path::make_path($target_path);

    my $target_file = shift;
    my $target_suffix = shift;

    create_file($target_path.$target_file.$target_suffix.$java, shift);
}

# -------------------------------------------------------------------------------------------------------------------- #

sub generate_kotlin {
    my $target_suffix = ucfirst pop;
    my $target_prefix = pop;
    my $target_path = pop;
    my $target_file = $empty;
    my $target_block = $empty;
    my @data = @_;

    foreach (keys @data) {
        my $data = $data[$_];

        foreach my $key (keys(%$data)) {
            if ($_ == 0) {
                $target_file = ucfirst $key;
            }
            my $value = $$data{$key};
            my $target_define = $empty;

            foreach my $sub_key (sort(keys(%$value))) {
                my $sub_value = $$value{$sub_key};

                if (ref $sub_value eq $array) {
                    $target_define = create_kotlin_define($flag_kotlin_type_list_define, ucfirst $sub_key, $target_suffix, $sub_key, $target_define);
                } elsif (ref $sub_value eq $hash) {
                    $target_define = create_kotlin_define($flag_kotlin_type_define, ucfirst $sub_key, $target_suffix, $sub_key, $target_define);
                } else {
                    $target_define = create_kotlin_define($flag_kotlin_type_define, $string, $empty, $sub_key, $target_define);
                }
            }

            $target_block = create_kotlin_block(ucfirst $key, $target_suffix, $target_define, $target_block)
        }
    }

    my $file = $flag_kotlin_file =~ s/$flag_package/$package/gr;
    $file = $file =~ s/$flag_block/$target_block\n/gr;

    create_kotlin_file($target_path, $target_file, $target_suffix, $file);
}

sub create_kotlin_define {
    my $kotlin_define = shift;
    my $kotlin_type = shift;
    my $kotlin_suffix = shift;
    my $kotlin_var = shift;
    my $target_define = shift;

    my $define = $kotlin_define =~ s/$flag_type/$kotlin_type/gr;
    $define = $define =~ s/$flag_suffix/$kotlin_suffix/gr;
    $define = $define =~ s/$flag_var/$kotlin_var/gr;

    if ($target_define ne $empty) {
        $target_define = $target_define.",\n";
    }

    return $target_define.$define;
}

sub create_kotlin_block {
    my $kotlin_class = shift;
    my $kotlin_suffix = shift;
    my $kotlin_define = shift;
    my $target_block = shift;

    my $block = $flag_kotlin_block =~ s/$flag_class/$kotlin_class/gr;
    $block = $block =~ s/$flag_suffix/$kotlin_suffix/gr;
    $block = $block =~ s/$flag_define/$kotlin_define/gr;

    if ($target_block ne $empty) {
        $target_block = $target_block.$ln.$ln;
    }

    return $target_block.$block;
}

sub create_kotlin_file {
    my $path = shift;
    if ($path eq $empty) {
        $path = './';
    }
    my $target_path = $path.$out_kotlin;
    File::Path::make_path($target_path);

    my $target_file = shift;
    my $target_suffix = shift;

    create_file($target_path.$target_file.$target_suffix.$kotlin, shift);
}

# -------------------------------------------------------------------------------------------------------------------- #

sub generate_objc {
    my $target_suffix = ucfirst pop;
    my $target_prefix = uc pop;
    my $target_path = pop;
    my $target_file = $empty;
    my $target_h_block = $empty;
    my $target_m_block = $empty;
    my @data = @_;

    if ($target_prefix eq $empty) {
        $target_prefix = $prefix;
    }

    foreach (reverse keys @data) {
        my $data = $data[$_];

        foreach my $key (keys(%$data)) {
            if ($_ == 0) {
                $target_file = ucfirst $key;
            }
            my $value = $$data{$key};
            my $target_define = $empty;

            foreach my $sub_key (sort(keys(%$value))) {
                my $sub_value = $$value{$sub_key};

                if (ref $sub_value eq $array) {
                    $target_define = create_objc_h_define($flag_objc_h_type_list_define, $target_prefix, ucfirst $sub_key, $target_suffix, $sub_key, $target_define);
                } elsif (ref $sub_value eq $hash) {
                    $target_define = create_objc_h_define($flag_objc_h_type_define, $target_prefix, ucfirst $sub_key, $target_suffix, $sub_key, $target_define);
                } else {
                    $target_define = create_objc_h_define($flag_objc_h_type_define, $empty, $string, $empty, $sub_key, $target_define);
                }
            }

            my @block = create_objc_block($target_prefix, ucfirst $key, $target_suffix, $target_define, $target_h_block, $target_m_block);
            $target_h_block = $block[0];
            $target_m_block = $block[1];
        }
    }

    my $h_file = $flag_objc_h_file =~ s/$flag_block/$target_h_block/gr;
    my $m_file = $flag_objc_m_file =~ s/$flag_prefix/$target_prefix/gr;
    $m_file = $m_file =~ s/$flag_class/$target_file/gr;
    $m_file = $m_file =~ s/$flag_suffix/$target_suffix/gr;
    $m_file = $m_file =~ s/$flag_block/$target_m_block/gr;

    create_objc_file($target_path, $target_prefix, $target_file, $target_suffix, $h_file, $m_file);
}

sub create_objc_h_define {
    my $h_define = shift;
    my $h_prefix = shift;
    my $h_type = shift;
    my $h_suffix = shift;
    my $h_var = shift;
    my $target_define = shift;

    my $define = $h_define =~ s/$flag_prefix/$h_prefix/gr;
    $define = $define =~ s/$flag_type/$h_type/gr;
    $define = $define =~ s/$flag_suffix/$h_suffix/gr;
    $define = $define =~ s/$flag_var/$h_var/gr;

    if ($target_define ne $empty) {
        $target_define = $target_define.",\n";
    }

    return $target_define.$define;
}

sub create_objc_block {
    my $objc_prefix = shift;
    my $objc_class = shift;
    my $objc_suffix = shift;
    my $h_define = shift;
    my $target_h_block = shift;
    my $target_m_block = shift;

    my $h_block = $flag_objc_h_block =~ s/$flag_prefix/$objc_prefix/gr;
    $h_block = $h_block =~ s/$flag_class/$objc_class/gr;
    $h_block = $h_block =~ s/$flag_suffix/$objc_suffix/gr;
    $h_block = $h_block =~ s/$flag_define/$h_define/gr;

    if ($target_h_block ne $empty) {
        $target_h_block = $target_h_block.$ln.$ln;
    }

    my $m_block = $flag_objc_m_block =~ s/$flag_prefix/$objc_prefix/gr;
    $m_block = $m_block =~ s/$flag_class/$objc_class/gr;
    $m_block = $m_block =~ s/$flag_suffix/$objc_suffix/gr;
    $m_block = $m_block =~ s/$flag_suffix/$objc_suffix/gr;

    if ($target_m_block ne $empty) {
        $target_m_block = $target_m_block.$ln.$ln;
    }

    return $target_h_block.$h_block, $target_m_block.$m_block;
}

sub create_objc_file {
    my $path = shift;
    if ($path eq $empty) {
        $path = './';
    }
    my $target_path = $path.$out_objc;
    File::Path::make_path($target_path);

    my $target_prefix = shift;
    my $target_file = shift;
    my $target_suffix = shift;

    create_file($target_path.$target_prefix.$target_file.$target_suffix.$objc_h, shift);
    create_file($target_path.$target_prefix.$target_file.$target_suffix.$objc_m, shift);
}

# -------------------------------------------------------------------------------------------------------------------- #

sub generate_swift {
    my $target_suffix = ucfirst pop;
    my $target_prefix = pop;
    my $target_path = pop;
    my $target_file = $empty;
    my $target_block = $empty;
    my @data = @_;

    foreach (keys @data) {
        my $data = $data[$_];

        foreach my $swift_class (keys(%$data)) {
            if ($_ == 0) {
                $target_file = ucfirst $swift_class;
            }
            my $value = $$data{$swift_class};
            my $target_define = $empty;

            foreach my $sub_key (sort(keys(%$value))) {
                my $sub_value = $$value{$sub_key};

                if (ref $sub_value eq $array) {
                    $target_define = create_swift_define($flag_swift_type_list_define, ucfirst $sub_key, $target_suffix, $sub_key, $target_define);
                } elsif (ref $sub_value eq $hash) {
                    $target_define = create_swift_define($flag_swift_type_define, ucfirst $sub_key, $target_suffix, $sub_key, $target_define);
                } else {
                    $target_define = create_swift_define($flag_swift_type_define, $string, $empty, $sub_key, $target_define);
                }
            }

            $target_block = create_swift_block(ucfirst $swift_class, $target_suffix, $target_define, $target_block)
        }
    }

    my $file = $target_block.$ln;

    create_swift_file($target_path, $target_file, $target_suffix, $file);
}

sub create_swift_define {
    my $swift_define = shift;
    my $swift_type = shift;
    my $swift_suffix = shift;
    my $swift_var = shift;
    my $target_define = shift;

    my $define = $swift_define =~ s/$flag_type/$swift_type/gr;
    $define = $define =~ s/$flag_suffix/$swift_suffix/gr;
    $define = $define =~ s/$flag_var/$swift_var/gr;

    if ($target_define ne $empty) {
        $target_define = $target_define.$ln.$ln;
    }

    return $target_define.$define;
}

sub create_swift_block {
    my $swift_class = shift;
    my $swift_suffix = shift;
    my $swift_define = shift;
    my $target_block = shift;

    my $block = $flag_swift_block =~ s/$flag_class/$swift_class/gr;
    $block = $block =~ s/$flag_suffix/$swift_suffix/gr;
    $block = $block =~ s/$flag_define/$swift_define/gr;

    if ($target_block ne $empty) {
        $target_block = $target_block.$ln.$ln;
    }

    return $target_block.$block;
}

sub create_swift_file {
    my $path = shift;
    if ($path eq $empty) {
        $path = './';
    }
    my $target_path = $path.$out_swift;
    File::Path::make_path($target_path);

    my $target_file = shift;
    my $target_suffix = shift;

    create_file($target_path.$target_file.$target_suffix.$swift, shift);
}

# -------------------------------------------------------------------------------------------------------------------- #

sub create_file {
    open(my $fh, $write, shift) or die $error;
    print($fh shift);
    close($fh);
}

1;
