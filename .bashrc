########################################################
# load Square specific bashrc
########################################################
source ~/Development/config_files/square/bashrc
########################################################

# uncomment to automatically `bundle exec` common ruby commands
# if [[ -f "$SQUARE_HOME/config_files/square/bundler-exec.sh" ]]; then
#   source $SQUARE_HOME/config_files/square/bundler-exec.sh
# fi
alias dashdoc="sq @dashboard stop && rm -rf tmp && sq @dashboard build"

# load the aliases in config_files files (optional)
source ~/Development/config_files/square/aliases

[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"
[[ -f "$HOME/.localaliases" ]] && source "$HOME/.localaliases"

###########################################
# Feel free to make your own changes below.
###########################################

################################################################
# Command prompt
purp=$(tput setaf 5)
cyan=$(tput setaf 6)
bold=$(tput bold)
reset=$(tput sgr0)
export PS1='\[$reset\]\[$cyan\]\W\[$reset\]/ \[$purp\]\u\[$cyan\]$\[$reset\] '

################################################################
# Path
export PATH="$PATH:/usr/local/mysql/bin"

################################################################
# Bash setting
stty werase undef
export LSCOLORS='gxfxcxdxbxegedabagacad'
export CLICOLOR='YES'
export GREP_OPTIONS='--color=auto'
alias ll="ls -lah"
alias ls="ls -F"
alias cdd="cd ~/Development"
alias cddd="cd ~/Development/dashboard"
cdf () { cd `dirname $1`; }
set -o ignoreeof
alias cd..="cd .."
stty -ixon # C-s in bash will now properly perform incremental search forward
export PAGER="`which less`"

################################################################
# History
HISTSIZE=1000
HISTFILESIZE=500
# https://www.digitalocean.com/community/tutorials/how-to-use-bash-history-commands-and-expansions-on-a-linux-vps
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
# ^ gets history to be consistent accross different shells. before each command:
# 1. append this shell's history to history file
# 2. clear this shell's history
# 3. copy history from history file
alias hist='eval "history $((`tput lines` - 2))"'

################################################################
# Finder
alias showHidden="echo use CMD-SHIFT-. in finder"
alias hideHidden="echo use CMD-SHIFT-. in finder"

################################################################
# Git
alias prune="git checkout master; git remote prune origin; git branch | sed -Ee 's/^\*? *//g' -Ee '/^master$/d' | xargs git branch -D;"
# alias prune="git remote prune origin; git branch | xargs git branch -D;"
alias gitlog="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gitgraph="git log --graph --pretty=oneline --abbrev-commit;"
alias gi='echo git |'
alias tpull='xargs -t -I {} bash -c "{} pull"'
if [ -f ~/.git-completion.bash ]; then # git autocompletion https://git-scm.com/book/en/v1/Git-Basics-Tips-and-Tricks
. ~/.git-completion.bash
fi

################################################################
# Mac settings
defaults write NSGlobalDomain KeyRepeat -int 4
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write -g NSTextKillRingSize -string 4
defaults write -g ApplePressAndHoldEnabled -bool false

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
