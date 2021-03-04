#!/bin/zsh

for n in {0..39}; do
	echo performance > /sys/devices/system/cpu/cpu$n/cpufreq/scaling_governor
	cat /sys/devices/system/cpu/cpu$n/cpufreq/scaling_governor
done
