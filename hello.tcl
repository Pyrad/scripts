#!/usr/bin/tclsh

puts "Good day today"

set slist [list a  b c]
foreach x $slist {
    puts $x
    puts "New line"
}
