#!/usr/bin/perl
use strict;
use warnings;
use DBI;
use Encode;
require "00-my.lib";

my $dbh = &conecta_db();

my $query;
my $sth;

my $login = "teste2";
my $codigoUsuario;

if (!$codigoUsuario) {
	$query = "select codigo from usuario where login like ?";
	$sth = $dbh->prepare($query);
	$sth->execute(
		$login,
	);
	if ($sth->rows) {
		my $usuario = $sth->fetchrow_hashref;
		$codigoUsuario = $usuario->{codigo};
	}
}

if ($codigoUsuario) {
	
	$query = "delete from usuario_permissao where usuario = ?;";
	$sth = $dbh->prepare($query);
	$sth->execute(
		$codigoUsuario,
	);
	
	$query = "delete from usuario where codigo = ?;";
	$sth = $dbh->prepare($query);
	$sth->execute(
		$codigoUsuario,
	);
	
	if ($sth->rows) {
		print "Usuário excluido.";
	}
}

exit;