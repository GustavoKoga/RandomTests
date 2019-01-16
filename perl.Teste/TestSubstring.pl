#!/usr/bin/perl
use strict;
use warnings;
use DBI;
use Encode;

my $string;

$string = "123,";

print substr($string, 0, length($string) - 1);

exit;
