#!/bin/bash

x_pos="963"   # Position of the mouse pointer in X.
y_pos="594"   # Position of the mouse pointer in Y.

# Exit if not runs from a terminal.
test -t 0 || exit 1

# When killed, run stty sane.
trap 'stty sane; exit' SIGINT SIGKILL SIGTERM

# When exits, kill this script and it's child processes (the loop).
trap 'kill 0' EXIT

# Do not show ^Key when press Ctrl+Key.
stty -echo -icanon -icrnl time 0 min 0

# While the pears become pears...
while true; do
    xdotool mousemove "$x_pos" "$y_pos" click --delay 10 1
done & # Note the &: We are running the loop in the background to let read to act.

# Pause until reads a character.
#read -n 1
sleep 3

# Exit.
exit 0