#!/bin/sh -

################################################
# Redirect the stderr to /dev/null,
# and return the stdout to a variable
################################################
function test_redirect_to_dev_null() {
    errmsg=`which vim`
    echo "$? | $errmsg"

    errmsg=$(which vim)
    echo "$? | $errmsg"

    errmsg=`which vim 2>/dev/null`
    echo "$? | $errmsg"

    errmsg=$(which vim 2>/dev/null)
    echo "$? | $errmsg"

    errmsg=`which vimk 2>/dev/null`
    echo "$? | $errmsg"

    errmsg=$(which vimk 2>/dev/null)
    echo "$? | $errmsg"
}

test_redirect_to_dev_null
