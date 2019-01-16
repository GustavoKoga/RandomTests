#!/usr/bin/perl
use strict;
use warnings;
use DBI;
use Encode;
use Time::Local 'timelocal_nocheck';

my ($sec,$min,$hour) = qw( 0 0 0 );
my ($mday, $mon, $year) = qw(30 9 2021);
$mon--; # because that's how unix/C treat the month value

my $timeLocal = timelocal_nocheck( 0, 0, 0, $mday, $mon, $year );

my ($newMday,$newMon,$newYear) = (localtime($timeLocal))[3..5];
$newYear += 1900;
$newMon += 1;

print join ('-', $newYear, $newMon, $newMday);

exit;
