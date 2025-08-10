#!/bin/bash

echo "###############################################################"
echo "######                NGINX Log Analyzer                 ######"
echo "###############################################################"
echo
if [ -z $1 ]
then
    echo "Usage: $0 <nginx_log_file>"
    exit 1
fi

FILE=$1
FILE_DIR=$( dirname $1 )
FILE_NAME=$( basename $1)
FILE_PATH=${FILE_DIR}/${FILE_NAME}

TOP_5_IP=$( cat nginx-access.log | awk -F' ' '{print $1}' | sort | uniq -c | sort -k 1 -r | head -5 | awk -F' ' '{print $2}' )
TOP_5_PATHS=$( cat nginx-access.log | awk -F' ' '{print $7}' | sort | uniq -c | sort -k 1 -r | head -5 | awk -F' ' '{print $2}' )
TOP_5_STAT_CODES=$( cat nginx-access.log | awk -F' ' '{print $9}' | sort | uniq -c | sort -k 1 -r | grep -v "-" | awk -F' ' '{print $2}' | head -5 )

#this one must involve regex to get the whole agent string. to print only the agent, in this case, i tried to find the ones in "".
#i subbed the $1 with empty spaces since $2 isnt enough for the whole line
TOP_5_AGENTS=$( cat nginx-access.log | awk 'match($0, /"[^"]*"$/) {print substr($0, RSTART+1, RLENGTH-2)}' | sort | uniq -c | sort -k 1 -r | head -n 5 | awk '{$1=""; sub(/^ /, ""); print}' )

echo "================== NGINX LOG REPORT =================="
echo
echo "******** TOP 5 IP ADDRESSES WITH MOST REQUESTS ********"
for ip in $TOP_5_IP
do
    echo "-->" $ip
done
echo
echo "******** TOP 5 MOST REQUESTED PATHS ******** "
for path in $TOP_5_PATHS
do
    echo "-->" $path
done
echo
echo "******** TOP 5 RESPONSE STATUS CODES ******* "
for code in $TOP_5_STAT_CODES
do
    echo "-->" $code
done
echo
echo "******** TOP 5 USER AGENTS ******** "
#uses a while loop since with IFS because we are reading lines of strings with spaces
echo "$TOP_5_AGENTS" | while IFS= read -r agent; do
  echo "--> $agent"
done
echo
echo "###############################################################"
echo "######                DONE! Enjoy NGINX!                 ######"
echo "###############################################################"