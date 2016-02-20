#!/usr/bin/env python3
import subprocess
import sys

import executor

def get_active_sink():
  return executor.run('pacmd list-sinks | grep "* index" | awk \'{print $3}\'')[0]

def get_volume():
  return executor.run('amixer -D pulse get Master | grep -o "\[.*%\]" | grep -o "[0-9]*" | head -n1')[0]

def set_volume(percentage):
  executor.run('pactl set-sink-volume ' + get_active_sink() + ' ' + str(percentage) + '%')
  emit_signal()

def toggle_volume():
  executor.run('amixer -D pulse set Master Playback Switch toggle')
  emit_signal()

def is_muted():
  return not executor.run('amixer -D pulse get Master | grep -o "\[on\]" | head -n1')[0]

def write(message):
  sys.stdout.write(message)
  sys.stdout.flush()

def trim_to_range(volume):
  volume = int(volume)
  if volume < 0:
    volume = 0
  elif volume > 200:
    volume = 200
  return volume

def status():
  if int(get_volume()) == 0 or is_muted():
    return 'muted'
  else:
    return 'on'

def emit_signal():
  executor.run('pkill -RTMIN+1 i3blocks')

if __name__ == '__main__':
  command = sys.argv[1]

  if command == 'set':
    set_volume(trim_to_range(sys.argv[2]))
  elif command == 'up':
    new_volume = trim_to_range(int(get_volume()) + int(sys.argv[2]))
    set_volume(new_volume)
  elif command == 'down':
    new_volume = trim_to_range(int(get_volume()) - int(sys.argv[2]))
    set_volume(new_volume)
  elif command == 'toggle':
    toggle_volume()
  elif command == 'read':
    write(get_volume())
  elif command == 'status':
    write(status())
  elif command == 'i3blocks':
    output = get_volume() + ' '
    if is_muted():
      output += '\n\n#cc241d'
    write(output)
  elif command == 'signal':
    emit_signal()
  else:
    write('Usage: ' + sys.argv[0] + ' [set|up|down|toggle|read|status] [value]\n')
