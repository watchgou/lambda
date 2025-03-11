#!/bin/bash

while getopts 'h:u' OPT; do
    case $OPT in
        u)
            echo "--------"
        ;;
        h)
            H_DIR="$OPTARG"
        ;;
        ?)
           echo "$OPTARG"
        ;;
    esac
done

echo "$H_DIR"

shift $((OPTIND-1))


echo "After shift: $1"

echo "After shift: $@"
