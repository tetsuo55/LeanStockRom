#!/system/bin/sh
# Copyright (C) 2015 Sony Mobile Communications Inc.

if [ -d /sys/fs/selinux/trap ]; then
  if [ -e /system/etc/selinux_trap.rules ]; then
    # Parse default Mask Rules
    while read line; do
      case "$line" in
        [-+],*) echo "$line" > /sys/fs/selinux/trap/add_exception;;
        \#*)    ;; # comment (NOP)
        *)      ;; # syntax error (NOP)
      esac
    done < /system/etc/selinux_trap.rules
  fi
  # Enable the Trap Module
  echo "1" > /sys/fs/selinux/trap/enable
fi
