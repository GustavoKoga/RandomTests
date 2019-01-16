#!/usr/bin/perl
use strict;
use warnings;
use DBI;
use Encode;

my $string;
$string = '"111796220110"';

print preparaNome($string) . "\n";

$string =~ s/"//g;
print $string;

sub preparaNome {
	my ($nome) = @_;
	if (index($nome, '"') == 1) {
		$nome = substr($nome, index($nome, '"'));
	}
	if (index($nome, '"') == length($nome)) {
		$nome = substr($nome, -1);
	}
	return $nome;
}

=begin
O método index retorna o index do primeiro char de uma string em outra string
index('var', 'texto procurado');
Caso o texto procurado não seja encontrado, o retorno é -1
Caso encontrado, retorna index do primeiro char na string passada

print "$string \n";

if (index($string, '.') != -1) {
	while (index($string, '.') != -1) {
		$string = substr($string, index($string, '.') + 1);
		print "$string \n";
	}
	$string = $string + 1;
} else {
	$string = 1;
}

print "$string\n";


# Pega uma string, um char, corta a string e retorna o que vem após o char
print $string . "\n";
if (index($string, '/') != -1) {
	while (index($string, '/') != -1) {
		$string = substr($string, index($string, '/') + 1);
		print $string . "\n";
	}
	$string = $string + 1;
} else {
	$string = 1;
}

print length($string) . ' - ' . $string . "\n";

while (length($string) > 10) {
	$string = substr($string, 1);
	print length($string) . ' - ' . $string . "\n";
}
=cut	

exit;
