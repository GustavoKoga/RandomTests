#!/usr/bin/perl
use strict;
use warnings;
use DBI;
require "";

my $dbh = &conecta_db();

my $query = 'select * from conta where empresa_codigo = ? and ativo = 1;';
my $sth = $dbh->prepare($query);
$sth->execute(getCodigoEmpresa());

while (my $conta = $sth->fetchrow_hashref) {
	
	$query = 'SELECT * FROM contalancamento where empresa_codigo = ? and conta_id = ? order by data asc, id asc ';

	my $sth2 = $dbh->prepare($query);
	$sth2->execute(getCodigoEmpresa(), $conta->{id});
	
	my $saldo = 0;
	
	while (my $lancamento = $sth2->fetchrow_hashref) {
		
		if ($lancamento->{entrada}) {
			$saldo += $lancamento->{entrada};
		} elsif ($lancamento->{saida}) {
			$saldo -= $lancamento->{saida};
		}
		
		$query = "update contalancamento set saldo = ? where empresa_codigo = ? and id = ?";
		my $sth3 = $dbh->prepare($query);
		$sth3->execute($saldo, getCodigoEmpresa(), $lancamento->{id});
		
	}
	
}

$dbh->disconnect;
exit;