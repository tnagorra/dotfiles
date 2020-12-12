if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
    if command -v sway &> /dev/null; then
        XDG_CURRENT_DESKTOP=sway XKB_DEFAULT_LAYOUT=us exec sway
    else
        exec startx
    fi
fi
