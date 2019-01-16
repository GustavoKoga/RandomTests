#!/usr/bin/perl
use strict;
use warnings;
use DBI;
use Encode;
require "00-my.lib";

my $arquivo;

=begin
# Leitura de um arquivo pré-definido
$arquivo = 'nome.csv';
=cut

=begin
# Leitura de um arquivo informado por parâmetros de execução
$arquivo = $ARGV[0];
=cut

my $query;
my $sth;

my $dbh = &conecta_db();
open (my $fh, $arquivo);
my @linhas = <$fh>;
chomp @linhas;
close $fh;

=begin
#Leitura a partir da primeira linha da planilha
foreach my $linha (@linhas) {
	
	my (@dados) = split('\|', $linha);
	
}
=cut

=begin
#Definir a linha de leitura inicial
for (my $i = 1; $i < scalar(@linhas); $i++) {
	
    my $linha = $linhas[$i];
	my (@dados) = split('\|', $linha);
	
}
=cut

$dbh->disconnect;
exit;
