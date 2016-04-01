# gotta be vi
bindkey -v
export KEYTIMEOUT=1

# set lang
export LANG=ja_JP.UTF-8

# my commnad aliases
alias ls='ls -FG'
alias ll='ls -l'
alias l='ls -ltr'
alias la='ls -ltra'

# for custom aliases 
if [[ -f ~/.myalias ]]; then
    source ~/.myalias
fi

# For GCP
export CLOUDSDK_COMPUTE_ZONE=asia-east1-c
export CLOUDSDK_COMPUTE_REGION=asia-east1

# path for homebrew and pipsi (this must come to the very begining of PATH)
export PATH=/usr/local/bin:/usr/local/sbin:$HOME/.local/bin:$PATH

# for completion
fpath=(/usr/local/share/zsh-completions $fpath)

# for ruby
# export PATH=$HOME/.rbenv/shims:$PATH
# eval "$(rbenv init -)"

# for node.js nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# for golang
export GOVERSION=1.6
export GOPATH=$HOME/.go/$GOVERSION
export PATH=$GOPATH/bin:$PATH
alias gp='cd $GOPATH/src/github.com/achiku/'

# for Java
export JAVA_HOME=$( /usr/libexec/java_home -v 1.8 )

# for python virtualenv (manage python with homebrew)
v_env_wrapper=/usr/local/bin/virtualenvwrapper.sh
if [ -r $v_env_wrapper ]; then
    export WORKON_HOME=$HOME/.virtualenvs
    source $v_env_wrapper
fi
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
export VIRTUALENV_USE_DISTRIBUTE=true

# for postgresql
export PGDATA=/usr/local/var/postgres

# for docker
. $HOME/.dockerrc


# for custom tools
export PATH=$HOME/bin:$PATH

# neovim
alias vim=nvim

# zsh completion
autoload -U compinit
compinit

# zsh history
HISTFILE=~/.zsh_history
LISTMAX=10000
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

setopt auto_pushd
setopt list_packed
setopt nolistbeep
autoload colors
colors
autoload zed

case ${UID} in
0)
  PROMPT="%{${fg[red]}%}%/#%{${reset_color}%}#  "
  PROMPT2="%{${fg[red]}%}%_#%{${reset_color}%}# "
  SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}#} "
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
    PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
  ;;
*)
  PROMPT='%{$fg[red]%}[%~]%{$reset_color%} %b$(git_super_status) 
%{$fg[red]%}≫≫%{$reset_color%} '
  PROMPT2='%{${fg[red]}%}%_%%%{$reset_color%} '
  SPROMPT='%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} '
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
    PROMPT='%{${fg[white]}%}${HOST%%.*} ${PROMPT}'
  ;;
esac

# zsh search command
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

export GIT_PROMPT_EXECUTABLE="haskell"
source ~/.zsh/git-prompt/zshrc.sh

# direnv
export EDITOR=vim
eval "$( direnv hook zsh )"
