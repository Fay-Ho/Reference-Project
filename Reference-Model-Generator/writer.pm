package writer;
use strict;
use warnings FATAL => 'all';

use File::Path;

push(@INC, 'pwd');

# -------------------------------------------------------------------------------------------------------------------- #

my $ln = "\n";

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

my $flag_java_file = "package %PACKAGE%;

import xyz.fay.parcel.Parcelable;
import xyz.fay.parcel.Parcelize;

\@Parcelize
public final class %CLASS% extends Parcelable {
%DEFINE%

    public %CLASS%(%PARAM%) {
%BLOCK%
    }
}
";

my $flag_java_type_define = "    private final %TYPE% %VAR%;";

my $flag_java_type_list_define = "    private final %TYPE%[] %VAR%;";

my $flag_java_type_param = "%TYPE% %VAR%";

my $flag_java_type_list_param = "%TYPE%[] %VAR%";

my $flag_java_block = "        this.%VAR% = %VAR%;";

# -------------------------------------------------------------------------------------------------------------------- #

my $flag_kotlin_file = "package %PACKAGE%

import android.os.Parcelable
import kotlinx.parcelize.Parcelize

%BLOCK%";

my $flag_kotlin_block = "\@Parcelize
data class %CLASS%(
%DEFINE%
) : Parcelable";

my $flag_kotlin_type_define = "        val %VAR%: %TYPE%";

my $flag_kotlin_type_list_define = "        val %VAR%: Array<%TYPE%>";

# -------------------------------------------------------------------------------------------------------------------- #

my $flag_objc_h_file = "#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

%BLOCK%

NS_ASSUME_NONNULL_END
";

my $flag_objc_h_block = "\@interface %PREFIX%%CLASS% : NSObject

%DEFINE%

\@end";

my $flag_objc_h_type_define = "\@property (nonatomic, strong, nonnull) %TYPE% *%VAR%;";

my $flag_objc_h_type_list_define = "\@property (nonatomic, strong, nonnull) NSArray<%TYPE% *> *%VAR%;";

my $flag_objc_m_file = "#import \"%PREFIX%%CLASS%.h\"

%BLOCK%
";

my $flag_objc_m_block = "\@implementation %PREFIX%%CLASS%

\@end";

# -------------------------------------------------------------------------------------------------------------------- #

my $flag_swift_block = "struct %CLASS% : Codable {
%DEFINE%
}";

my $flag_swift_type_define = "    let %VAR%: %TYPE%";

my $flag_swift_type_list_define = "    let %VAR%: [%TYPE%]";

# -------------------------------------------------------------------------------------------------------------------- #

sub generate_java {
    my $target_suffix = pop;
    my $target_prefix = pop;
    my $target_path = pop;
    my @data = @_;

    foreach my $data (@data) {
        foreach my $target_file (keys(%$data)) {
            my $value = $$data{$target_file};
            my $target_define = '';
            my $target_param = '';
            my $target_block = '';

            foreach my $sub_key (sort (keys(%$value))) {
                my $sub_value = $$value{$sub_key};

                if (ref $sub_value eq 'ARRAY') {
                    $target_define = create_java_define($flag_java_type_list_define, ucfirst $sub_key, $sub_key, $target_define);
                    $target_param = create_java_param($flag_java_type_list_param, ucfirst $sub_key, $sub_key, $target_param);
                    $target_block = create_java_block($sub_key, $target_block);
                } elsif (ref $sub_value eq 'HASH') {
                    $target_define = create_java_define($flag_java_type_define, ucfirst $sub_key, $sub_key, $target_define);
                    $target_param = create_java_param($flag_java_type_param, ucfirst $sub_key, $sub_key, $target_param);
                    $target_block = create_java_block($sub_key, $target_block);
                } else {
                    $target_define = create_java_define($flag_java_type_define, 'String', $sub_key, $target_define);
                    $target_param = create_java_param($flag_java_type_param, 'String', $sub_key, $target_param);
                    $target_block = create_java_block($sub_key, $target_block);
                }
            }

            my $file = $flag_java_file =~ s/$flag_package/xyz.fay.reference/gr;
            my $java_class = ucfirst $target_file;
            $file = $file =~ s/$flag_class/$java_class/gr;
            $file = $file =~ s/$flag_define/$target_define/gr;
            $file = $file =~ s/$flag_param/$target_param/gr;
            $file = $file =~ s/$flag_block/$target_block/gr;

            create_java_file($target_path, $java_class, $file);
        }
    }
}

sub create_java_define {
    my $java_define = shift;
    my $java_type = shift;
    my $java_var = shift;
    my $target_define = shift;

    my $define = $java_define =~ s/$flag_type/$java_type/gr;
    $define = $define =~ s/$flag_var/$java_var/gr;

    if ($target_define ne '') {
        $target_define = $target_define.$ln;
    }

    return($target_define.$define);
}

sub create_java_param {
    my $java_param = shift;
    my $java_type = shift;
    my $java_var = shift;
    my $target_param = shift;

    my $param = $java_param =~ s/$flag_type/$java_type/gr;
    $param = $param =~ s/$flag_var/$java_var/gr;

    if ($target_param ne '') {
        $target_param = $target_param.", ";
    }

    return($target_param.$param);
}

sub create_java_block {
    my $java_var = shift;
    my $target_block = shift;

    my $block = $flag_java_block =~ s/$flag_var/$java_var/gr;

    if ($target_block ne '') {
        $target_block = $target_block.$ln;
    }

    return($target_block.$block);
}

sub create_java_file {
    my $path = shift;
    if ($path eq '') {
        $path = './';
    }
    my $target_path = $path.'/out/java/';
    File::Path::make_path($target_path);

    my $target_file = shift;

    open(my $fh, '>', $target_path.$target_file.'.java') or die 'Something went wrong! Write file error!';
    print($fh shift);
    close($fh);
}

# -------------------------------------------------------------------------------------------------------------------- #

sub generate_kotlin {
    my $target_suffix = pop;
    my $target_prefix = pop;
    my $target_path = pop;
    my $target_file = '';
    my $target_block = '';
    my @data = @_;

    foreach (keys @data) {
        my $data = $data[$_];

        foreach my $key (keys(%$data)) {
            if ($_ == 0) {
                $target_file = ucfirst $key;
            }
            my $value = $$data{$key};
            my $target_define = '';

            foreach my $sub_key (sort(keys(%$value))) {
                my $sub_value = $$value{$sub_key};

                if (ref $sub_value eq 'ARRAY') {
                    $target_define = create_kotlin_define($flag_kotlin_type_list_define, ucfirst $sub_key, $sub_key, $target_define);
                } elsif (ref $sub_value eq 'HASH') {
                    $target_define = create_kotlin_define($flag_kotlin_type_define, ucfirst $sub_key, $sub_key, $target_define);
                } else {
                    $target_define = create_kotlin_define($flag_kotlin_type_define, 'String', $sub_key, $target_define);
                }
            }

            $target_block = create_kotlin_block(ucfirst $key, $target_define, $target_block)
        }
    }

    my $file = $flag_kotlin_file =~ s/$flag_package/xyz.fay.reference/gr;
    $file = $file =~ s/$flag_block/$target_block\n/gr;

    create_kotlin_file($target_path, $target_file, $file);
}

sub create_kotlin_define {
    my $kotlin_define = shift;
    my $kotlin_type = shift;
    my $kotlin_var = shift;
    my $target_define = shift;

    my $define = $kotlin_define =~ s/$flag_type/$kotlin_type/gr;
    $define = $define =~ s/$flag_var/$kotlin_var/gr;

    if ($target_define ne '') {
        $target_define = $target_define.",\n";
    }

    return($target_define.$define);
}

sub create_kotlin_block {
    my $kotlin_class = shift;
    my $kotlin_define = shift;
    my $target_block = shift;

    my $block = $flag_kotlin_block =~ s/$flag_class/$kotlin_class/gr;
    $block = $block =~ s/$flag_define/$kotlin_define/gr;

    if ($target_block ne '') {
        $target_block = $target_block.$ln.$ln;
    }

    return($target_block.$block);
}

sub create_kotlin_file {
    my $path = shift;
    if ($path eq '') {
        $path = './';
    }
    my $target_path = $path.'/out/kotlin/';
    File::Path::make_path($target_path);

    my $target_file = shift;

    open(my $fh, '>', $target_path.$target_file.'.kt') or die 'Something went wrong! Write file error!';
    print($fh shift);
    close($fh);
}

# -------------------------------------------------------------------------------------------------------------------- #

sub generate_objc {
    my $target_suffix = pop;
    my $target_prefix = uc pop;
    my $target_path = pop;
    my $target_file = '';
    my $target_h_block = '';
    my $target_m_block = '';
    my @data = @_;

    if ($target_prefix eq '') {
        $target_prefix = 'FR';
    }

    foreach (reverse keys @data) {
        my $data = $data[$_];

        foreach my $key (keys(%$data)) {
            if ($_ == 0) {
                $target_file = ucfirst $key;
            }
            my $value = $$data{$key};
            my $target_define = '';

            foreach my $sub_key (sort(keys(%$value))) {
                my $sub_value = $$value{$sub_key};

                if (ref $sub_value eq 'ARRAY') {
                    $target_define = create_objc_define($flag_objc_h_type_list_define, $target_prefix.ucfirst $sub_key, $sub_key, $target_define);
                } elsif (ref $sub_value eq 'HASH') {
                    $target_define = create_objc_define($flag_objc_h_type_define, $target_prefix.ucfirst $sub_key, $sub_key, $target_define);
                } else {
                    $target_define = create_objc_define($flag_objc_h_type_define, 'String', $sub_key, $target_define);
                }
            }

            my @block = create_objc_block($target_prefix, ucfirst $key, $target_define, $target_h_block, $target_m_block);
            $target_h_block = $block[0];
            $target_m_block = $block[1];
        }
    }

    my $h_file = $flag_objc_h_file =~ s/$flag_block/$target_h_block/gr;
    my $m_file = $flag_objc_m_file =~ s/$flag_prefix/$target_prefix/gr;
    $m_file = $m_file =~ s/$flag_class/$target_file/gr;
    $m_file = $m_file =~ s/$flag_block/$target_m_block/gr;

    create_objc_file($target_path, $target_prefix, $target_file, $h_file, $m_file);
}

sub create_objc_define {
    my $h_define = shift;
    my $h_type = shift;
    my $h_var = shift;
    my $target_define = shift;

    my $define = $h_define =~ s/$flag_type/$h_type/gr;
    $define = $define =~ s/$flag_var/$h_var/gr;

    if ($target_define ne '') {
        $target_define = $target_define.",\n";
    }

    return($target_define.$define);
}

sub create_objc_block {
    my $objc_prefix = shift;
    my $objc_class = shift;
    my $h_define = shift;
    my $target_h_block = shift;
    my $target_m_block = shift;

    my $h_block = $flag_objc_h_block =~ s/$flag_prefix/$objc_prefix/gr;
    $h_block = $h_block =~ s/$flag_class/$objc_class/gr;
    $h_block = $h_block =~ s/$flag_define/$h_define/gr;

    if ($target_h_block ne '') {
        $target_h_block = $target_h_block.$ln.$ln;
    }

    my $m_block = $flag_objc_m_block =~ s/$flag_prefix/$objc_prefix/gr;
    $m_block = $m_block =~ s/$flag_class/$objc_class/gr;

    if ($target_m_block ne '') {
        $target_m_block = $target_m_block.$ln.$ln;
    }

    return($target_h_block.$h_block, $target_m_block.$m_block);
}

sub create_objc_file {
    my $path = shift;
    if ($path eq '') {
        $path = './';
    }
    my $target_path = $path.'/out/objc/';
    File::Path::make_path($target_path);

    my $target_prefix = shift;
    my $target_file = shift;

    open(my $h_fh, '>', $target_path.$target_prefix.$target_file.'.h') or die 'Something went wrong! Write file error!';
    print($h_fh shift);
    close($h_fh);

    open(my $m_fh, '>', $target_path.$target_prefix.$target_file.'.m') or die 'Something went wrong! Write file error!';
    print($m_fh shift);
    close($m_fh);
}

# -------------------------------------------------------------------------------------------------------------------- #

sub generate_swift {
    my $target_suffix = pop;
    my $target_prefix = pop;
    my $target_path = pop;
    my $target_file = '';
    my $target_block = '';
    my @data = @_;

    foreach (keys @data) {
        my $data = $data[$_];

        foreach my $swift_class (keys(%$data)) {
            if ($_ == 0) {
                $target_file = ucfirst $swift_class;
            }
            my $value = $$data{$swift_class};
            my $target_define = '';

            foreach my $sub_key (sort(keys(%$value))) {
                my $sub_value = $$value{$sub_key};

                if (ref $sub_value eq 'ARRAY') {
                    $target_define = create_swift_define($flag_swift_type_list_define, ucfirst $sub_key, $sub_key, $target_define);
                } elsif (ref $sub_value eq 'HASH') {
                    $target_define = create_swift_define($flag_swift_type_define, ucfirst $sub_key, $sub_key, $target_define);
                } else {
                    $target_define = create_swift_define($flag_swift_type_define, 'String', $sub_key, $target_define);
                }
            }

            $target_block = create_swift_block(ucfirst $swift_class, $target_define, $target_block)
        }
    }

    my $file = $target_block.$ln;

    create_swift_file($target_path, $target_file, $file);
}

sub create_swift_define {
    my $swift_define = shift;
    my $swift_type = shift;
    my $swift_var = shift;
    my $target_define = shift;

    my $define = $swift_define =~ s/$flag_type/$swift_type/gr;
    $define = $define =~ s/$flag_var/$swift_var/gr;

    if ($target_define ne '') {
        $target_define = $target_define.$ln.$ln;
    }

    return($target_define.$define);
}

sub create_swift_block {
    my $swift_class = shift;
    my $swift_define = shift;
    my $target_block = shift;

    my $block = $flag_swift_block =~ s/$flag_class/$swift_class/gr;
    $block = $block =~ s/$flag_define/$swift_define/gr;

    if ($target_block ne '') {
        $target_block = $target_block.$ln.$ln;
    }

    return($target_block.$block);
}

sub create_swift_file {
    my $path = shift;
    if ($path eq '') {
        $path = './';
    }
    my $target_path = $path.'/out/swift/';
    File::Path::make_path($target_path);

    my $target_file = shift;

    open(my $fh, '>', $target_path.$target_file.'swift') or die 'Something went wrong! Write file error!';
    print($fh shift);
    close($fh);
}

# -------------------------------------------------------------------------------------------------------------------- #

1;
