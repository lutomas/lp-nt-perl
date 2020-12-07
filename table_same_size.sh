#!/bin/sh

echo "Modify HTML table with same font-size..."
in=gen_nt_table.html
out=gen_nt_table_same_font_size.html
perl perl/prepare_html_table_font_size.pl $in  $out
echo "PREPARED HTML SAME FONT-SIZE: $out"
