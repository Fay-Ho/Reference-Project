#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

# --------------------------------REPLACEMENT-----------------------------------

my $global_block = "%BLOCK%";

my $global_class = "%CLASS%";

my $global_defines = "%DEFINES%";

my $global_name = "%NAME%";

my $global_prefix = "%PREFIX%";

my $global_var = "%VAR%";

# ---------------------------------FRModel.h-------------------------------------

my $h_file = "#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

%BLOCK%

NS_ASSUME_NONNULL_END
";

my $h_block = "\@interface %PREFIX%%CLASS% : NSObject

%DEFINES%

\@end";

my $h_map_define = "\@property (nonatomic, strong, nonnull) %VAR% *%NAME%;";

my $h_list_define = "\@property (nonatomic, strong, nonnull) NSArray<%VAR% *> *%NAME%;";

# ---------------------------------FRModel.m-------------------------------------

my $m_file = "#import \"%PREFIX%%CLASS%.h\"

%BLOCK%
";

my $m_block = "\@implementation %PREFIX%%CLASS%

\@end";

# ---------------------------------------------------------------------------------

sub write {
    my $s_h_define_1 = $h_map_define =~ s/$global_var/NSString/gr;
    $s_h_define_1 = $s_h_define_1 =~ s/$global_name/string/gr;

    my $s_h_block_1 = $h_block =~ s/$global_prefix/FR/gr;
    $s_h_block_1 = $s_h_block_1 =~ s/$global_class/Model/gr;
    $s_h_block_1 = $s_h_block_1 =~ s/$global_defines/$s_h_define_1/gr;

    my $s_h_define_2 = $h_map_define =~ s/$global_var/NSString/gr;
    $s_h_define_2 = $s_h_define_2 =~ s/$global_name/string/gr;

    my $s_h_block_2 = $h_block =~ s/$global_prefix/FR/gr;
    $s_h_block_2 = $s_h_block_2 =~ s/$global_class/Model/gr;
    $s_h_block_2 = $s_h_block_2 =~ s/$global_defines/$s_h_define_2/gr;

    my $s_h_block = $s_h_block_1."\n\n".$s_h_block_2;

    my $s_file = $h_file =~ s/$global_block/$s_h_block/gr;

    print($s_file);
    print("\n\n");

    my $s_m_block_1 = $m_block =~ s/$global_prefix/FR/gr;
    $s_m_block_1 = $s_m_block_1 =~ s/$global_class/Model/gr;

    my $s_m_block_2 = $m_block =~ s/$global_prefix/FR/gr;
    $s_m_block_2 = $s_m_block_2 =~ s/$global_class/Model/gr;
    #
    my $s_m_block = $s_m_block_1."\n\n".$s_m_block_2;

    my $s_m_file = $m_file =~ s/$global_prefix/FR/gr;
    $s_m_file = $s_m_file =~ s/$global_class/Model/gr;
    $s_m_file = $s_m_file =~ s/$global_block/$s_m_block/gr;

    print($s_m_file);
}
