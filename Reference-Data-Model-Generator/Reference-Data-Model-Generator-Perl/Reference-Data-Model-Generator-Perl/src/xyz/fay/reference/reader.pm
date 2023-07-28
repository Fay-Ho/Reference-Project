package reader;
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

use File::Basename;
use File::Path;

require './lib/CamelCase.pm';
require './lib/JSON.pm';
require './src/xyz/fay/reference/writer.pm';

push(@INC, 'pwd');

# -------------------------------------------------------------------------------------------------------------------- #

my $empty = '';

my $slash = '/';

my $read = '<';

my $out_dir = 'out/';

my $error = 'Something went wrong! Please double check the json file!';

my $is_array = 'ARRAY';

my $is_hash = 'HASH';

# -------------------------------------------------------------------------------------------------------------------- #

my @formatted_data;

sub remove_path {
    my $def_path = dirname(shift);
    my $path = shift;
    $path = $path ne $empty ? $path : $def_path;
    if ($path !~ /$slash$/) {
        $path = $path.$slash;
    }
    rmtree($path.$out_dir);
    return $path;
}

sub read_path {
    my $path = shift;
    my $name = basename($path, qw(.json));
    my $json = read_file($path);
    parse_data($name, $json);
    my @data = @formatted_data;
    @formatted_data = ();
    return @data;
}

sub read_file {
    my $file;
    open (my $fh, $read, shift) or die $error;
    while(<$fh>) {
        $file .= $_;
    }
    close $fh;
    return JSON::decode_json($file);
}

sub parse_data {
    my ($key, $value) = @_;
    if (ref $value eq $is_array) {
        my $data;
        for my $sub_value (@$value) {
            if (ref $sub_value eq $is_hash) {
                for my $sub_key (keys %$sub_value) {
                    $$data{$sub_key} = $$sub_value{$sub_key};
                }
            }
        }
        parse_data($key, $data);
    } elsif (ref $value eq $is_hash) {
        push @formatted_data, {writer::camel_case($key) => $value};
        for my $sub_key (sort keys %$value) {
            parse_data(writer::camel_case($key).writer::camel_case($sub_key), $$value{$sub_key});
        }
    }
}

1;
