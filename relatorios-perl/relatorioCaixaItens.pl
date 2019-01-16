#!/usr/bin/perl
use strict;
use warnings;
use DBI;
use Encode;
require "00-my.lib";

my $dbh = &conecta_db_demonstrar();
my $sth;
my $query;

$query = "SELECT caixaitem.caixa_codigo as caixa, produto.descricao as descricao, produto.referenciaFabricante as referencia, caixaitem.id as lote, caixaitem.quantidade as quantidade FROM `caixaitem`, produto where caixaitem.produto = produto.id and caixaitem.empresa_codigo = 13482 order by caixa";
$sth = $dbh->prepare($query);
$sth->execute(
);

print join('|', 'Código da caixa', 'Produto', 'Referência do fabricante', 'Lote', 'Quantidade', "\n");

while (my $caixaItem = $sth->fetchrow_hashref) {
	
	print join('|', $caixaItem->{caixa}, $caixaItem->{descricao}, 
		$caixaItem->{referencia}, $caixaItem->{lote}, $caixaItem->{quantidade},
		"\n");
}


$dbh->disconnect;
exit;