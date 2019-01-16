#!/usr/bin/perl
use strict;
use warnings;
use DBI;
use Encode;

=begin
Caso tirar um relatório perl e quiser montar um arquivo txt, csv, etc
execute o arquivo como

perl [nomeRelatorio].pl > [nomearquivo]

EX.: perl TestRelatorio.pl > relatorio.txt

=cut

for (my $i = 0; $i < 10; $i++) {
	print $i . "\n";
}

exit;
