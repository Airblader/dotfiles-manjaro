#!/usr/bin/env python3
import math

def html_hex(color):
  hex_value = str(hex(int(color)))[2:]
  if len(hex_value) == 1:
    return '0' + hex_value
  return hex_value

def decode_color(color):
  return {
    'r': int(color[1:3], 16),
    'g': int(color[3:5], 16),
    'b': int(color[5:7], 16)
  }

def get_color_gradient(percentage, color_map):
  for i in range(1, len(color_map)):
    if percentage < color_map[i]['threshold']:
      break
  lower, upper = color_map[i-1], color_map[i]
  diff = float(upper['threshold'] - lower['threshold'])
  diff_percentage = (percentage - lower['threshold']) / diff
  lower_percentage = 1 - diff_percentage
  upper_percentage = diff_percentage

  lower_color = decode_color(lower['color'])
  upper_color = decode_color(upper['color'])

  color = {
    'r': math.floor( lower_color['r'] * lower_percentage + upper_color['r'] * upper_percentage ),
    'g': math.floor( lower_color['g'] * lower_percentage + upper_color['g'] * upper_percentage ),
    'b': math.floor( lower_color['b'] * lower_percentage + upper_color['b'] * upper_percentage )
  }

  return '#' + html_hex(color['r']) + html_hex(color['g']) + html_hex(color['b'])
