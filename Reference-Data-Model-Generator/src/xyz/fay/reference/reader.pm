package reader;
use strict;
use warnings FATAL => 'all';

use File::Basename;
use File::Path;

require './libs/CamelCase.pm';
require './libs/JSON.pm';

push(@INC, 'pwd');

# -------------------------------------------------------------------------------------------------------------------- #

my $empty = '';

my $read = '<';

my $out_dir = 'out/';

my $def_dir = './';

my $error = 'Something went wrong! Please double check the json file!';

my $is_array = 'ARRAY';

my $is_hash = 'HASH';

# -------------------------------------------------------------------------------------------------------------------- #

my @data;

sub remove_path {
    my $path = shift;
    $path = $path ne $empty ? $path : $def_dir;
    rmtree($path.$out_dir);
}

sub read_path {
    my $path = shift;
    my $name = basename($path, qw(.json));
    my $json = read_file($path);
    parse_data($name, $json);
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
            for my $sub_key (keys %$sub_value) {
                $$data{$sub_key} = $$sub_value{$sub_key};
            }
        }
        parse_data($key, $data);
    } elsif (ref $value eq $is_hash) {
        push @data, {camel_case($key) => $value};
        for my $sub_key (sort keys %$value) {
            parse_data(camel_case($key).camel_case($sub_key), $$value{$sub_key});
        }
    }
}

sub camel_case {
    return String::CamelCase::camelize(shift);
}

1;
