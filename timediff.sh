#!/bin/bash

# input as ./timediff.sh 5:30 22:00
h1=$(echo $1|awk -F: '{print $1}')
m1=$(echo $1|awk -F: '{print $2}')
h2=$(echo $2|awk -F: '{print $1}')
m2=$(echo $2|awk -F: '{print $2}')

h3=$(awk 'BEGIN{print '"$h1"'-'"$h2"'}')
m3=$(awk 'BEGIN{print '"$m1"'-'"$m2"'}')

if [ $m3 -ge 0 ];then
        echo $(awk 'BEGIN{print ('"$h3"'+24) % 24":"'"$m3"'}')
else
        echo $(awk 'BEGIN{print ('"$h3"'-1+24) % 24":"60+'"$m3"'}')
fi
