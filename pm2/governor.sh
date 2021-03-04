#!/bin/zsh

for n in {0..71}; do
	echo performance > /sys/devices/system/cpu/cpu$n/cpufreq/scaling_governor
done
