#!/usr/bin/perl
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

require './lib/CamelCase.pm';
require './src/xyz/fay/reference/reader.pm';
require './src/xyz/fay/reference/writer.pm';

# -------------------------------------------------------------------------------------------------------------------- #

my $ln = "\n";

my $empty = '';

# -------------------------------------------------------------------------------------------------------------------- #

sub main {
    print 'Welcome to using Reference-Data-Model-Generator!!'.$ln;
    print 'Please entry the local json file path. (Mandatory):'.$ln;
    my $input_path = <STDIN>;
    chomp $input_path;
    print $ln;

    print 'Please entry the output file path. (Default is the path of json file located):'.$ln;
    my $output_path = <STDIN>;
    chomp $output_path;
    print $ln;

    print 'Which platform\'s data model do you need to generate? (Java (j), Kotlin (k), Objective-C (o), Swift (s), default generate all platforms):'.$ln;
    my $develop_platform = <STDIN>;
    chomp $develop_platform;
    print $ln;

    my $file_prefix = $empty;
    if ($develop_platform !~ /j/ and $develop_platform !~ /k/ and $develop_platform !~ /s/) {
        print 'Please entry the prefix for `Objective-C` file. (e.g. `FRApi`, default is `FR`):'.$ln;
        $file_prefix = <STDIN>;
        chomp $file_prefix;
        print $ln;
    }

    print 'Please entry the suffix for data model. (e.g. `response` to `ApiResponse`, default is empty):'.$ln;
    my $file_suffix = <STDIN>;
    chomp $file_suffix;
    print $ln;

    my $file_package = $empty;
    if ($develop_platform !~ /o/ and $develop_platform !~ /s/) {
        print 'Please entry the package name for `Java` and `Kotlin` file. (Default is `xyz.fay.reference`):'.$ln;
        $file_package = <STDIN>;
        chomp $file_package;
        print $ln;
    }

    print 'Please entry the copyright for you company or organization. (Default is MIT license):'.$ln;
    my $file_copyright = <STDIN>;
    chomp $file_copyright;
    print $ln;

    $output_path = reader::remove_path($input_path, $output_path);

    my @info = ($develop_platform, $output_path, uc $file_prefix, writer::camel_case($file_suffix), $file_package, $file_copyright);

    if (-d $input_path) {
        my @dir = <$input_path/*.json>;
        foreach (@dir) {
            my @data = reader::read_path($_);
            unshift @data, @info;
            generate_file(@data);
        }
    } else {
        my @data = reader::read_path($input_path);
        unshift @data, @info;
        generate_file(@data);
    }
}

sub generate_file {
    my $develop_platform = shift;

    if ($develop_platform =~ /j/) {
        writer::generate_java_file(@_);
    } elsif ($develop_platform =~ /k/) {
        writer::generate_kotlin_file(@_);
    } elsif ($develop_platform =~ /o/) {
        writer::generate_objc_file(@_);
    } elsif ($develop_platform =~ /s/) {
        writer::generate_swift_file(@_);
    } else {
        writer::generate_java_file(@_);
        writer::generate_kotlin_file(@_);
        writer::generate_objc_file(@_);
        writer::generate_swift_file(@_);
    }
}

main();
