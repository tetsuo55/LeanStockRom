#!/system/bin/sh
#
#
#
#
#
#
#
# Set governor late = let it boot on performance governor
# to speed up boot.
#
#
governor_name=`getprop ro.cpufreq.governor`
case "$governor_name" in
    "interactive")
	echo "interactive" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
	echo "interactive" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
	echo "interactive" > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
	echo "interactive" > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
	echo 1026000 > /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
	echo 30000 > /sys/devices/system/cpu/cpufreq/interactive/timer_rate
	chown system /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
	chown system /sys/devices/system/cpu/cpufreq/interactive/timer_rate
	chown system /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load
	chown system /sys/devices/system/cpu/cpufreq/interactive/boostpulse
       ;;
    *)
        echo "ondemand" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
	echo "ondemand" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
	echo "ondemand" > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
	echo "ondemand" > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
	echo 50000 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate
	echo 90 > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold
	echo 1 > /sys/devices/system/cpu/cpufreq/ondemand/io_is_busy
	echo 4 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_down_factor
	echo 10 > /sys/devices/system/cpu/cpufreq/ondemand/down_differential
	echo 70 > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold_multi_core
	echo 3 > /sys/devices/system/cpu/cpufreq/ondemand/down_differential_multi_core
	echo 918000 > /sys/devices/system/cpu/cpufreq/ondemand/optimal_freq
	echo 1026000 > /sys/devices/system/cpu/cpufreq/ondemand/sync_freq
	echo 80 > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold_any_cpu_load
	chown system /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate
	chown system /sys/devices/system/cpu/cpufreq/ondemand/sampling_down_factor
	chown system /sys/devices/system/cpu/cpufreq/ondemand/io_is_busy
       ;;
    esac

