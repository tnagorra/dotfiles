export PATH="$PATH:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:"
export PATH="$PATH:$HOME/.bin:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.local/bin:$HOME/.cargo/bin"


# Go
export GOPATH="$HOME/.local/lib/go"

# Java
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Djbre.popupwindow.settype=false'
export _JAVA_AWT_WM_NONREPARENTING=1

# Android
export ANDROID_SDK_ROOT=$HOME/Android/sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools

# FZF
# export PATH="$PATH:/$HOME/.fzf/bin"
export FZF_DEFAULT_COMMAND="rg -i --files --no-ignore-vcs --follow --hidden 2> /dev/null"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Neovide
# export NeovideMultiGrid='true'

# PyEnv
export PATH="$PYENV_ROOT/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init --path)"
fi

# Gtk theme

# export GTK_THEME=Adwaita:light

# Qt
export QT_SELECT=5
export QT_QPA_PLATFORMTHEME=qt5ct
# export QT_QPA_PLATFORMTHEME=gtk2
# export QT_PLUGIN_PATH=/usr/lib/qt/plugins
# export QT_STYLE_OVERRIDE=adwaita

# sway or StartX
if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
    if command -v sway &> /dev/null; then
        export XDG_CURRENT_DESKTOP=sway
        export XDG_SESSION_TYPE=wayland
        export QT_QPA_PLATFORM=wayland
        export CLUTTER_BACKEND=wayland
        export SDL_VIDEODRIVER=wayland
        export GDK_BACKEND=wayland
        export MOZ_ENABLE_WAYLAND=1 # enable wayland on mozilla firefox
        exec sway
    else
        exec startx
    fi
fi
