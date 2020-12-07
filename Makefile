prepare-html:
	./css_font_size.sh
	./index.sh
	./table.sh
	./table_same_size.sh
	./table_greek.sh
	./table_greek_with_line_no.sh
	./table_lithuanian.sh
	./table_lithuanian_with_line_no.sh

clean:
	rm gen*.html