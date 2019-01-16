#!/usr/bin/perl
use strict;
use warnings;
use DBI;
use Encode;
require "00-my.lib";

my $dbh = &conecta_db();

my $query;
my $sth;

my $codigoEmpresa = 10956;
my $nome = "teste2";
my $razaoSocial = "teste2";

$query = "select * from usuario
		where email like ?";
$sth = $dbh->prepare($query);
$sth->execute(
	$nome,
);
if ($sth->rows) {
	print "Usuário já cadastrado.";
	exit;
}

$query = "INSERT INTO `usuario` (
			`discriminator`, `ativo`, `email`, `login`, `nome`, 
			`senha`, `empresa`, `bloqueado`, `falhasLogin`
		) VALUES (
			?, ?, ?, ?, ?,
			?, ?, ?, ?
		);";
$sth = $dbh->prepare($query);
$sth->execute(
	'base', getBoolean(1), $nome, $nome, $nome, 
	'1', $codigoEmpresa, getBoolean(0), '0',
);

my $codigoUsuario = getUltimoCodigoDB($dbh);

$query = "INSERT INTO usuario_permissao (
			usuario, permissao
		) VALUES (
			? , ?
		);";
$sth = $dbh->prepare($query);
$sth->execute(
	$codigoUsuario, 'ROLE_USUARIO',
);

$sth = $dbh->prepare($query);
$sth->execute(
	$codigoUsuario, 'ROLE_ADMINISTRADOR',
);

$sth = $dbh->prepare($query);
$sth->execute(
	$codigoUsuario, 'ROLE_ADMINISTRADOR_GLOBAL',
);

exit;