#/bin/sh -

function foo() {
    echo "Number of args: $#"
    return 0
}

function foo2() {
    echo "Number of args: $#"
    return 1
}


foo "a" "b" "c"
echo "Function return value is: $?"

foo2 "a" "b" "c"
echo "Function return value is: $?"
