### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

zinit wait lucid light-mode for \
    sbin \
        mfaerevaag/wd \
        zuxfoucault/colored-man-pages_mod \
    atinit"zicompinit; zicdreplay" \
        zdharma/fast-syntax-highlighting \
    atload"_zsh_autosuggest_start; bindkey '^ ' autosuggest-accept; export ZSH_AUTOSUGGEST_USE_ASYNC=1" \
        zsh-users/zsh-autosuggestions \
    blockf atpull'zinit creinstall -q .' \
        zsh-users/zsh-completions

zinit light-mode for \
    sbin \
        denysdovhan/spaceship-prompt \
    atclone"dircolors -b LS_COLORS > clrs.zsh" \
    atpull'%atclone' pick"clrs.zsh" nocompile'!' \
    atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”' \
        trapd00r/LS_COLORS

export SPACESHIP_PROMPT_ADD_NEWLINE=false
export SPACESHIP_PROMPT_SEPARATE_LINE=true
export SPACESHIP_HG_SHOW=false
export SPACESHIP_PACKAGE_SHOW=false
export SPACESHIP_NODE_SHOW=false
export SPACESHIP_RUBY_SHOW=false
export SPACESHIP_ELM_SHOW=false
export SPACESHIP_ELIXIR_SHOW=false
export SPACESHIP_XCODE_SHOW_LOCAL=false
export SPACESHIP_XCODE_SHOW_LOCAL=false
export SPACESHIP_GOLANG_SHOW=false
export SPACESHIP_PHP_SHOW=false
export SPACESHIP_RUST_SHOW=false
export SPACESHIP_HASKELL_SHOW=false
export SPACESHIP_JULIA_SHOW=false
export SPACESHIP_DOCKER_SHOW=false
export SPACESHIP_DOCKER_CONTEXT_SHOW=false
export SPACESHIP_AWS_SHOW=false
export SPACESHIP_GCLOUD_SHOW=false
export SPACESHIP_VENV_SHOW=true
export SPACESHIP_PYENV_SHOW=true
export SPACESHIP_DOTNET_SHOW=false
export SPACESHIP_EMBER_SHOW=false
export SPACESHIP_KUBECTL_SHOW=false
export SPACESHIP_KUBECTL_VERSION_SHOW=false
export SPACESHIP_KUBECONTEXT_SHOW=false
export SPACESHIP_TERRAFORM_SHOW=false
export SPACESHIP_EXIT_CODE_SHOW=true
export SPACESHIP_EXIT_CODE_SYMBOL="❌"
### End of Zinit's installer chunk

bindkey -v
bindkey '^R' history-incremental-pattern-search-backward

setopt EXTENDED_HISTORY
export SAVEHIST=50000
export HISTSIZE=$SAVEHIST
export HISTFILE=~/.zsh_history
export EDITOR='nvim'
export TERM=xterm-256color
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:$HOME/.local/bin"

# Java
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'

# Qt
export QT_QPA_PLATFORMTHEME=gnome

# Wayland
if command -v sway &> /dev/null; then
    export QT_QPA_PLATFORM=wayland
    export CLUTTER_BACKEND=wayland
    export SDL_VIDEODRIVER=wayland
    export XDG_CURRENT_DESKTOP=sway
    export MOZ_ENABLE_WAYLAND=1 # enable wayland on mozilla firefox
fi

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="rg -i --files --no-ignore --follow --hidden -g '!{.git,node_modules,coverage,.cache,android,ios,__pycache__}' 2> /dev/null"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

function reload_nvim {
    for SERVER in $(nvr --serverlist); do
        # nvr --remote-send '<ESC>,r' --servername $SERVER &
        nvr --nostart -cc "source ~/.config/nvim/init.vim" --servername $SERVER &
    done
}

# ALIAS
COLOR_DIR="~/.aaron-williamson-alacritty-theme/colors"
LIGHT_COLOR='base16-gruvbox-light-hard.yml'
DARK_COLOR='base16-gruvbox-dark-soft.yml'
SOFT_DARK_COLOR='base16-spacemacs.yml'
SOFT_LIGHT_COLOR='base16-cupertino.yml'
alias next="alacritty-colorscheme -C $COLOR_DIR -T -V && reload_nvim"
alias prev="alacritty-colorscheme -C $COLOR_DIR -T -r -V && reload_nvim"
alias cur="alacritty-colorscheme -C $COLOR_DIR -s"
alias day="alacritty-colorscheme -C $COLOR_DIR -a $LIGHT_COLOR -V && reload_nvim"
alias night="alacritty-colorscheme -C $COLOR_DIR -a $DARK_COLOR -V && reload_nvim"
alias softday="alacritty-colorscheme -C $COLOR_DIR -a $SOFT_LIGHT_COLOR -V && reload_nvim"
alias softnight="alacritty-colorscheme -C $COLOR_DIR -a $SOFT_DARK_COLOR -V && reload_nvim"

alias vim="nvim"
alias def="sdcv"
alias ls="ls --color"
