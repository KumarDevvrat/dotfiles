#
#
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="miloshadzic"
# ZSH_THEME="dieter"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git django command-not-found history history-substring-search zsh-syntax-highlighting extract z)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

alias top="htop"
alias go="gnome-open"
alias biggest='find -type f -printf '\''%s %p\n'\'' | sort -nr | head -n 40 | gawk "{ print \$1/1000000 \" \" \$2 \" \" \$3 \" \" \$4 \" \" \$5 \" \" \$6 \" \" \$7 \" \" \$8 \" \" \$9 }"'
alias update="sudo apt-get update && sudo apt-get upgrade"
alias mail="thunderbird --compose"
alias m="mplayer -loop 0"
alias e="cd .."
alias downloadsite="wget --recursive --no-clobber --page-requisites --convert-links --no-parent"
alias :q="exit"
export VEKTOR_HOME="/home/devvrat/Vektor/"
alias idea="/home/devvrat/setups/idea-IU-135.480/bin/idea.sh"
alias mvn="/home/devvrat/setups/apache-maven-3.2.1/bin/mvn" 
alias cdvektor="cd /home/devvrat/work/vektor-project/vektor.insight-flow/trunk" 
alias cdhaskell="cd /home/devvrat/work/haskell" 
alias cdglyve="cd /home/devvrat/work/glyve/code/glyve && workon glyve" 
alias ip="ipython" 
alias p="/home/devvrat/setups/pycharm-3.1.3/bin/pycharm.sh"

unset http_proxy
unset https_proxy

export WORKON_HOME=/home/devvrat/.virtualenvs
export PROJECT_HOME=/home/devvrat/work/glyve/code
source /usr/local/bin/virtualenvwrapper.sh

DIRSTACKSIZE=8
setopt autopushd pushdminus pushdsilent pushdtohome

function chpwd() {
    emulate -L zsh
    ls
}

manswitch () { man $1 | less -p "^ +$2"; }

man2pdf() {TF=`mktemp` && man -t ls >> $TF && okular $TF &>/dev/null }

# Compile zcompdump, if modified, to increase startup speed.
if [ "$HOME/.zcompdump" -nt "$HOME/.zcompdump.zwc" -o ! -e "$HOME/.zcompdump.zwc" ]; then
    zcompile "$HOME/.zcompdump"
fi

# if [ "$GIO_LAUNCHED_DESKTOP_FILE" = "/usr/share/applications/guake.desktop" ]
# then
#     wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
# fi

# Echo TODO LIST here
diarypath=~/vimwiki/diary/$(date -I).wiki

# Required for terminal keybinding fix
# See : https://github.com/robbyrussell/oh-my-zsh/issues/2628
bindkey '\eOA' history-substring-search-up
bindkey '\eOB' history-substring-search-down
