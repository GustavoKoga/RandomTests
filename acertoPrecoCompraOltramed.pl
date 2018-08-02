#!/usr/bin/perl
use strict;
use warnings;
use DBI;
use Encode;
require "00-my.lib";

my $dbh = &conecta_db();

my $query;

# Pegar todos os pedidos de compra 
$query = "SELECT i.* 
		FROM notaFiscalItem i, notaFiscal n, pessoa p
		WHERE i.notaFiscal_codigo = n.codigo
		AND p.codigo = n.clienteFornecedor_codigo
		AND p.cnpj = '09.291.672/0001-78'
		AND i.empresa = ?";
my $sth = $dbh->prepare($query);
$sth->execute(getCodigoEmpresaOLTRAMED());

# Percorrer todos os produtos
while (my $item = $sth->fetchrow_hashref) {
	
	$query = "UPDATE produto
			SET precoCompra = ?
			WHERE id = ?
			AND empresa_codigo = ?";
	my $sth2 = $dbh->prepare($query);
	$sth2->execute(
		$item->{valor}, $item->{produto_id}, getCodigoEmpresaOLTRAMED(),
	);
	
}

$dbh->disconnect;
exit;