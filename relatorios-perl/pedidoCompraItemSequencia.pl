#!/usr/bin/perl
use strict;
use warnings;
use DBI;
use Encode;
require "00-my.lib";

my $dbh = &conecta_db();

my $query;

# Pegar todos os pedidos de compra 
$query = "SELECT * 
		FROM pedidoCompra";
my $sth = $dbh->prepare($query);
$sth->execute();

# Percorrer todos os produtos
while (my $pedidoCompra = $sth->fetchrow_hashref) {
	
	my $estoque = 0;
	
	$query = "SELECT * 
			FROM pedidoCompraItem 
			WHERE pedido_codigo = ? 
			ORDER BY codigo";
	my $sth2 = $dbh->prepare($query);
	$sth2->execute(
		$pedidoCompra->{codigo},
	);
	
	my $contador = 1;
	while (my $item = $sth2->fetchrow_hashref) {
		$query = "UPDATE pedidoCompraItem
				SET sequencia = ?
				WHERE codigo = ?";
		my $sth3 = $dbh->prepare($query);
		$sth3->execute(
			$contador, $item->{codigo},
		);
		$contador++;
	}
	
}

$dbh->disconnect;
exit;