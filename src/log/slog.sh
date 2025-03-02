#!/bin/bash


write_log(){

	if [ ! -f ${2}.log ];
	then
		touch $2.log
	fi

	modify_date=$(stat -f "%Sm" -t "%Y%m%d" "$2.log")

	current_date=$(date "+%Y%m%d")

	timers=$(date "+%Y-%m-%d %H:%M:%S")

	if [ "${modify_date}" != "${current_date}" ];
	then
		mv $2.log ${2}${modify_date}.log
	fi

	echo  "[${timers}] ${1}" >> $2.log

}

log_msg=$1

write_log "$log_msg" $ICU_FILE_PATH/$ICU_LOG_NAME
