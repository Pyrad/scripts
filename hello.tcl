#!/usr/bin/tclsh

puts "Good day today"
puts "Good day yesterday"

set slist [list a  b c]
foreach x $slist {
    puts $x
}
