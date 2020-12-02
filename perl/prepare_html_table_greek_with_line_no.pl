use strict;
use warnings;
use diagnostics;

my $filename = $ARGV[0];
my $filenameOut = $ARGV[1];

my $data = read_file($filename);
my $count = 0;
my $lineCount = 0;

# MAKES TABLES
$data =~ s|</head>|'<style>.lit{display:none}.lit_count{display:none}</style></head>'|ge;
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