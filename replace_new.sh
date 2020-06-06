#!/bin/sh

#perl -i.bak -pe '$count = 0; s/(\d)foo(\d)/(++$count % 2 == 0)?"$1FOO$2":$&/ge;' in.txt

#perl -i.bak -pe '$count = 0; s/(story_content)/(++$count % 2 == 0)?"STORY":$&/ge;' in.txt

#perl replace.pl StoriesText2.html
#perl replace_styles.pl
perl perl/replacer_new2.pl  full_3.html full_3_out.html
#perl replace2.pl
