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
$data =~ s|<body id="full_nt" lang="en-GB">|'<body id="full_nt" lang="en-GB"><table>'|ge;
#$data =~ /"* Rengėjas ne originalą atkuria, bet derina turimų Evangelijų įvykių tvarką: Jono Evangelijoje „žydai“ reiškia būtent tautą!"/;
$data =~ s|<div class="_idGenObjectStyleOverride-1">|(++$count % 2 == 0)?'</td><td><div class="_idGenObjectStyleOverride-1 lit">':'<tr class="border_bottom"><td style="color:red">'.$count.'</td><td><div class="_idGenObjectStyleOverride-1 greek">'|ge;
$data =~ s|</body>|'</td></tr></table>'|ge;
$count = 0;
#$data =~ s|<div class="_idGenObjectStyleOverride-1 greek">|''.$count.'</td><td><div class="_idGenObjectStyleOverride-1 greek">'; ++$count|ge;
#$data =~ s|<td><div class="_idGenObjectStyleOverride-1 greek">|'<td style="color:red">'.++$count.'</td><td><div class="_idGenObjectStyleOverride-1 greek">'|ge;

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