#!/bin/sh

#perl -i.bak -pe '$count = 0; s/(\d)foo(\d)/(++$count % 2 == 0)?"$1FOO$2":$&/ge;' in.txt

#perl -i.bak -pe '$count = 0; s/(story_content)/(++$count % 2 == 0)?"STORY":$&/ge;' in.txt

echo "Prepare HTML table..."
in=full_nt.html
out=full_nt_table.html
perl perl/prepare_html_table.pl  $in  $out
echo "PREPARED HTML: $out"
#perl replace2.pl
