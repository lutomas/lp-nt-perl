use strict;
use warnings;
use diagnostics;

my $filename = '../full_1.html';
my $filenameOut = '../full_1_out.html';

my $data = read_file($filename);
my $count = 0;

$data =~ s|<div class="_idGenObjectStyleOverride-1">|(++$count % 2 == 0)?'<div class="_idGenObjectStyleOverride-1 translation">':$&|ge;

write_file($filenameOut, $data);
exit;

sub read_file {
    my ($filename) = @_;

    open my $in, '<:encoding(UTF-8)', $filename or die "Could not open '$filename' for reading $!";
    local $/ = undef;
    my $all = <$in>;
    close $in;

    return $all;
}

sub write_file {
    my ($filenameOut, $content) = @_;

    open my $out, '>:encoding(UTF-8)', $filenameOut or die "Could not open '$filename' for writing $!";;
    print $out $content;
    close $out;

    return;
}