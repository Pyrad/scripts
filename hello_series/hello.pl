#!/usr/bin/perl

use strict;
use warnings;
use POSIX
print "Good day today, Pyrad\n";
my $date = strftime("%Y-%m-%d",localtime());
my ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst) = localtime();
#print "$date"."\n";
$mon = $mon + 1;
$year = $year + 1900;
print "$year-$mon-$mday $hour:$min:$sec"."\n";
print "Good bye"."\n";

print "Few days are left"."\n";
print "How precious they are"."\n";
