#!/usr/bin/perl
use strict;
use warnings;
use DBI;
use Encode;
require "00-my.lib";

my $dbh = &conecta_db();

my $query;
my $sth;
my $sth2;
my $codigoEmpresa = getCodigoEmpresaR2();

# Pegar a listagem dos produtos 
$query = "select *
	 from produto 
	 where empresa_codigo = ?
	 and ativo = 1";
$sth = $dbh->prepare($query);
$sth->execute(
	$codigoEmpresa,
);

print "Descricao|Estoque minimo|Fabricante|Referencia do fabricante|Estoque\n";

# Percorrer todos os produtos
while (my $produto = $sth->fetchrow_hashref) {
	
	my $estoque = 0;
	
	$query = "select sum(estoque) as total from estoquelote where produto_id = ? and empresa_codigo = ?";
	$sth2 = $dbh->prepare($query);
	$sth2->execute(
		$produto->{id}, $codigoEmpresa,
	);
	
	if ($sth2->rows) {
		my $lote = $sth2->fetchrow_hashref;
		
		$estoque = $lote->{total};
	}
	
	if ($estoque <= $produto->{estoqueMinimo} ) {
		print join('|', $produto->{descricao}, $produto->{estoqueMinimo}, $produto->{fabricante}, $produto->{referenciaFabricante}, $estoque),"\n";
		
	}
	
}

$dbh->disconnect;
exit;