#!/usr/bin/env sh
#
# Prints the total number of unseen messages in pidgin.
# This requires the pidgin property "Set X property" to be set.
#
set -e

PIDGIN="pidgin"
PIDGIN_UNREAD_PROPERTY="_PIDGIN_UNSEEN_COUNT"

pidgin_pid=`ps aux | grep -E "${PIDGIN}\$" | awk '{print $2}'`
if [ ! -n "${pidgin_pid}" ]; then
  exit 1
fi

window_ids=`wmctrl -l -p | grep " ${pidgin_pid} " | grep -v "Buddy List" | awk '{print $1}'`

total=0
for id in ${window_ids}; do
  line=`xprop -id ${id} | grep "${PIDGIN_UNREAD_PROPERTY}"`
  if [ -n "${line}" ]; then
    unread_messages=`echo "${line}" | awk -F'=' '{print $2}' | tr -d ' '`
    total=$((total+unread_messages))
  fi
done

echo "${total}"
