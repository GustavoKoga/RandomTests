#!/usr/bin/perl
use strict;
use warnings;
use DBI;
use Encode;

my $string;
$string = '12/12/17 17:05';

print cortarStringAntesChar($string, ' ');

# Pega uma string, um char, corta a string e retorna o que vem APÓS o char
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

# Pega uma string, um char, corta a string e retorna o que vem ANTES do char
sub cortarStringAntesChar {
	my ($string, $char) = @_;
	
	# Verificar se a string não é vazia
	if ($string && $char) {
		if (index($string, $char) != -1) {
			while (index($string, $char) != -1) {
				$string = substr($string, 0, index($string, $char));
			}
		}
	}
	return trim($string);
}

sub trim {
	my ($string) = @_;
	
	if (!$string) {
		return undef;
	}
	
	$string =~ s/^\s+//;
	$string =~ s/\s+$//;
	$string =~ s/^\s+//;
	return $string;
}