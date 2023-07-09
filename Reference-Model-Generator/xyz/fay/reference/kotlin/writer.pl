#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

# --------------------------------REPLACEMENT-----------------------------------

my $global_block = "%BLOCK%";

my $global_class = "%CLASS%";

my $global_defines = "%DEFINES%";

my $global_name = "%NAME%";

my $global_package = "%PACKAGE%";

my $global_var = "%VAR%";

# ---------------------------------Model.kt-------------------------------------

my $kt_file = "package %PACKAGE%

import android.os.Parcelable
import kotlinx.parcelize.Parcelize

%BLOCK%
";

my $kt_block = "\@Parcelize
data class %CLASS%(
%DEFINES%
) : Parcelable";

my $kt_map_define = "        val %NAME%: %VAR%";

my $kt_list_define = "        val %NAME%: Array<%VAR%>";

# ---------------------------------------------------------------------------------

sub write {
    my $s_define_1 = $kt_map_define =~ s/$global_name/string/gr;
    $s_define_1 = $s_define_1 =~ s/$global_var/String/gr;

    my $s_block_1 = $kt_block =~ s/$global_class/Model/gr;
    $s_block_1 = $s_block_1 =~ s/$global_defines/$s_define_1/gr;

    my $s_define_2 = $kt_map_define =~ s/$global_name/string/gr;
    $s_define_2 = $s_define_2 =~ s/$global_var/String/gr;

    my $s_block_2 = $kt_block =~ s/$global_class/Model/gr;
    $s_block_2 = $s_block_2 =~ s/$global_defines/$s_define_2/gr;

    my $s_block = $s_block_1."\n\n".$s_block_2;

    my $s_file = $kt_file =~ s/$global_package/xyz.fay.reference/gr;
    $s_file = $s_file =~ s/$global_block/$s_block/gr;

    print($s_file);
}
