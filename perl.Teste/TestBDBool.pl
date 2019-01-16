#!/usr/bin/perl
use strict;
use warnings;
use DBI;
use Encode;

my $dbh = DBI->connect('DBI:mysql:v2surgical:localhost', 'root', 'sliver') or die "Falha ao conectar a base!";

my $query = "select * from tributacao where id = 31 or id = 8351";

my $sth2 = $dbh->prepare($query);
$sth2->execute();

while (my $tributacao = $sth2->fetchrow_hashref) {
	
	print $tributacao->{id} . " - " . $tributacao->{exclusivoProduto} . "\n";
	my $bool = getBoolean($tributacao->{exclusivoProduto});
	
	if ($tributacao->{exclusivoProduto} eq getBoolean(1)) {
		print "true";
	} else {
		print "false";
	}
	
	if ($tributacao->{exclusivoProduto} ne getBoolean(1)) {
		print "false";
	} else {
		print "true";
	}
	
	
	print "\n $bool";
	if ($bool) {
		print "true";
	} else {
		print "false";
	}
	print "\n\n";
	
} 

sub trim { my $s = shift; $s =~ s/^\s+|\s+$//g; return $s };

# Para pegar valor booleano para inserir no BD
sub getBoolean {
	my($bool) = @_;
	if (!$bool) {
		return pack( 'b0', '110' );
	} else {
		return pack( 'b1', '110' );
	}
}

exit;
