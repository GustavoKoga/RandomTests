#!/usr/bin/perl
use strict;
use warnings;
use DBI;
use Encode;
require "00-my.lib";

my $dbh = &conecta_db_demonstrar();

my ($query, $sth);

$query = "select l.id, l.dataFabricacao, l.dataVencimento, l.estoque, 
		l.produto_id, p.descricao, p.fabricante, p.referenciaFabricante, p.ncm_id
	from estoquelote l, produto p 
	where l.empresa_codigo = ? and l.produto_id = p.id";
$sth = $dbh->prepare($query);
$sth->execute(
	getCodigoEmpresaBRASUL(),
);

print join(';', 'Lote', 'Data de fabricação', 'Data de vencimento', 'Estoque', 'Descrição do produto', 'Fabricante', 
'Referência do fabricante', 'NCM', 'Cliente da cirurgia', 'Consignacao permanente', 'Quantidade', 'Código cirurgia', 
'Descrição caixa', 'Ref interna caixa', "\n");

while (my $lote = $sth->fetchrow_hashref) {

	my $exibir = ($lote->{estoque} gt 0);
	
	$query = "select pessoa.razaoSocial, 
			cirurgia.consignacaoPermanente, 
			valeitem.quantidade, valeitem.cirurgia_id, 
			caixa.descricao, caixa.referenciaInterna
	from valeitem, cirurgia, pessoa, caixa
	where valeitem.empresa_codigo = ?
	and valeitem.lote_id = ?
	and valeitem.lote_produto_id = ?
	and valeitem.cirurgia_id = cirurgia.id
	and valeitem.caixa = caixa.codigo
	and cirurgia.finalizada = 0
	and cirurgia.cliente_codigo = pessoa.codigo
	order by valeitem.lote_produto_id asc
	";
	my $sth2 = $dbh->prepare($query);
	$sth2->execute(
		getCodigoEmpresaBRASUL(), $lote->{id}, $lote->{produto_id}, 
	);
	if ($sth2->rows) {
		while (my $valeitem = $sth2->fetchrow_hashref) {
			print join(';', $lote->{id}, preparaDataBR($lote->{dataFabricacao}), preparaDataBR($lote->{dataVencimento}), $lote->{estoque}, 
				$lote->{descricao}, $lote->{fabricante}, $lote->{referenciaFabricante}, $lote->{ncm_id},
				$valeitem->{razaoSocial}, $valeitem->{consignacaoPermanente} ? 'Sim' : 'Não', $valeitem->{quantidade}, $valeitem->{cirurgia_id}, 
				$valeitem->{descricao}, $valeitem->{referenciaInterna});
			
			print "\n";
		}
	} elsif ($exibir) {
		print join(';', $lote->{id}, preparaDataBR($lote->{dataFabricacao}), preparaDataBR($lote->{dataVencimento}), $lote->{estoque}, 
						$lote->{descricao}, $lote->{fabricante}, $lote->{referenciaFabricante}, $lote->{ncm_id});
		print "\n";
	}
	
}

exit;