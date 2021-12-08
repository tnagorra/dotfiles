#!/bin/bash
image=$HOME/.config/sway/windows-error.png
bgcolor=#1f67b1
swaylock --daemonize --no-unlock-indicator --ignore-empty-password --image "$image" --color="$bgcolor" --scaling=center
