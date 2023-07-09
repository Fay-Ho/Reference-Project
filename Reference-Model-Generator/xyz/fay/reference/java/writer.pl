#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

# --------------------------------REPLACEMENT-----------------------------------

my $global_block = "%BLOCK%";

my $global_class = "%CLASS%";

my $global_defines = "%DEFINES%";

my $global_name = "%NAME%";

my $global_package = "%PACKAGE%";

my $global_params = "%PARAMS%";

my $global_var = "%VAR%";

# ---------------------------------Model.java-------------------------------------

my $java_file = "package %PACKAGE%;

import xyz.fay.parcel.Parcelable;
import xyz.fay.parcel.Parcelize;

\@Parcelize
public final class %CLASS% extends Parcelable {
%DEFINES%

    public %CLASS%(%PARAMS%) {
%BLOCK%
    }
}
";

my $java_map_define = "    private final %VAR% %NAME%;";

my $java_list_define = "    private final %VAR%[] %NAME%;";

my $java_param = "%VAR% %NAME%";

my $java_statement = "        this.%NAME% = %NAME%;";

# ---------------------------------------------------------------------------------

sub write {
    my $s_define = $java_map_define =~ s/$global_var/String/gr;
    $s_define = $s_define =~ s/$global_name/string/gr;

    my $s_param = $java_param =~ s/$global_var/String/gr;
    $s_param = $s_param =~ s/$global_name/string/gr;

    my $s_block = $java_statement =~ s/$global_name/string/gr;

    my $s_file = $java_file =~ s/$global_package/xyz.fay.reference/gr;
    $s_file = $s_file =~ s/$global_class/Model/gr;
    $s_file = $s_file =~ s/$global_defines/$s_define/gr;
    $s_file = $s_file =~ s/$global_params/$s_param/gr;
    $s_file = $s_file =~ s/$global_block/$s_block/gr;

    print($s_file);
}
