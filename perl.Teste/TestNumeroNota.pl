#!/usr/bin/perl
use strict;
use warnings;
use DBI;
use Encode;

my $string;
$string = '35150502513989000162550010000379171102375935';
print $string . "\n";


#$string = substr($string, 25);
#print $string . "\n";

$string = substr($string, 25, 9);
print $string . "\n";


exit;
