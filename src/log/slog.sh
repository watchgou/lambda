#!/bin/bash


write_log(){

    [ ! -f ${2}.log ] && touch $2.log

	modify_date=$(stat -f "%Sm" -t "%Y%m%d" "$2.log")

	current_date=$(date "+%Y%m%d")

	[ "${modify_date}" != "${current_date}" ] && mv $2.log ${2}${modify_date}.log

	echo "${1}" >> $2.log

}

log_msg=$1

write_log "$log_msg" $ICU_FILE_PATH/$ICU_LOG_NAME
