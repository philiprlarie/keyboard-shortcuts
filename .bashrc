########################################################
# load Square specific bashrc
########################################################
[[ -f "$HOME/Development/config_files/square/bashrc" ]] && source ~/Development/config_files/square/bashrc
########################################################

# uncomment to automatically `bundle exec` common ruby commands
# if [[ -f "$SQUARE_HOME/config_files/square/bundler-exec.sh" ]]; then
#   source $SQUARE_HOME/config_files/square/bundler-exec.sh
# fi

# load the aliases in config_files files (optional)
[[ -f "$HOME/Development/config_files/square/aliases" ]] && source ~/Development/config_files/square/aliases

[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"
[[ -f "$HOME/.localaliases" ]] && source "$HOME/.localaliases"

###########################################
# Feel free to make your own changes below.
###########################################
purp=$(tput setaf 5)
cyan=$(tput setaf 6)
grey=$(tput setaf 7)
turquoise=$(tput setaf 29)
bold=$(tput bold)
reset=$(tput sgr0)

################################################################
# Square specific commands
alias dashdoc="echo '${bold}cd ~/Development/dashboard/frontend/dashboard${reset}'; cd ~/Development/dashboard/frontend/dashboard; echo '${bold}watchman watch-del-all${reset}'; watchman watch-del-all; echo '${bold}watchman shutdown-server${reset}'; watchman shutdown-server; echo '${bold}yarn hard-reset${reset}'; yarn hard-reset; echo '${bold}check out https://stash.corp.squareup.com/projects/SQ/repos/dashboard/browse/docs/troubleshooting.md for more troubleshooting ideas${reset}';"
alias emberserve="echo -e '$bold$ yarn install $reset' && yarn install && echo -e '$bold$ yarn fix-watchman$reset' && yarn fix-watchman && echo -e '$bold$ ember serve$reset' && ember serve;"

################################################################
# Command prompt
export PS1='\[$reset\]\[$grey\]\A \[$cyan\]\W\[$reset\]/ \[$purp\]\u\[$cyan\]$\[$reset\] '

################################################################
# Path
export PATH="$PATH:/usr/local/mysql/bin:/Library/PostgreSQL/9.6/bin"
export PATH="$PATH:$HOME/bin"
################################################################
# Bash setting
stty werase undef
export LSCOLORS='gxfxcxdxbxegedabagacad'
export CLICOLOR='YES'
export GREP_OPTIONS='--color=auto'
alias ll="ls -lah"
alias ls="ls -F"
stty -ixon -ixoff
alias cddes="cd ~/Desktop"
alias cdd="cd ~/Development"
alias cddd="cd ~/Development/dashboard/frontend/dashboard; . env/bin/activate"
alias cddj="cd ~/Development/java"
alias cddw="cd ~/Development/web"
alias cd2019="cd ~/Documents/2019"
cdf () { cd `dirname $1`; }
set -o ignoreeof # this way ^d won't kill the terminal session
alias cd..="cd .."
stty -ixon # C-s in bash will now properly perform incremental search forward
export PAGER="`which less`"
export EDITOR="`which emacs`"
export VISUAL="`which emacs`"
alias wpc='sqssh web sjc2b '\''echo Web Production Console; cd current; ~/current/bin/bundle exec rails console'\'''
export PGPASSWORD=''

################################################################
# History
HISTSIZE=10000
HISTFILESIZE=5000
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
alias gitlog="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gitgraph="git log --graph --pretty=oneline --abbrev-commit;"
gi () {
  echo ${bold}git "${1:1}" "${@:2}"${reset}
  git "${1:1}" "${@:2}"
}
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

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
