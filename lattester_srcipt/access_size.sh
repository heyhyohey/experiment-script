#!/bin/zsh

access_size=64

for i in {6..21}; do
	echo task=4,op=0,access_size=${access_size},parallel=14,runtime=10 > /proc/lattester

	result=0
	cnt=0

	for j in {1..10}; do
		val=`dmesg | tail -n 10 | sed -n ${j}p | awk -F'\t' '{ print $2 }' | cut -d' ' -f1`
		if [ $(echo $val | egrep "[0-9]+") ]; then
			result=`expr $result + $val`
			cnt=`expr $cnt + 1`
		fi
	done

	result=`expr $result / $cnt`
	echo $result >> ~/access_size_load.txt
	sleep 1s
	echo $access_size
	access_size=`expr $access_size * 2`
done
