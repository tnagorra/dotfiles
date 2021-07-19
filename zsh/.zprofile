export PATH="$PATH:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:"
export PATH="$PATH:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.local/bin:$HOME/.cargo/bin"

# Java
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Djbre.popupwindow.settype=false'

# Android
export ANDROID_HOME=$HOME/Android/Sdk
export PATH="$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools"

# FZF
export PATH="$PATH:/$HOME/.fzf/bin"
export FZF_DEFAULT_COMMAND="rg -i --files --no-ignore-vcs --follow --hidden 2> /dev/null"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Neovide
export NeovideMultiGrid='true'

# PyEnv
export PATH="$PYENV_ROOT/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init --path)"
fi

# Qt
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_PLUGIN_PATH=/usr/lib/qt/plugins

# Sway or StartX
if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
    if command -v sway &> /dev/null; then
        export QT_QPA_PLATFORM=wayland
        export CLUTTER_BACKEND=wayland
        export SDL_VIDEODRIVER=wayland
        export XDG_CURRENT_DESKTOP=sway
        export XDG_SESSION_TYPE=wayland
        export MOZ_ENABLE_WAYLAND=1 # enable wayland on mozilla firefox
        exec sway
    else
        exec startx
    fi
fi
