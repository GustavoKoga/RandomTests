#!/usr/bin/perl
use strict;
use warnings;
use DBI;
use Encode;
require "00-my.lib";

my $dbh = &conecta_db_s01();

my ($query, $sth);

=begin
Seria tudo que temos em estoque (estoque prateleira, caixas, consignação e consignação permanente), 
menos o instrumental e equipamentos, somente material de revenda.
Preciso que apareça: código do fabricante, descrição do produto, NCM, quantidade.
=cut

$query = "SELECT * 
		FROM produto 
		WHERE empresa_codigo = ? 
		AND (tipo NOT LIKE 'INSTRUMENTAL' AND tipo NOT LIKE 'EQUIPAMENTOS')
		AND ativo = 1";
$sth = $dbh->prepare($query);
$sth->execute(
	getCodigoEmpresaBRASUL(),
);

print join(';', 'Código produto', 'Descrição', 'NCM', 'Quantidade total', 'Quantidade prateleira',
			'Quantidade caixas', 'Quantidade consignações', 'Quantidade consignações permanentes', "\n");

while (my $produto = $sth->fetchrow_hashref) {
	
	my $sth2;
	my $estoquePrateleira = 0;
	my $estoqueCaixas = 0;
	my $estoqueConsignacao = 0;
	my $estoqueConsignacaoPermanente = 0;
	my $estoqueTotal = 0;
	
	## --- Count do total de estoque (Caixa + Livre)
	$query = "SELECT SUM(estoque) AS total 
			FROM estoquelote 
			WHERE empresa_codigo = ? 
			AND produto_id = ? ";
	$sth2 = $dbh->prepare($query);
	$sth2->execute(
		getCodigoEmpresaBRASUL(), $produto->{id},
	);
	if ($sth2->rows) {
		$estoquePrateleira = $sth2->fetchrow_hashref->{total};
	}
	
	## --- Count do total de itens em caixas
	$query = "SELECT SUM(caixaitem.quantidade) AS total
			FROM caixaitem, caixa 
			WHERE caixaitem.caixa_codigo = caixa.codigo 
			AND caixa.emUso = false 
			AND empresa_codigo = ? 
			AND produto = ? ";
	$sth2 = $dbh->prepare($query);
	$sth2->execute(
		getCodigoEmpresaBRASUL(), $produto->{id},
	);
	if ($sth2->rows) {
		$estoqueCaixas = $sth2->fetchrow_hashref->{total};
	}
	
	## --- Estoque livre é calculado pelo estoque do lote subtraido pelo estoque em caixas
	$estoquePrateleira -= $estoqueCaixas;
	
	## --- Count do total de itens consignados não finalizados
	$query = "SELECT SUM(valeitem.quantidade)
			FROM valeitem, cirurgia
			WHERE valeitem.cirurgia_id = cirurgia.id
			AND cirurgia.finalizada = FALSE
			AND cirurgia.consignacaoPermanente = FALSE
			AND valeitem.empresa_codigo = ?
			AND valeitem.lote_produto_id = ?";
	$sth2 = $dbh->prepare($query);
	$sth2->execute(
		getCodigoEmpresaBRASUL(), $produto->{id},
	);
	if ($sth2->rows) {
		$estoqueConsignacao = $sth2->fetchrow_hashref->{total};
	}
	
	## --- Count do total de itens consignados em permanentes não finalizados
	$query = "SELECT SUM(valeitem.quantidade)
			FROM valeitem, cirurgia
			WHERE valeitem.cirurgia_id = cirurgia.id
			AND cirurgia.finalizada = FALSE
			AND cirurgia.consignacaoPermanente = TRUE
			AND cirurgia.consignacaoPermanenteEncerrada = FALSE
			AND valeitem.empresa_codigo = ?
			AND valeitem.lote_produto_id = ?";
	$sth2 = $dbh->prepare($query);
	$sth2->execute(
		getCodigoEmpresaBRASUL(), $produto->{id},
	);
	if ($sth2->rows) {
		$estoqueConsignacao = $sth2->fetchrow_hashref->{total};
	}
	
	$estoqueTotal = $estoquePrateleira + $estoqueCaixas + $estoqueConsignacao + $estoqueConsignacaoPermanente;
	
	if ($estoqueTotal > 0) {
		print join(';', $produto->{referenciaFabricante}, $produto->{descricao}, $produto->{ncm_id}, 
			$estoqueTotal, $estoquePrateleira, $estoqueCaixas, $estoqueConsignacao, $estoqueConsignacaoPermanente,
			"\n"
		);
	}
	
}

exit;
