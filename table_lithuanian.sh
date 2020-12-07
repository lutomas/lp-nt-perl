#!/bin/sh

#perl -i.bak -pe '$count = 0; s/(\d)foo(\d)/(++$count % 2 == 0)?"$1FOO$2":$&/ge;' in.txt

#perl -i.bak -pe '$count = 0; s/(story_content)/(++$count % 2 == 0)?"STORY":$&/ge;' in.txt

echo "Prepare HTML table..."
in=gen_nt_table_same_font_size.html
out=gen_nt_table_lithuanian.html
perl perl/prepare_html_table_lithuanian.pl  $in  $out
echo "PREPARED HTML: $out"
#perl replace2.pl
