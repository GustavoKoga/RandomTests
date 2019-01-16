#!/usr/bin/perl
use strict;
use warnings;
use DBI;
use Encode;

my $data;
$data = '02/2022';

print preparaData($data);
	
# Prepara um campo data e retorno dd/MM/YYYY
sub preparaData {
	my ($data) = @_;
	my ($dia, $mes, $ano) = split('/', $data);
	$dia = converteValor($dia);
	$mes = converteValor($mes);
	$ano = converteValor($ano);
	if ($dia && $mes && $ano) {
		return join('-', $ano, $mes, $dia);
	} elsif ($dia && $mes){
		# Apenas mes/ano
		$ano = $mes;
		$mes = $dia;
		$dia = '01';
		return join('-', $ano, $mes, $dia);
	} else {
		return undef;		
	}
}

# Recebe um valor e converte para double
sub converteValor {
	my ($valor) = @_;
	if (!$valor) {
		return undef;
	}
	
	$valor = trim($valor);
	$valor =~ s/\,/\|/g;
	$valor =~ s/[R\$\.]//g;
	$valor =~ s/\|/\./g;
	return $valor * 1;
}

# Retira os espaços do início e fim
sub trim
{
	my ($string) = @_;
	$string =~ s/^\s+//;
	$string =~ s/\s+$//;
	$string =~ s/^\s+//;
	return $string;
}
exit;
