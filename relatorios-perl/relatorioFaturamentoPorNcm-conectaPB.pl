#!/usr/bin/perl
use strict;
use warnings;
use DBI;
use Encode;
require "00-my.lib";

my $dbh = &conecta_db_s01();

my $query;
my $sth;
my $sth2;

my $codigoEmpresa = $ARGV[0];
if (!$codigoEmpresa) {
#	Empresa Conecta hospitalar PB
	$codigoEmpresa = 8327;
}
my $dataInicial = $ARGV[1];
if (!$dataInicial) {
	$dataInicial = '2018-12-01';
}
my $dataFinal = $ARGV[2];
if (!$dataFinal) {
	$dataFinal = '2018-12-31';
}

# Pegar a listagem dos produtos 
$query = "select produto.referenciaFabricante, produto.descricao, nfe.numero as numeroNota, 
nfe.tipoDocumento, c.numero as cfop, produto.ncm_id, nfeitem.quantidade, nfeitem.valor, 
nfeitem.basePis, nfeitem.aliquotaPis, nfeitem.valorPis,
nfeitem.baseCofins, nfeitem.aliquotaCofins, nfeitem.valorCofins
from nfeitem, nfe, produto, cfop c
where nfeitem.notaFiscal_codigo = nfe.codigo
and nfeitem.lote_produto_id = produto.id
and nfeitem.cfop_id = c.id
and nfe.dataEmissao between ? and ?
and nfe.status like 'AUTORIZADA'
and nfe.empresa = ?
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
    )
order by produto.ncm_id asc, nfe.numero asc";
$sth = $dbh->prepare($query);
$sth->execute(
	$dataInicial, $dataFinal, $codigoEmpresa,
);

print "Relatório de faturamento por NCM no período entre " . preparaDataBR($dataInicial) . " e " . preparaDataBR($dataFinal) . "\n\n";

print "Produto|Descrição|Nota|Tipo nota|CFOP|NCM|QTD|Valor item|Base PIS|% PIS|PIS|Base COFINS|% COFINS|COFINS|\n";

my $ncm;
my $totalPis = 0;
my $totalCofins = 0;
my $totalProduto = 0;

# Percorrer todos os produtos
while (my $produto = $sth->fetchrow_hashref) {
	
	if (!$ncm || ($ncm && $ncm ne $produto->{ncm_id})) {
		if ($totalProduto || $totalPis || $totalCofins) {
			print "|||||||" . converteValorCsv($totalProduto). "|" . converteValorCsv($totalPis) . "|||" . converteValorCsv($totalCofins) . "\n";
		}
		$ncm = $produto->{ncm_id};
		print "\n NCM: " . $ncm . "\n";
		$totalPis = 0;
		$totalCofins = 0;
		$totalProduto = 0;
	}
	
	print join('|', $produto->{referenciaFabricante}, $produto->{descricao}, converteValorCsv($produto->{numeroNota}),
		$produto->{tipoDocumento}, $produto->{cfop}, $produto->{ncm_id}, $produto->{quantidade}, converteValorCsv($produto->{valor}),
		converteValorCsv($produto->{basePis}), converteValorCsv($produto->{aliquotaPis}), converteValorCsv($produto->{valorPis}), converteValorCsv($produto->{baseCofins}), 
		converteValorCsv($produto->{aliquotaCofins}), converteValorCsv($produto->{valorCofins})
		);
		
	$totalPis += $produto->{basePis};
	$totalCofins += $produto->{baseCofins};
	$totalProduto += $produto->{valor};
	
	print "\n";
	
}

$dbh->disconnect;
exit;