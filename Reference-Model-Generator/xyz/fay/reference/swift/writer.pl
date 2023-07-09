#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

# --------------------------------REPLACEMENT-----------------------------------

my $global_block = "%BLOCK%";

my $global_class = "%CLASS%";

my $global_defines = "%DEFINES%";

my $global_name = "%NAME%";

my $global_var = "%VAR%";

# ---------------------------------Model.swift-------------------------------------

my $swift_file = "%BLOCK%
";

my $swift_block = "struct %CLASS% : Codable {
%DEFINES%
}";

my $swift_define = "    let %NAME%: %VAR%";

# ---------------------------------------------------------------------------------

sub write {
    my $s_define_1 = $swift_define =~ s/$global_name/string/gr;
    $s_define_1 = $s_define_1 =~ s/$global_var/String/gr;

    my $s_block_1 = $swift_block =~ s/$global_class/Model/gr;
    $s_block_1 = $s_block_1 =~ s/$global_defines/$s_define_1/gr;

    my $s_define_2 = $swift_define =~ s/$global_name/string/gr;
    $s_define_2 = $s_define_2 =~ s/$global_var/String/gr;

    my $s_block_2 = $swift_block =~ s/$global_class/Model/gr;
    $s_block_2 = $s_block_2 =~ s/$global_defines/$s_define_2/gr;

    my $s_block = $s_block_1."\n\n".$s_block_2;

    my $s_file = $swift_file =~ s/$global_block/$s_block/gr;

    print($s_file);
}
