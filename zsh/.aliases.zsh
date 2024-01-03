# alias pdfjoin='pdfjam --fitpaper true --rotateoversize true --suffix joined'

function night() {
    echo 'Setting colorscheme in kitty'
    kitty +kitten themes --reload-in all "Gruvbox Dark"
    echo 'Setting colorscheme in nvim'
    reload_nvim base16-gruvbox-dark-medium
    echo 'Setting gtk theme'
    gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
}

function day() {
    echo 'Setting colorscheme in kitty'
    kitty +kitten themes --reload-in all "Gruvbox Light"
    echo 'Setting colorscheme in nvim'
    reload_nvim base16-gruvbox-light-medium
    echo 'Setting gtk theme'
    gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita'
}

alias vim="nvim"
alias ls="ls --color"

alias ssh="TERM=screen ssh"

JOURNAL_DIR=~/Logseq/journals

function journal(){
    $EDITOR $JOURNAL_DIR/$(date +%Y_%m_%d -d "$*").md
}
