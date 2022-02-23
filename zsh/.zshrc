# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

setopt EXTENDED_HISTORY
export SAVEHIST=50000
export HISTSIZE=$SAVEHIST
export HISTFILE=~/.zsh_history
export EDITOR='nvim'
export TERM=xterm-256color

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/zsh_completion" ] && \. "$NVM_DIR/zsh_completion"  # This loads nvm zsh_completion

# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

# pipenv
export PIPENV_VENV_IN_PROJECT="enabled"

# docker
export DOCKER_BUILDKIT=1

# zgenome
[ -f ~/.zgenom/zgenom.zsh ] && source ~/.zgenom/zgenom.zsh
if ! zgenom saved; then
  zgenom load romkatv/powerlevel10k powerlevel10k

  zgenom load zsh-users/zsh-autosuggestions
  zgenom load zsh-users/zsh-completions
  zgenom load zsh-users/zsh-syntax-highlighting
  zgenom load zuxfoucault/colored-man-pages_mod

  zgenom load junegunn/fzf shell/key-bindings.zsh

  zgenom ohmyzsh plugins/wd

  # trapd00r/LS_COLORS

  zgenom save
fi

# p10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# aliases
[ -f ~/.aliases.zsh ] && source ~/.aliases.zsh
[ -f ~/.ssh-aliases.zsh ] && source ~/.ssh-aliases.zsh

bindkey -v
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^ ' autosuggest-accept

# colorscheme

function set_theme() {
  scheme=$(<~/.scheme)
  theme.sh $scheme
  # export LS_COLORS=$(vivid generate $scheme)
}

TRAPUSR1() {
  set_theme
}
set_theme
