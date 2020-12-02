#!/bin/sh

cat > full_nt_index.html << EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>full nt</title>
</head>
<body>
    <a href="full_nt.html">Kaip in design</a><br/>
    <a href="full_nt_table.html">Lentelė (skirtingi fontai)</a><br/>
    <a href="full_nt_table_same_font_size.html">Lentelė (vienodi fontai)</a><br/>
</body>
</html>
EOF

echo "Index file created"