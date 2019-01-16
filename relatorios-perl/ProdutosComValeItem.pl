#!/usr/bin/perl
use strict;
use warnings;
use DBI;
use Encode;
require "00-my.lib";

my $dbh = &conecta_db_s01();

my ($query, $sth);

$query = "select * from produto where empresa_codigo = ?";
$sth = $dbh->prepare($query);
$sth->execute(
	getCodigoEmpresaBRASUL(),
);

print join(';', 'Ref do Fabricante', 'Descrição do produto', 'NCM', 
'Anvisa', 'Validade da anvisa', 'Estoque mínimo', 'Estoque total',
'Estoque livre', 'Estoque prateleira', 'Estoque consignação', 'Estoque caixas', 'Ativo', 'Em inventário'  
,"\n");

while (my $produto = $sth->fetchrow_hashref) {
	
	my $sth2;
	my $quantidade;
	
	# Estoque total abrange consignados + prateleira + caixas
	my $estoqueTotal = 0;
	# Estoque livre abrange consignados + prateleira
	my $estoqueLivre = 0;
	my $estoqueConsignados = 0;
	my $estoquePrateleira = 0;
	my $estoqueCaixas = 0;
	
	### Selecionar quantidade total em caixas
	$query = 'select sum(caixaitem.quantidade) as total
		from caixaitem, caixa
		where caixaitem.caixa_codigo = caixa.codigo
		and caixa.emUso = 0 
		and empresa_codigo = ?
		and produto = ?
		';
	$sth2 = $dbh->prepare($query);
	$sth2->execute(
		getCodigoEmpresaBRASUL(), $produto->{id},
	);
	$quantidade = $sth2->fetchrow_hashref->{total};
	if ($quantidade) {
		$estoqueCaixas = $quantidade;
	}
	
	### Selecionar quantidade total em prateleira
	$query = 'select sum(estoque) as total
		from estoquelote
		where empresa_codigo = ?
		and produto_id = ?
		';
	$sth2 = $dbh->prepare($query);
	$sth2->execute(
		getCodigoEmpresaBRASUL(), $produto->{id},
	);
	$quantidade = $sth2->fetchrow_hashref->{total};
	if ($quantidade) {
		$estoquePrateleira = $quantidade;
	}
	
	### Selecionar quantidade total em consignações
	$query = 'select sum(valeitem.quantidade) as total
		from valeitem, cirurgia
		where valeitem.empresa_codigo = ?
		and valeitem.lote_produto_id = ?
		and valeitem.cirurgia_id = cirurgia.id
		and cirurgia.finalizada = 0
	';
	$sth2 = $dbh->prepare($query);
	$sth2->execute(
		getCodigoEmpresaBRASUL(), $produto->{id},
	);
	$quantidade = $sth2->fetchrow_hashref->{total};
	if ($quantidade) {
		$estoqueConsignados = $quantidade;
	}
	
	$estoquePrateleira -= $estoqueCaixas;
	$estoqueTotal = $estoquePrateleira + $estoqueConsignados + $estoqueCaixas;
	$estoqueLivre = $estoquePrateleira + $estoqueConsignados;
	
	print join(';', $produto->{referenciaFabricante}, $produto->{descricao}, $produto->{ncm_id},
		$produto->{registroAnvisa}, $produto->{validadeVigenteAnvisa} ? 'Vigente' : preparaDataBR($produto->{dataValidadeAnvisa}),
		$produto->{estoqueMinimo}, $estoqueTotal, $estoqueLivre, $estoquePrateleira, $estoqueConsignados, $estoqueCaixas,
		$produto->{ativo} ? 'Sim' : 'Não', $produto->{emInventario} ? 'Sim' : 'Não', "\n"
		);

}

exit;