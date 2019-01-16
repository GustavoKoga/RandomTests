#!/usr/bin/perl
use strict;
use warnings;
use DBI;
use Encode;

print "Enter a number or string: ";
my $s = <STDIN>;
chomp $s;
if ( $s =~ /^[0-9,.E]+$/ ) {      # char class, 1 or more of any of th
  print "$s is a number\n";         # & the ^...$ restricts what's teste
} else {
  print "'$s' may be a string\n";    # Not "isn't a number"
}


exit;
