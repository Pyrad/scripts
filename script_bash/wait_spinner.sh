#!/bin/sh -

function wait_with_spinner() {
    # Return if wrong argument number
    [[ $# -lt 1 ]] && return -1

    # 1st argument is the PID to wait for
    wait_pid=$1

    # Refresh time interval, for example here is 1 second
    wait_interval=1

    # Symbols to echo
    icons=('-' '\' '|' '/')
    len=${#icons[@]}

    # Print spinner while waiting
    idx=0
    while kill -0 $pid 2>/dev/null; do
        curchar=${icons[$idx]}
        echo -ne "${curchar} \r"
        idx=$((idx + 1))
        idx=$((idx % len))
        sleep $wait_interval
    done

    # Wait for process
    wait $pid
    # Get the return code of the process
    rcode=$?
    # Say the spinner stopped
    echo "Spinner stoped"

    # Return the error code of the process
    return $rcode
}

function long_run_command() {
    sleep 5
    return 42
}

# Run the time consuming command in the background
long_run_command &
# Get the pid of the background process
pid=$!
# Print spinner
wait_with_spinner $pid
# End message
echo "Execution done"

