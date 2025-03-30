#!/bin/bash

_init(){
    file_name=$(echo "${1}"| awk -F '.' '{print $1}')
    export ICU_LOG_NAME="${file_name}"
    export ICU_FILE_PATH="$HOME/logs"
}
_get_path(){
    dir_path=$(cd `dirname $0`/.; pwd)
}


info(){
    _init "$0"
    _get_path
    sh $dir_path/log/slog.sh "[info] $*"
}

warn(){

    _init "$0"
    _get_path
    sh $dir_path/log/slog.sh "[warn] $*"
}

error()
    _init "$0"
    _get_path
    get_pathsh $dir_path/log/slog.sh "[error] $*"
}
