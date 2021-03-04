#!/bin/zsh

for n in {0..39}; do
	echo 2500000 > /sys/devices/system/cpu/cpu$n/cpufreq/cpuinfo_max_freq
	cat /sys/devices/system/cpu/cpu$n/cpufreq/cpuinfo_max_freq
done
