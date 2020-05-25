use strict;
use warnings;

my $filename = 'StoriesText2.html';
my $filenameOut = 'StoriesText2_output.html';

my $data = read_file($filename);
my $count = 0;
$data =~ s/'story_content'/(++$count % 2 == 0)?"'story_content_2'":$&/ge;
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