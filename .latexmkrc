# build pdfs
$pdf_mode = 1;
$interaction = "nonstopmode";
push @extra_pdflatex_options, '-synctex=1';

# Ignore any locally installed files to make builds reproducible

# (? is a deliberately chosen, invalid path. Unsetting the environment
# variable or setting it to the empty string would have LaTeX search the
# default texmf directory location, which we can only avoid by using an
# invalid path)

# Reset all search paths
if ( defined( &ensure_path ) ){
    delete $ENV{'TEXMFHOME'};
    delete $ENV{'BIBINPUTS'};
    delete $ENV{'BSTINPUTS'};
    delete $ENV{'TEXINPUTS'};
    ensure_path('BIBINPUTS', './include//');
    ensure_path('BSTINPUTS', './include//');
    ensure_path('TEXINPUTS', './include//');
}
else{
    $ENV{'TEXMFHOME'} = '?';
    $ENV{'BIBINPUTS'} = './include//:';
    $ENV{'BSTINPUTS'} = './include//:';
    $ENV{'TEXINPUTS'} = './include//:';
}

