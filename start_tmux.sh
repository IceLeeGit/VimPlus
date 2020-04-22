#!/bin/bash


TmuxPath='/usr/bin/tmux -2'

tmux_session="Read Write"
t_list=`${TmuxPath} ls | awk -F':' '{ print $1 }'`

Write_path="$HOME/ModifyData/"
Read_path="$HOME/ReadData/"


for i in $tmux_session;do
    if [[ $t_list =~ $i ]]; then
        continue
    elif [[ $i == "Read" ]]; then
        pushd $Read_path
        ${TmuxPath} new -s $i -d
        popd
    elif [[ $i == "Write" ]]; then
        pushd $Write_path
        ${TmuxPath} new -s $i -d
        popd
    fi
done

${TmuxPath} a
