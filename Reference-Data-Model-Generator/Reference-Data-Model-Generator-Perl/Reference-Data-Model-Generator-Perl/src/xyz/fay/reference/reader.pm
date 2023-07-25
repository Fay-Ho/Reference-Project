package reader;
use strict;
use warnings FATAL => 'all';

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
