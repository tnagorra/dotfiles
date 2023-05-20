#! /bin/python

import os

dnd_mode = 'do-not-disturb'

mako_modes_str = os.popen('makoctl mode').read()
mako_modes = mako_modes_str.strip().split('\n')

if dnd_mode in mako_modes:
    os.system(f'makoctl mode -r {dnd_mode}')
else:
    os.system(f'makoctl mode -a {dnd_mode}')
