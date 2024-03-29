#!/bin/bash
OUTPUT=$1
# `jq -e` will exit with exitcode=1 if final value is false.
if swaymsg -t get_outputs -r | jq -e '.[] | select(.name=="'${OUTPUT}'") | .active' ; then {
    swaymsg output ${OUTPUT} disable
} else {
    swaymsg output ${OUTPUT} enable
}
fi
