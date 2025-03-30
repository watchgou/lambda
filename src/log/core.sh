#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

timers=$(date "+%Y-%m-%d %H:%M:%S")

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
    sh $dir_path/log/slog.sh "[${timers}] [info ] $*"
}

warn(){

    _init "$0"
    _get_path
    sh $dir_path/log/slog.sh "${YELLOW}[${timers}] [warn ] ${*}${NC}"
}

error(){
    _init "$0"
    _get_path
    sh $dir_path/log/slog.sh "$RED[${timers}] [error] ${*}${NC}"
}
