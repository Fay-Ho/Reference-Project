#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

require './reader.pm';
require './writer.pm';

sub main {
    my $ln = "\n";

    print 'Welcome to using Reference-Model-Generator!!'.$ln;
    print 'Please entry the local json file path:'.$ln;
    my $input_path = <STDIN>;
    chomp $input_path;
    print $ln;

    my @data = reader::read_path($input_path);

    print 'Please entry the output file path:'.$ln;
    my $output_path = <STDIN>;
    chomp $output_path;
    print $ln;

    print 'Please entry the prefix for `Objective-C` file:'.$ln;
    print '<default is FR>'.$ln;
    my $file_prefix = <STDIN>;
    chomp $file_prefix;
    print $ln;

    print 'Please entry the suffix for model file:'.$ln;
    print '<default is empty>'.$ln;
    my $file_suffix = <STDIN>;
    chomp $file_suffix;
    print $ln;

    push(@data, $output_path);
    push(@data, $file_prefix);
    push(@data, $file_suffix);

    writer::generate_java(@data);
    writer::generate_kotlin(@data);
    writer::generate_objc(@data);
    writer::generate_swift(@data);
}

main();
