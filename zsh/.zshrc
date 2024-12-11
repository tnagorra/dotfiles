# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# BASE CONF

setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY_TIME

export SAVEHIST=50000
export HISTSIZE=$SAVEHIST
export HISTFILE=~/.zsh_history
export EDITOR='nvim'
# export TERM=xterm-256color
export TERM=xterm-kitty
export GPG_TTY=$TTY

# BINDINGS

bindkey -v
bindkey '^ ' autosuggest-accept

# ZGENOME

[ -f ~/.zgenom/zgenom.zsh ] && source ~/.zgenom/zgenom.zsh
if ! zgenom saved; then
  zgenom load romkatv/powerlevel10k powerlevel10k
  zgenom load zsh-users/zsh-autosuggestions
  zgenom load zsh-users/zsh-completions
  zgenom load zsh-users/zsh-syntax-highlighting
  zgenom load zuxfoucault/colored-man-pages_mod

  zgenom ohmyzsh plugins/wd

  # trapd00r/LS_COLORS

  zgenom save
fi

# FZF

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ALIASES

[ -f ~/.aliases.zsh ] && source ~/.aliases.zsh
[ -f ~/.ssh-aliases.zsh ] && source ~/.ssh-aliases.zsh

# APPLICATIONS

[ -f ~/.applications.zsh ] && source ~/.applications.zsh

# POWERLEVEL10K
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# GPG AGENT as SSH AGENT

unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
