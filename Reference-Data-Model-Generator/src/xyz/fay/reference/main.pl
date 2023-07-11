#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

require './src/xyz/fay/reference/reader.pm';
require './src/xyz/fay/reference/writer.pm';

my $empty = '';

sub main {
    my $ln = "\n";

    print 'Welcome to using Reference-Data-Model-Generator!!'.$ln;
    print 'Please entry the local json file path:'.$ln;
    my $input_path = <STDIN>;
    chomp $input_path;
    print $ln;

    my @data = reader::read_path($input_path);

    print 'Please entry the output file path:'.$ln;
    my $output_path = <STDIN>;
    chomp $output_path;
    print $ln;

    reader::remove_path($output_path);

    print 'Which platform\'s data model do you need to generate? (Java (j), Kotlin (k), Objective-C (o), Swift (s), default generate all platforms):'.$ln;
    my $develop_platform = <STDIN>;
    chomp $input_path;
    print $ln;

    my $file_prefix = $empty;
    if ($develop_platform =~ /o/) {
        print 'Please entry the prefix for `Objective-C` file (default is FR):'.$ln;
        $file_prefix = <STDIN>;
        chomp $file_prefix;
        print $ln;
    }

    print 'Please entry the suffix for model file (default is empty):'.$ln;
    my $file_suffix = <STDIN>;
    chomp $file_suffix;
    print $ln;

    unshift(@data, $output_path, $file_prefix, $file_suffix);

    if ($develop_platform =~ /j/) {
        writer::generate_java_file(@data);
    } elsif ($develop_platform =~ /k/) {
        writer::generate_kotlin_file(@data);
    } elsif ($develop_platform =~ /o/) {
        writer::generate_objc_file(@data);
    } elsif ($develop_platform =~ /s/) {
        writer::generate_swift_file(@data);
    } else {
        writer::generate_java_file(@data);
        writer::generate_kotlin_file(@data);
        writer::generate_objc_file(@data);
        writer::generate_swift_file(@data);
    }
}

main();