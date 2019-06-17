##############################################################
# load Square specific bash_profile
##############################################################
[[ -f "$HOME/Development/config_files/square/bash_profile" ]] && source ~/Development/config_files/square/bash_profile
##############################################################

# vim: filetype=sh

###########################################
# Feel free to make your own changes below.
###########################################

export GOROOT=/usr/local/opt/go/libexec

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
