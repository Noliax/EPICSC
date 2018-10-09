#!/bin/sh
nb=1
success=1
logs=""
nl='%'

RED='\033[0;31m'
GREEN='\033[0;32m'
PURPLE='\033[0;27m'
NC='\033[0m'

IFS='
'

line=$(tail -n 1 $1)
line=$(echo "$line" | cat -e | head -c 1)
if [ "$line" = '$' ]; then
    success=0
fi

#printf "${NC}______________________________\n\n"
if [ $success -eq 1 ]; then
    printf "    ${GREEN}SUCCESS${NC}:${PURPLE} file.terminate${NC}\n"
else
    printf "    ${RED}FAIL${NC}:${PURPLE} file.terminate${NC} - file MUST NOT terminate with an empty line\n"
    IFS=$nl
    for i in $logs; do
        printf $i'\n'
    done
fi
#printf "${NC}\n"

