#!/usr/bin/perl
use strict;
use warnings;
use DBI;
use Encode;
require "00-my.lib";

my $dbh = conecta_db_demonstrar();

my $query;
my $sth;
my $sth2;

my $codigoEmpresa = 13482;

# Pegar os estoquelotes da medcan
$query = "select id, descricao, referenciaFabricante, fabricante
	 from produto where empresa_codigo = ?";
$sth = $dbh->prepare($query);
$sth->execute(
	$codigoEmpresa,
);

print "ID|Descrição|Referência do fabricante|Fabricante|
	CST ICMS Origem|CST ICMS|CST PIS|Alíquota PIS|CST COFINS|Alíquota COFINS|CST IPI|Alíquota IPI \n";

# Percorrer todos os produtos
while (my $produto = $sth->fetchrow_hashref) {
	
	print join('|', $produto->{id}, $produto->{descricao}, $produto->{referenciaFabricante}, $produto->{fabricante});
	
	$query = 'SELECT tributacao.* FROM produto, tributacao where produto.tributacao_id = tributacao.id and produto.id = ?';
	my $sth2 = $dbh->prepare($query);
	$sth2->execute(
		$produto->{id},
	);
	if ($sth2->rows) {
		my $tributacao = $sth2->fetchrow_hashref;
		print '|', join('|', $tributacao->{cstIcmsOrigem}, $tributacao->{cstIcms}, $tributacao->{cstPis}, $tributacao->{aliquotaPis},
		$tributacao->{cstCofins}, $tributacao->{aliquotaCofins}, $tributacao->{cstIpi}, $tributacao->{aliquotaIpi});
		
	} else {
		print '|', join('|', '', '', '', 0, '', 0, '', 0);
	}
	
	print "\n";
	
}

$dbh->disconnect;
exit;