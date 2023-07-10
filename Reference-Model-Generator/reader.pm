package reader;
use strict;
use warnings FATAL => 'all';

use File::Basename;
use JSON;

push(@INC, 'pwd');

my @data;

sub read_path {
    my $path = shift;
    my $name = basename($path, qw(.json));
    my $json = read_file($path);
    parse_data($name, $json);
    return @data;
}

sub read_file {
    my $file;
    open (my $fh, '<', shift) or die 'Something went wrong! Please double check the json file!';
    while(<$fh>) {
        $file .= $_;
    }
    close $fh;
    return JSON::decode_json($file);
}

sub parse_data {
    my ($key, $value) = @_;
    if (ref $value eq 'ARRAY') {
        my $data;
        for my $sub_value (@$value) {
            for my $sub_key (keys %$sub_value) {
                $$data{$sub_key} = $$sub_value{$sub_key};
            }
        }
        parse_data($key, $data);
    } elsif (ref $value eq 'HASH') {
        push @data, {$key => $value};
        for my $sub_key (keys %$value) {
            parse_data($sub_key, $$value{$sub_key});
        }
    }
}

1;
