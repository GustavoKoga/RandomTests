#!/usr/bin/perl
use strict;
use warnings;
use DBI;
use Encode;

my $string;
$string = '0';

if ($string eq 00) {
	print "true \n" ;
	
	if ($string) {
		print "true2 \n";
	} else {
		print "false";
	}
}
print $string;

=begin
$string = '000000';

if ($string) {
	print "true";
} else {
	print "false";
}

while (index($string, '0') != -1) {
	$string = substr($string, index($string, '0') + 1); 
}
if ($string) {
	print "true";
} else {
	print "false";
}


if ($string) {
	print "true";
} else {
	print "false";
}

$string = "00000";

if ($string) {
	print "true";
	 
	if (substr($string, index($string, '0') + 1)) {
		print "true2";
	} else {
		print "false2";
	}
} else {
	print "false";
} 
=cut


exit;
