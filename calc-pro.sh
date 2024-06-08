#!/bin/bash

export TZ='Asia/Shanghai'

cd ~/ceremonyclient/node && ./node-1.4.19-linux-amd64 --balance >> bal.txt 2>&1


last_line=$(tail -n 1 bal.txt)
number=$(echo $last_line | grep -o '[0-9.]*')
date1=$(date +'%Y-%m-%d %H:%M:%S')
echo "$date1 ===>  $number"

sleep 60

cd ~/ceremonyclient/node && ./node-1.4.19-linux-amd64 --balance >> bal.txt 2>&1

new_last_line=$(tail -n 1 bal.txt)
new_number=$(echo $new_last_line | grep -o '[0-9.]*')
date2=$(date +'%Y-%m-%d %H:%M:%S')
echo "$date2 ===>  $new_number"


diff=$(echo "($new_number - $number) * 1440" | bc)

echo "一天的产量: $diff 个 QUIL"
