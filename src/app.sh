#!/bin/bash

export JAVA_OPTS="-Xms512m -Xmx2024m -Xss1m -XX:+UseParallelGC -Xloggc:./logs/gc.log -XX:+PrintGCDetails -XX:+PrintGCDateStamps -XX:+PrintGCTimeStamps"

export APP_CONF="./config/application.yml,./config/application-gauss.yml"

export JAVA_HOME="java"

simpler_command=$1

if [ -z "$2" ];
then
	app_name="compare-app.jar"
else
	app_name=$2
fi

start(){

    nohup $JAVA_HOME $JAVA_OPTS -jar $app_name  --spring.config.location=$APP_CONF  >> ./logs/app.log 2>&1 &
    local process_ids=$(pgrep -f $app_name)

   if [ -z "$process_ids" ]; then
        echo "start app failed "
    else
        echo "start app success "
    fi
}

stop(){
    local process_ids=$(pgrep -f $app_name)
    if [ -z "$process_ids" ]; then
        echo "no matching process was found"
    else
        echo "$process_ids" | tee /dev/stderr | xargs -I {} kill -9 {}
        echo "kill app success"
    fi

}

main(){

    [ ! -d "./logs" ] && mkdir -p ./logs

    case $simpler_command in
      start)
            local process_ids=$(pgrep -f $app_name)
            if [ ! -z "$process_ids" ]; then
                echo "the process exists: $process_ids"
                exit 0
            fi

            start
        ;;
      stop)
            stop
        ;;
      *)
            echo "please enter the start or stop command"
        ;;
    esac
}


main
