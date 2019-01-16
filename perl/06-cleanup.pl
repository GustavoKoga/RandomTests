#!/usr/bin/perl
use strict;
use warnings;
use DBI;
require "metamedical.lib";

my $dbh = &conecta_db();
my $info = &conecta_db_info();
my $query = "select table_name, column_name from columns where table_schema = ? and (column_name = ? or column_name = ?)";
my $sth = $info->prepare($query);
$sth->execute("v2surgical", 'empresa', 'empresa_codigo');
while (my $t = $sth->fetchrow_hashref) {
	if ($t->{table_name} eq "usuario" || $t->{table_name} eq "preferencias") {
		print "Pulando tabela: $t->{table_name}\n";
		next;
	}
	print "Limpando tabela: $t->{table_name}\n";

	$query = 'set foreign_key_checks = 0';
	my $sth1 = $dbh->prepare($query);
	$sth1->execute();

	$query = 'delete from '.$t->{table_name}.' where '.$t->{column_name}.' = ?';
	$sth1 = $dbh->prepare($query);
	$sth1->execute(getCodigoEmpresa());

	$query = 'set foreign_key_checks = 1';
	$sth1 = $dbh->prepare($query);
	$sth1->execute();
}

$dbh->disconnect;
exit;

sub conecta_db_info {
	my $info = DBI->connect('DBI:mysql:information_schema:localhost', 'root', 'sliver');
	return $info;
}


	
