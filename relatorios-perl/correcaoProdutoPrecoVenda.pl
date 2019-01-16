#!/usr/bin/perl

use strict;

use warnings;

require "00-my.lib";

my $dbh = &conecta_db();

my $query;

my $sth;

#select todos os clientes que possuem, pelo menos uma vez, citaçao em produtoprecovenda para cada cliente->

$query = "SELECT DISTINCT cliente_id FROM produtoprecovenda";

$sth = $dbh->prepare($query);

$sth->execute();

while ( my $codigoCliente = $sth->fetchrow_hashref->{cliente_id} ) {

	#Select * produtoprecovenda que nao possuem tabelaPreco_id

	$query =
"SELECT * FROM produtoprecovenda WHERE tabelaPrecoVenda_id = 0 AND cliente_id = ?";

	my $sth2 = $dbh->prepare($query);

	$sth2->execute($codigoCliente);

	while ( my $produtoPrecoVenda = $sth2->fetchrow_hashref ) {

#insert into tabelaprecovenda com as informaçoes de (ativo, dtCadastro, numero, cliente, empresa)

		$query = "INSERT INTO `tabelaprecovenda`(

			`ativo`, `dataCadastro`, `descricao`, `numero`, 

			`cliente_id`, `empresa_codigo`

		) VALUES (

			?, NOW(), ?, ?,

			?, ?

		)";

		my $sth3 = $dbh->prepare($query);

		$sth3->execute(

			getBoolean(1), 'Valores tabelados para o cliente',
			getProximoNumero( $produtoPrecoVenda->{empresa_codigo} ),

			$produtoPrecoVenda->{cliente_id},
			$produtoPrecoVenda->{empresa_codigo}

		);

		my $codigoTabela = getUltimoCodigoDB($dbh);

 #update em todos produtoprecovenda caso infomaçao de cliente = cliente(do for)

		$query =
"update produtoprecovenda set tabelaPrecoVenda_id = ? where tabelaPrecoVenda_id = 0 AND cliente_id = ? and empresa_codigo = ?";

		$sth3 = $dbh->prepare($query);

		$sth3->execute(

			$codigoTabela, $codigoCliente, $produtoPrecoVenda->{empresa_codigo},

		);

	}

}

sub getProximoNumero {

	my ($codigoEmpresa) = @_;

	my $query =
"select max(numero) + 1 AS numero from tabelaprecovenda where empresa_codigo = ?";

	my $dbh = &conecta_db();

	my $sth = $dbh->prepare($query);

	$sth->execute($codigoEmpresa);

	if ( $sth->rows ) {

		my $numero = $sth->fetchrow_hashref->{numero};

		return $numero;

	}
	else {

		return 1;

	}

}
exit;

