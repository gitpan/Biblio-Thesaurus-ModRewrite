#!/usr/bin/perl

use lib '/home/smash/modrewrite/lib';

use CGI qw/:standard/;
use Biblio::Thesaurus::ModRewrite;
use Biblio::Thesaurus;

print "Content-type: text/html\n\n";

my @opt = param;
#@opt = ('country');

my $code =<<'EOF';
$a 'lat' $x AND $a 'lng' $y
EOF
chomp $code;

if (@opt > 0) {
	$code .= ' AND ';
	@opt = map { "\$a 'is-a' $_"; } @opt;
	$code .= join(' OR ', @opt);
}
else {
	print "{\"markers\":[]}\n";
	exit 0;
}

$code.=<<'EOF';
=>
sub {
	$d = `./getDesc '$a'`;
	$z = $::obj->depth_first($a,1,'is-a');
	($e, $v) = each(%{$z});
	print "{\"name\":\"$a\",\"desc\":\"$d\",\"lat\":\"$x\",\"lng\":\"$y\",\"is\":\"$e\"},";
}.
EOF

print "{\"markers\":[";
our $obj = thesaurusLoad('/home/smash/ontomap/ontomap.iso');
$t = Biblio::Thesaurus::ModRewrite->new($obj);
$t->process($code);
print "]}\n";
