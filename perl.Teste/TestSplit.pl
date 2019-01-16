#!/usr/bin/perl
use strict;
use warnings;
use DBI;
use Encode;

my $string;
#$string = '12/12/17 17:05';
#
#my @dados = split(' ', $string);
#print $dados[0] . "\n" . $dados[1];
$string = '20180808';
my $i = 4;
substr($string, $i, 0) = '-';
#$i += 1;
$i += 3;
substr($string, $i, 0) = '-';
print $string;

exit;
