#!/bin/sh
nb=1
success=1
logs=""
nl='%'

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

tab="*["$(printf "\t")"]*"

IFS='
'
for line in $(cat $1); do
    case $line in
        $tab)
            logs=$logs'        > '$1':'$nb' (tabulation detected)'$nl
            success=0;;
    esac
    nb=$(($nb + 1))
done
#printf "    ${NC}______________________________\n\n"
if [ $success -eq 1 ]; then
    printf "    ${GREEN}SUCCESS${NC}: file.indentation\n"
else
    printf "    ${RED}FAIL${NC}: file.indentation\n"
    IFS=$nl
    for i in $logs; do
        printf $i'\n'
    done
fi
#printf "${NC}\n"

