#!/usr/bin/perl
use strict;
use warnings;
use DBI;
use Encode;
require "00-my.lib";

my $dataBase = $ARGV[0];
my $datainicial = $ARGV[1];
my $datafinal = $ARGV[2];

if (!$dataBase || !$datainicial || !$datafinal) {
	die ("perl relatorioFaturamentoEmpresas.pl <dataBase 1 - 2> <datainicial> <datafinal>");
}

my $dbh;

if ($dataBase eq "1") {
	$dbh = &conecta_db_s01();
} elsif ($dataBase eq "2") {
	$dbh = &conecta_db_s02();
} else {
	die ("Informe o número do DB 1 ou 2");
}

my $query;

# Pegar todos os pedidos de compra 
$query = "SELECT * 
		FROM pessoa
		WHERE discriminator LIKE 'empresa'
		and ativo = 1";
my $sth = $dbh->prepare($query);
$sth->execute();

print join(';', "Empresa", "Valor faturado", "\n");

# Percorrer todos os produtos
while (my $pessoa = $sth->fetchrow_hashref) {
	
	my $sth2;
	
	$query = "select format(sum((nfeitem.quantidade * nfeitem.valor) - (nfeitem.quantidade * nfeitem.valorDesconto)),2,'pt_BR') as total 
			from nfeitem, nfe 
			where nfeitem.notaFiscal_codigo = nfe.codigo 
			and nfe.empresa = ? 
			and nfe.dataEmissao BETWEEN ? and ? 
			and nfe.status = 'AUTORIZADA'
			and nfe.cancelada = false
			AND EXISTS (SELECT i.cfop_id FROM nfeitem i, cfop c
				WHERE nfe.codigo = i.notaFiscal_codigo
				AND i.cfop_id = c.id
				AND (CAST(c.numero as CHAR) like '51%'
					or CAST(c.numero as CHAR) like '61%'
					or CAST(c.numero as CHAR) like '5551'
					or CAST(c.numero as CHAR) like '6551'
					or CAST(c.numero as CHAR) like '5401'
					or CAST(c.numero as CHAR) like '6401'
					or CAST(c.numero as CHAR) like '5402'
					or CAST(c.numero as CHAR) like '6402'
					or CAST(c.numero as CHAR) like '5403'
					or CAST(c.numero as CHAR) like '6403'
					or CAST(c.numero as CHAR) like '6404'
					or CAST(c.numero as CHAR) like '5405'
				))";
	$sth2 = $dbh->prepare($query);
	$sth2->execute(
		$pessoa->{codigo}, $datainicial, $datafinal,
	);
	
	print join(';', $pessoa->{identificador}, $sth2->fetchrow_hashref->{total}, "\n");

	
}

$dbh->disconnect;
exit;
