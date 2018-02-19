# -*- mode: perl; -*-
$pdf_mode = 4; # luaLaTeX
$lualatex = 'lualatex --file-line-error --halt-on-error %O %S';

# extract git version info before each compile
system('./gitinfo2.sh > gitHeadLocal.gin');

@default_files = ( 'sbabook' );
