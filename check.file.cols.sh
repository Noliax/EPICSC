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
    if [ ${#line} -gt 79 ]; then
        logs=$logs'        > '$1':'$nb$nl
        success=0
    fi
    nb=$(($nb + 1))
done
#printf "${NC}______________________________\n\n"
if [ $success -eq 1 ]; then
    printf "    ${GREEN}SUCCESS${NC}: file.cols\n"
else
    printf "    ${RED}FAIL${NC}: file.cols (more than 80 columns)\n"
    IFS=$nl
    for i in $logs; do
        printf $i'\n'
    done
fi
#printf "${NC}\n"

