# alias pdfjoin='pdfjam --fitpaper true --rotateoversize true --suffix joined'

function night() {
    kitty +kitten themes --reload-in all "Gruvbox Dark"
    reload_nvim base16-gruvbox-dark-medium
}

function day() {
    kitty +kitten themes --reload-in all "Gruvbox Light"
    reload_nvim base16-gruvbox-light-medium
}

alias vim="nvim"
alias ls="ls --color"
