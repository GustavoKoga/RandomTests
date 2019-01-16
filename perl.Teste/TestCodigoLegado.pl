#!/usr/bin/perl
use strict;
use warnings;
use DBI;
use Encode;

my $string;
$string = 'VALOR REF. A PROVISAO DE DESPESA N TED00';

$string =~ s/RECEBIMENTO DE TITULO DE //;

print $string;

sub cortarStringAposChar {
	my ($string, $char) = @_;

	# Verificar se a string não é vazia	
	if ($string && $char) {
		if (index($string, $char) != -1) {
			while (index($string, $char) != -1) {
				$string = substr($string, index($string, $char) + 1);
			}
		}
	}
	return trim($string);
}

exit;