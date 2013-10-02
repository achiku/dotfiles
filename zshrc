# gotta be vi
bindkey -v
export KEYTIMEOUT=1

# set lang
export LANG=ja_JP.UTF-8

# path
export PATH=/usr/local/bin:/Applications/phantomjs.app/Contents/MacOS:$PATH

# my aliases
alias ls='/bin/ls -FG'
alias ll='ls -ltr'
alias l='ls -ltr'
alias la='ls -ltra'

# ruby
[ -s ${HOME}/.rvm/scripts/rvm ] && source ${HOME}/.rvm/scripts/rvm
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# for node.js nvm
. $HOME/.nvm/nvm.sh

# export Android path
export ANDROID_HOME=/Applications/android-sdk

# for pythonz
[[ -s $HOME/.pythonz/etc/bashrc ]] && source $HOME/.pythonz/etc/bashrc

# for python virtualenv
v_env_wrapper=/usr/local/bin/virtualenvwrapper.sh
if [ -r $v_env_wrapper ]; then
    export WORKON_HOME=$HOME/.virtualenvs
    source $v_env_wrapper
fi
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
export VIRTUALENV_USE_DISTRIBUTE=true

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

# prompt must be cool
case ${UID} in
0)
  PROMPT="%B%{${fg[red]}%}%/#%{${reset_color}%}%b  "
  PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
  SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
    PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
  ;;
*)
  PROMPT="%{${fg[red]}%}(%m@%n:%~)%#${reset_color} "
  PROMPT2="%{${fg[red]}%}%_%%%{${reset_color}%} "
  SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
    PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
  ;;
esac

# zsh search command
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

# for screen
case "${TERM}" in
kterm*|xterm)
    precmd() {
      echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac

if [ "$TERM" = "screen" ]; then
    precmd(){
        screen -X title $(basename $(print -P "%~"))
    }
fi

# show git info
RPROMPT="%{${fg[blue]}%}[%~]%{${reset_color}%}"

autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'


