#!/bin/zsh

for i in {26..36}; do
	echo task=3,op=1,access_size=256,stride_size=256,parallel=${i},runtime=10 > /proc/lattester

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
	echo $result >> ~/256_sequential_threads_store.txt
	sleep 1s
done
