#/bin/sh -

function foo() {
    echo "Number of args: $#"
    return 0
}

function foo2() {
    echo "Number of args: $#"
    return 1
}

function foo3() {
	echo "Number of args: $#"
	for arg in $@; do
		echo "Arg: $arg"
	done
}


foo "a" "b" "c"
echo "Function return value is: $?"

foo2 "a" "b" "c"
echo "Function return value is: $?"

foo3 "a" "b" "c"
echo "Function return value is: $?"
