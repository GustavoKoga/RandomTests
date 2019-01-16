#!/usr/bin/perl
use strict;
use warnings;
use DBI;
use Encode;

my $string;
$string = '08710660';


if (length($string) eq 8) {
#	$string = substr($string, 0, 5) . '-' . substr($string, 5);
	
	substr($string, 5, 0) = '-';

	print $string;
}


exit;
