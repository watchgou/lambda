#!/bin/bash

init(){
    log_name=$1

    file_path=$2

    if [ -z  "${log_name}" ];
    then
        export ICU_LOG_NAME="applog"
    else
        export ICU_LOG_NAME="$log_name"
    fi

    if [ -z "${file_path}" ];
    then
        export ICU_FILE_PATH="$HOME/logs"
    else
        export ICU_FILE_PATH="$file_path"
    fi
}

_check_env(){

    if [ -z "$ICU_LOG_NAME" ] || [ -z "$ICU_FILE_PATH" ];
    then
        init $ICU_LOG_NAME  $ICU_FILE_PATH
    fi

}


_get_path(){
    script_path=$(readlink -f "$0")
    dir_path=$(echo $script_path|awk -F'/' '{for(i=1; i<NF; i++) printf $i "/"; print ""}')
}


info(){

    _check_env
    _get_path

    sh $dir_path/log/slog.sh "[info] $*"
}

warn(){

    _check_env
    _get_path


    sh $dir_path/log/slog.sh "[warn] $*"
}

error(){

    _check_env
    _get_path

    get_pathsh $dir_path/log/slog.sh "[error] $*"
}
