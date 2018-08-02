#!/usr/bin/perl
use strict;
use warnings;
use DBI;
use Encode;
require "00-my.lib";

my $dbh = &conecta_db();

my $medcan_codigo = 4;

my $query;
my $sth;
my $sth2;

# Pegar os estoquelotes da medcan
$query = "select id, codigoDeBarras, descricao, estoqueMinimo, fabricante, referenciaFabricante, 
		registroAnvisa, dataValidadeAnvisa, tipo, ncm_id, localizacaoEstoque, codigoSus
	 from produto where empresa_codigo = ?";
$sth = $dbh->prepare($query);
$sth->execute(
	getCodigoEmpresaM3(),
);

print "ID|Codigo de barras|Descricao|Estoque minimo|Fabricante|Referencia do fabricante|Registro anvisa|Validade da anvisa|Tipo de produto|NCM|Localizacao no estoque|Codigo SUS \n";

# Percorrer todos os produtos
while (my $produto = $sth->fetchrow_hashref) {
	
	print join('|', $produto->{id}, $produto->{codigoDeBarras}, $produto->{descricao}, $produto->{estoqueMinimo}, 
		$produto->{fabricante}, $produto->{referenciaFabricante}, $produto->{registroAnvisa}, $produto->{dataValidadeAnvisa}, 
		$produto->{tipo}, $produto->{ncm_id}, $produto->{localizacaoEstoque}, $produto->{codigoSus}),"\n";
	
}

$dbh->disconnect;
exit;