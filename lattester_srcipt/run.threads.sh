#!/bin/zsh

for i in {1..25}; do
	echo task=4,op=0,access_size=256,parallel=${i},runtime=10,align_mode=1 > /proc/lattester

	result=0

	for j in {1..10}; do
		val=`dmesg | tail -n 10 | sed -n ${j}p | awk '{ print $4 }'`
		result=`expr $result + $val`
	done

	result=`expr $result / 10`
	echo $result >> ~/result.threads.txt
done

