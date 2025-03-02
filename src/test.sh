#!/bin/bash

get_path(){

    script_path=$(readlink -fn "$0")

    dir_path=$(echo $script_path|awk -F'/' '{for(i=1; i<NF; i++) printf $i "/"; print ""}')

}
get_path

source $dir_path/log/core.sh

test(){

    init "greet" "/Users/jon/workspace"
    info "$1"

}

test "$1"
