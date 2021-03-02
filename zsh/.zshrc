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
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Djbre.popupwindow.settype=false'

# Android
export ANDROID_HOME=${HOME}/Android/Sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

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
export FZF_DEFAULT_COMMAND="rg -i --files --no-ignore-vcs --follow --hidden 2> /dev/null"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# ALIAS
alias next="alacritty-colorscheme -V toggle"
alias prev="alacritty-colorscheme -V toggle --reverse"
alias day="alacritty-colorscheme -V apply base16-gruvbox-light-hard.yml"
alias night="alacritty-colorscheme -V apply base16-gruvbox-dark-soft.yml"
alias softday="alacritty-colorscheme -V apply base16-cupertino.yml"
alias softnight="alacritty-colorscheme -V apply base16-spacemacs.yml"

alias vim="nvim"
alias ls="ls --color"
# alias def="sdcv"

TOGGLE_LOCAL=toggle@local.togglecorp.com
HELIX_NIGHTLY=ec2-user@ec2-54-237-174-243.compute-1.amazonaws.com
HELIX_ALPHA=ec2-user@ec2-34-193-32-225.compute-1.amazonaws.com
HELIX_OLD=allochi@139.162.221.150

alias sshd-toggle-local="ssh -v -i $HOME/.ssh/toggle-local $TOGGLE_LOCAL -N -L 8888:localhost:3211 -4"
alias sshd-helix-nightly="ssh -v -i $HOME/.ssh/helix-nightly $HELIX_NIGHTLY -N -L 9999:localhost:6050 -4"
alias sshd-helix-alpha="ssh -v -i $HOME/.ssh/helix-alpha $HELIX_ALPHA -N -L 4114:localhost:4114 -4"
alias sshd-helix-old="ssh -v -i $HOME/.ssh/helix-old $HELIX_OLD -N -L 5555:localhost:5432 -4"

alias ssh-toggle-local="ssh -i $HOME/.ssh/toggle-local $TOGGLE_LOCAL"
alias ssh-helix-nightly="ssh -v -i $HOME/.ssh/helix-nightly $HELIX_NIGHTLY"
alias ssh-helix-alpha="ssh -v -i $HOME/.ssh/helix-alpha $HELIX_ALPHA"
alias ssh-helix-old="ssh -v -i $HOME/.ssh/helix-old $HELIX_OLD"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/zsh_completion" ] && \. "$NVM_DIR/zsh_completion"  # This loads nvm zsh_completion
