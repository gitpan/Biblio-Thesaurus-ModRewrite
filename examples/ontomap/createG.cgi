#!/usr/bin/perl

use lib '/home/smash/modrewrite/lib';

use Biblio::Thesaurus;
use Biblio::Thesaurus::ModRewrite;
use CGI qw/:standard/;

my $term = param('term');
print STDERR "GOT $term";
print STDERR "GIV $term";


print "Content-type: text/html\n\n";

chdir '/home/smash/modrewrite';

`./bin/term2dot "$term" /home/smash/ontomap/ontomap.iso | dot -Tpng > /home/smash/ontomap/images/term.png`;
chdir '/home/smash/ontomap';
$term =~ s/\s+/_/g;
`convert -scale 75% images/term.png images/$term.png`;
print  STDERR "convert -scale 75% images/term.png images/$term.png";

print $term;
