
# Multiple condition test
a=1
b=13
([[ $a -lt 4 ]] || [[ $a -gt 0 ]]) && [[ $b -ge 2 ]] && echo "YES" || echo "NO"

