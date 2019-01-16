#!/usr/bin/perl
use strict;
use warnings;
use DBI;
use Encode;

my $string;

=begin
Vales consignados
| ---------CODIGO/DESCRICAO DO PRODUTO---------- --LOTE FABRICANTE--- LOTE INTER QTDE DATA MOVIMENTO VALIDADE DOCUMENTO- --TIPO DO MOVIMENTO-- -FUNC.-- TP |
Vales utilizados
| ---------CODIGO/DESCRICAO DO PRODUTO---------- --LOTE FABRICANTE--- LOTE INTER QTDADE DATA MOVIMENTO VALIDADE ---DOCUMENTO---- --TIPO DOCUMENTO-- QT.DEV |
=cut

$string = "| ---------CODIGO/DESCRICAO DO PRODUTO---------- --LOTE FABRICANTE--- LOTE INTER QTDE DATA MOVIMENTO VALIDADE DOCUMENTO- --TIPO DO MOVIMENTO-- -FUNC.-- TP |";
$string =~ s/\W//g;
print $string . "\n" . length($string) . "\n";

$string = "| ---------CODIGO/DESCRICAO DO PRODUTO---------- --LOTE FABRICANTE--- LOTE INTER QTDE DATA MOVIMENTO VALIDADE DOCUMENTO- --TIPO DO MOVIMENTO-- -FUNC.-- TP |";
$string =~ s/\w//g;
$string =~ s/\s//g;
print $string . "\n" . length($string) . "\n";

$string = "| ---------CODIGO/DESCRICAO DO PRODUTO---------- --LOTE FABRICANTE--- LOTE INTER QTDADE DATA MOVIMENTO VALIDADE ---DOCUMENTO---- --TIPO DOCUMENTO-- QT.DEV |";
$string =~ s/\W//g;
print $string . "\n" . length($string) . "\n";

$string = "| ---------CODIGO/DESCRICAO DO PRODUTO---------- --LOTE FABRICANTE--- LOTE INTER QTDADE DATA MOVIMENTO VALIDADE ---DOCUMENTO---- --TIPO DOCUMENTO-- QT.DEV |";
$string =~ s/\w//g;
$string =~ s/\s//g;
print $string . "\n" . length($string) . "\n";

exit;
