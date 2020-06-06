use strict;
use warnings;
use diagnostics;

my $filename = '../StoriesText_2.html';
my $filenameOut = '../StoriesText_21.html';

my $data = read_file($filename);
my $count = 0;
$data =~ s|<style>.*</style>|<link href="css/lp_neo.css" rel="stylesheet" type="text/css">\n<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">|sm;

# Remove empty lines
#$data =~ s|<div class='story_content'><span style="font-family:'Palemonas';font-size:8.00pt;"> </span><span style="font-family:'Palemonas';font-size:10.50pt;"><br><br></span></div>||g;
#$data =~ s|<div class='story_content'><span style="font-family:'Palemonas';font-size:10.50pt;"><br></span></div>||g;

# Remove styles
$data =~ s|style="font-family:'Palemonas';font-size:11.44pt;"|class="fnt11_44"|g;

$data =~ s|style="font-family:'Palemonas';font-size:11.00pt;"|class="fnt11_0"|g;
$data =~ s|style="font-family:'Palemonas';font-size:11.00pt;color:#008538;text-decoration:underline;"|class="fnt11_0 green underlined"|g;

$data =~ s|style="font-family:'Palemonas-Italic';font-size:10.50pt;"|class="fnt10_5 italic"|g;
$data =~ s|style="font-family:'Palemonas';font-size:10.50pt;"|class="fnt10_5"|g;
$data =~ s|style="font-family:'Palemonas';font-size:10.50pt;text-decoration:underline;"|class="fnt10_5 underlined"|g;
$data =~ s|style="font-family:'Palemonas';font-size:10.50pt;color:#008538;"|class="fnt10_5 green"|g;
$data =~ s|style="font-family:'Palemonas';font-size:10.50pt;color:#008538;text-decoration:underline;"|class="fnt10_5 green underlined"|g;
$data =~ s|style="font-family:'Palemonas';font-size:10.50pt;color:#AD1221;"|class="fnt10_5 red"|g;
$data =~ s|style="font-family:'Palemonas';font-size:10.50pt;color:#AD1221;text-decoration:underline;"|class="fnt10_5 red underlined"|g;
$data =~ s|style="font-family:'Palemonas';font-size:10.50pt;color:#FC00FF;"|class="fnt10_5 pink"|g;
$data =~ s|style="font-family:'Palemonas';font-size:10.50pt;color:#FC00FF;text-decoration:underline;"|class="fnt10_5 pink underlined"|g;
$data =~ s|style="font-family:'Palemonas';font-size:10.50pt;color:#0092D2;"|class="fnt10_5 blue"|g;

$data =~ s|style="font-family:'Palemonas';font-size:10.00pt;"|class="fnt10_0"|g;
$data =~ s|style="font-family:'Palemonas';font-size:10.00pt;color:#AD1221;text-decoration:underline;"|class="fnt10_0 red underlined"|g;
$data =~ s|style="font-family:'Palemonas';font-size:10.00pt;color:#FC00FF;text-decoration:underline;"|class="fnt10_0 pink underlined"|g;
$data =~ s|style="font-family:'Palemonas';font-size:10.00pt;color:#008538;text-decoration:underline;"|class="fnt10_0 green underlined"|g;


$data =~ s|style="font-family:'Palemonas-Italic';font-size:9.00pt;"|class="fnt9_0"|g;

$data =~ s|style="font-family:'Palemonas';font-size:8.00pt;"|class="fnt8_0"|g;
$data =~ s|style="font-family:'Palemonas-BoldItalic';font-size:8.00pt;"|class="fnt8_0 italic bold"|g;
$data =~ s|style="font-family:'Palemonas-Italic';font-size:8.00pt;"|class="fnt8_0 italic"|g;

# Replace story_content
#$data =~ s/'story_content'/(++$count % 2 == 0)?"'story_content_2'":$&/ge;
$data =~ s|<div class='story_content'>|(++$count % 2 == 0)?"<div class='col-sm-6 story_content_2'>":"</div><div class='row'><div class='col-sm-6 story_content'>"|ge;

# Fix
$data =~ s|<body>\s*</div>|<body><div class="container">|g;
$data =~ s|</body>|</div></body>|g;

write_file($filenameOut, $data);
exit;

sub read_file {
    my ($filename) = @_;

    open my $in, '<:encoding(UTF-16)', $filename or die "Could not open '$filename' for reading $!";
    local $/ = undef;
    my $all = <$in>;
    close $in;

    return $all;
}

sub write_file {
    my ($filenameOut, $content) = @_;

    open my $out, '>:encoding(UTF-16)', $filenameOut or die "Could not open '$filename' for writing $!";;
    print $out $content;
    close $out;

    return;
}