#!/bin/sh

echo "Prepare CSS without font-size..."
in=full_nt-web-resources/css/idGeneratedStyles.css
out=full_nt-web-resources/css/idGeneratedStyles_font_size.css
perl perl/prepare_css_font_size.pl $in  $out
echo "PREPARED CSS: $out"
