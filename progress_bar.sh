#!/bin/sh -

bar_size=40
bar_char_done="#"
bar_char_todo="-"
bar_percentage_scale=2


function show_progress {
    current="$1"
    total="$2"

    # Calculate the progress in percentage
    percent=`bc <<< "scale=$bar_percentage_scale; 100 * $current / $total"`

    # The number of done and todod characters
    val_done=`bc <<< "scale=0; $bar_size * $percent / 100"`
    val_todo=`bc <<< "scale=0; $bar_size - $val_done"`

    # Buid the done and todo sub-bars
    sub_bar_done=$(printf "%${val_done}s" | tr " " "${bar_char_done}")
    sub_bar_todo=$(printf "%${val_todo}s" | tr " " "${bar_char_todo}")

    # Output the bar
    echo -ne "\rProgress : [${sub_bar_done}${sub_bar_todo}] ${percent}%"

    if [[ $total -eq $current ]]; then
        echo -e "\nDone"
    fi
}

function heavy_work {
    tasks_in_total=37
    for current_task in $(seq $tasks_in_total)
    do
        sleep 0.2 # Simulate the task running
        show_progress $current_task $tasks_in_total
    done
}

heavy_work



