#!/bin/sh

out=full_nt_index.html
cat > $out << EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>full nt INDEX</title>
</head>
<body>
    <a href="full_nt.html">Kaip in design</a><br/>
    <a href="full_nt_table.html">Lentelė (skirtingi fontai)</a><br/>
    <a href="full_nt_table_same_font_size.html">Lentelė (vienodi fontai)</a><br/>
    <a href="full_nt_table_greek_with_line_no.html">Graikiškas tekstas (su eilučių numeriais)</a><br/>
    <a href="full_nt_table_greek.html">Graikiškas tekstas</a><br/>
    <a href="full_nt_table_lithuanian_with_line_no.html">Lietuviškas tekstas (su eilučių numeriais)</a><br/>
    <a href="full_nt_table_lithuanian.html">Lietuviškas tekstas</a><br/>
</body>
</html>
EOF

echo "PREPARED INDEX FILE: $out"