#!/bin/bash


write_log(){

    local message="${1}"

    local file_name=${2}.log

    [ -f ${file_name} ] || touch ${file_name}

	modify_date=$(stat -f "%Sm" -t "%Y%m%d" "${file_name}")

	current_date=$(date "+%Y%m%d")

	[ "${modify_date}" != "${current_date}" ] && mv ${file_name} ${2}${modify_date}.log

	echo "${message}" >> ${file_name}

}

log_msg="${1}"

write_log "$log_msg" $ICU_FILE_PATH/$ICU_LOG_NAME
