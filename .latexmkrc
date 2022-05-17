# build pdfs
$pdf_mode = 1;
$interaction = "nonstopmode";
push @extra_pdflatex_options, '-synctex=1';

# Ignore any locally installed files to make builds reproducible

# Reset all search paths
delete $ENV{'BIBINPUTS'};
delete $ENV{'BSTINPUTS'};
delete $ENV{'TEXINPUTS'};

if ( defined &ensure_path ) {
    # (? is a deliberately chosen, invalid path. Unsetting the environment
    # variable or setting it to the empty string would have LaTeX search the
    # default texmf directory location, which we can only avoid by using an
    # invalid path)
    ensure_path('TEXMFHOME', '?');
    ensure_path('BIBINPUTS', './include//');
    ensure_path('BSTINPUTS', './include//');
    ensure_path('TEXINPUTS', './include//');
}
else {
    $ENV{'TEXMFHOME'} = '?';
    $ENV{'BIBINPUTS'} = './include//:';
    $ENV{'BSTINPUTS'} = './include//:';
    $ENV{'TEXINPUTS'} = './include//:';
}
