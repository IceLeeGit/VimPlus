#!/bin/bash


tmux_session="Read Write"
t_list=`tmux ls | awk -F':' '{ print $1 }'`

Write_path="$HOME/ModifyData/"
Read_path="$HOME/ReadData/"


for i in $tmux_session;do
    if [[ $t_list =~ $i ]]; then
        continue
    elif [[ $i == "Read" ]]; then
        pushd $Read_path
        pwd
        tmux new -s $i -d
        popd
    elif [[ $i == "Write" ]]; then
        pushd $Write_path
        pwd
        tmux new -s $i -d
        popd
    fi
done

#tmux a -t Write
tmux -2 a
