#!/bin/bash


write_log(){

    local file_name=${2}.log

    [ ! -f ${file_name} ] && touch ${file_name}

	modify_date=$(stat -f "%Sm" -t "%Y%m%d" "${file_name}")

	current_date=$(date "+%Y%m%d")

	[ "${modify_date}" != "${current_date}" ] && mv ${file_name} ${file_name}${modify_date}.log

	echo "${1}" >> $2.log

}

log_msg=$1

write_log "$log_msg" $ICU_FILE_PATH/$ICU_LOG_NAME
