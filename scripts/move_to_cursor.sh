#!/usr/bin/env bash
# ==============================================================
# Searches for a window by pattern and moves it to the current
# mouse position, but making sure the window is fully visible
# on the screen.
# ==============================================================
set -eu

PATTERN="${1}"
WID=$(xdotool search --onlyvisible ${PATTERN} 2>/dev/null)

# get window geometry
eval $(xdotool getwindowgeometry --shell ${WID} 2>/dev/null)
WIN_WIDTH="${WIDTH}"
WIN_HEIGHT="${HEIGHT}"

# get mouse position
eval $(xdotool getmouselocation --shell 2>/dev/null)
MOUSE_X="${X}"
MOUSE_Y="${Y}"

# get screen size
eval $(xdotool getdisplaygeometry --shell 2>/dev/null)
DISPLAY_WIDTH="${WIDTH}"
DISPLAY_HEIGHT="${HEIGHT}"

# center the window to the mouse
TARGET_X=$((MOUSE_X - WIN_WIDTH / 2))
TARGET_Y=$((MOUSE_Y - WIN_HEIGHT / 2))

# stay in bounds
[[ "${TARGET_X}" -lt "0" ]] && TARGET_X="0"
[[ "${TARGET_Y}" -lt "0" ]] && TARGET_Y="0"
[[ "$((TARGET_X + WIN_WIDTH))" -gt "${DISPLAY_WIDTH}" ]] && TARGET_X="$((DISPLAY_WIDTH - WIN_WIDTH))"
[[ "$((TARGET_Y + WIN_HEIGHT))" -gt "${DISPLAY_HEIGHT}" ]] && TARGET_Y="$((DISPLAY_HEIGHT - WIN_HEIGHT))"

xdotool windowmove ${WID} ${TARGET_X} ${TARGET_Y}
