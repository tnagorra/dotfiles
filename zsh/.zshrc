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
export SPACESHIP_EXIT_CODE_SYMBOL="  "
### End of Zinit's installer chunk

bindkey -v
bindkey '^R' history-incremental-pattern-search-backward

setopt EXTENDED_HISTORY
export SAVEHIST=50000
export HISTSIZE=$SAVEHIST
export HISTFILE=~/.zsh_history
export EDITOR='nvim'
export TERM=xterm-256color

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/zsh_completion" ] && \. "$NVM_DIR/zsh_completion"  # This loads nvm zsh_completion

if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi
export PIPENV_VENV_IN_PROJECT="enabled"

export DOCKER_BUILDKIT=1

[ -f ~/.aliases.zsh ] && source ~/.aliases.zsh
[ -f ~/.ssh-aliases.zsh ] && source ~/.ssh-aliases.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"

zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

zinit wait lucid light-mode for \
    sbin \
        mfaerevaag/wd \
        zuxfoucault/colored-man-pages_mod \
    atinit"zicompinit; zicdreplay" \
        zdharma-continuum/fast-syntax-highlighting \
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

### End of Zinit's installer chunk
