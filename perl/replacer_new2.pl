use strict;
use warnings;
use diagnostics;

#my $filename = '../full_1.html';
#my $filenameOut = '../full_1_out.html';
my $filename = $ARGV[0];
my $filenameOut = $ARGV[1];

my $data = read_file($filename);
my $count = 0;

# MAKES TABLES
$data =~ s|<body id="full_2" lang="en-GB">|'<body id="full_1" lang="en-GB"><table>'|ge;
#$data =~ /"* Rengėjas ne originalą atkuria, bet derina turimų Evangelijų įvykių tvarką: Jono Evangelijoje „žydai“ reiškia būtent tautą!"/;
$data =~ s|<div class="_idGenObjectStyleOverride-1">|(++$count % 2 == 0)?'</td><td><div class="_idGenObjectStyleOverride-1 greek">':'<tr><td><div class="_idGenObjectStyleOverride-1 lit">'|ge;
$data =~ s|</body>|'</td></tr></table>'|ge;

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