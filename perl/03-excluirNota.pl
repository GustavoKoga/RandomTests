#!/usr/bin/perl
use strict;
use warnings;
use DBI;
use Encode;
require "00-my.lib";

my $dbh = &conecta_db();

my $query;
my $sth;

$query = "
SELECT codigo 
FROM nfe 
WHERE naturezaOperacaoManual = 'EXCLUIR NOTA'
";
$sth = $dbh->prepare($query);
$sth->execute();

while (my $nfe = $sth->fetchrow_hashref) {
	
	$query = "
	DELETE
	FROM estoquemovimento
	WHERE nfeVinculada_codigo = ?";
	my $sth2 = $dbh->prepare($query);
	$sth2->execute(
		$nfe->{codigo},
	);
	
	$query = "
	DELETE
	FROM nfeitem
	WHERE notaFiscal_codigo = ?";
	$sth2 = $dbh->prepare($query);
	$sth2->execute(
		$nfe->{codigo},
	);
	
	$query = "
	UPDATE cirurgia 
	SET nota_codigo = NULL
	WHERE nota_codigo = ?";
	$sth2 = $dbh->prepare($query);
	$sth2->execute(
		$nfe->{codigo},
	);
	
	$query = "
	UPDATE nfe
	SET nfeDevolucaoVenda_codigo = NULL
	WHERE nfeDevolucaoVenda_codigo = ?";
	$sth2 = $dbh->prepare($query);
	$sth2->execute(
		$nfe->{codigo},
	);
	
	$query = "
	UPDATE nfe
	SET nfeEstorno_codigo = NULL
	WHERE nfeEstorno_codigo = ?";
	$sth2 = $dbh->prepare($query);
	$sth2->execute(
		$nfe->{codigo},
	);
	
	$query = "
	DELETE
	FROM nfe
	WHERE codigo = ?";
	$sth2 = $dbh->prepare($query);
	$sth2->execute(
		$nfe->{codigo},
	);
	
	print "Nota " . $nfe->{codigo} . " excluída.";
}

exit;