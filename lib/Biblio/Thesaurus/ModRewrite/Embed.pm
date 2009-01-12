package Biblio::Thesaurus::ModRewrite::Embed;

use Filter::Simple;
use Data::Dumper;
     
use warnings;
use strict;

=head1 NAME

Biblio::Thesaurus::ModRewrite::Embed - a module to embed OML programs
in Perl code.

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

  use Biblio::Thesaurus::ModRewrite::Embed;

  OML proc
  $city 'city-of' $country => sub { print "$city is in $country\n"; }.
  ENDOML

  proc('ontology.iso');

=cut

=head2 buildOML

This function ...

=cut

sub buildOML {
	(my $name, my $list, my $code) = @_;

print Dumper $name;
print Dumper $list;
print Dumper $code;
	# begin
	my $c = "sub $name {\n";
	
	# handle ontology
	$c .= "\tmy \$ont = shift;\n";
	$c .= "\tuse Biblio::Thesaurus;\n";
	$c .= "\tuse Biblio::Thesaurus::ModRewrite;\n";
	$c .= "\tmy \$obj = thesaurusLoad(\$ont);\n\n";

	# handle OML code
	$c .= "my \$code=<<'EOF';\n";
	$c .= "$code";
	$c .= "EOF\n\n";

	# black magic
	$c .= "\tif(\"$list\" eq '') {\n";
	$c .= "\t\tmy \@ARGV = \@_;\n\n";
	$c .= "\t\t\$code =~ s/\\\$ARGV\\[(\\d+)\\]/\$ARGV[\$1]/ge;\n\n";
	$c .= "\t} else {\n";
	$c .= "\t\t\@tmp = split /,/, \"$list\";\n";
	$c .= "\t\tforeach (\@_) { my \$i = shift \@tmp;\n";
	$c .= "\t\t\t\$code =~ s/\\b\$i\\b/\$_/g;\n";
	$c .= "\t\t}\n";
	$c .= "\t}\n";

	# main
	$c .= "\$t = Biblio::Thesaurus::ModRewrite->new(\$obj);\n";
	$c .= "\$t->process(\$code);\n";

	# finish
	$c .="}\n";

	$c;
}

=head2 FILTER

Filter ...

=cut

FILTER { 
	return if m/^(\s|\n)*$/;

	#print "BEFORE $_\n";
	s/^OML\s+(\w+)(\(([\w,]+)\))?\s*\n((?:.|\n)*?)^ENDOML/buildOML($1,$3,$4)/gem;
	#print "AFTER $_\n";

	$_;
};

1;
