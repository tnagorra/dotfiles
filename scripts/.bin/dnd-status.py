#! /bin/python

import os
import json

dnd_mode = 'do-not-disturb'

mako_modes_str = os.popen('makoctl mode').read()
mako_modes = mako_modes_str.strip().split('\n')

if dnd_mode in mako_modes:
    print(json.dumps({
        "text": "dnd",
        "tooltip": "activated",
        "alt": "activated",
        "class": "activated"
    }))
else:
    print(json.dumps({
        "text": "dnd-disabled",
        "tooltip": "deactivated",
        "alt": "deactivated",
        "class": "deactivated"
    }))
