#!/bin/sh

#if [ $# -lt 1 ]; then
#    $1='"."'
#fi

pth=$(pwd)
home=$(cd; pwd)
scripts=$(find ~/afs/myscripts/check_style/ -wholename $home'/afs/myscripts/check_style/check.*.sh')
files=$(find $1 -wholename '*.c' -o -wholename '*.h') 
#$(find $1 -wholename '*.h')
#echo '*****'
#echo $files
#echo '*****'
#echo $scripts
#echo '*****'

BLUE='\033[0;36m'
NC='\033[0m' # No Color

for i in $files; do
    printf "${BLUE}$i${NC}\n"
    for j in $scripts; do
        $j $i
    done
done
echo "______________________________"
echo ''
