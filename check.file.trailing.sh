#!/bin/sh
nb=1
success=1
logs=""
nl='%'

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

IFS='
'
for line in $(cat $1); do
    lastc=""$(echo "$line" |  tail -c 2)""
    if [ "$lastc" = ' ' ]; then
        logs=$logs'        > '$1':'$nb$nl
        success=0
    fi
    nb=$(($nb + 1))
done
#printf "${NC}______________________________\n\n"
if [ $success -eq 1 ]; then
    printf "    ${GREEN}SUCCESS${NC}: file.trailing\n"
else
    printf "    ${RED}FAIL${NC}: file.trailing (line ends with one or more whitespaces)\n"
    IFS=$nl
    for i in $logs; do
        printf $i'\n'
    done
fi
#printf "${NC}\n"

