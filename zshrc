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
alias venv='source ./venv/bin/activate'

# for custom aliases 
if [[ -f ~/.myalias ]]; then
    source ~/.myalias
fi

# For GCP
export CLOUDSDK_COMPUTE_ZONE=asia-east1-c
export CLOUDSDK_COMPUTE_REGION=asia-east1

# path for homebrew
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
# export HOMEBREW_VERBOSE=true

# for completion
fpath=(/usr/local/share/zsh-completions $fpath)

# for ruby
export PATH=$HOME/.rbenv/shims:$PATH
eval "$(rbenv init -)"

# for node.js nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# for golang
# export GOVERSION=1.14.4
# export GOROOT=$HOME/sdk/go$GOVERSION
# export PATH=$HOME/sdk/go$GOVERSION/bin:$PATH
export GOPATH=$HOME/sdk/go1.19
export PATH=$GOPATH/bin:$PATH


# for Java
# export JAVA_HOME=$( /usr/libexec/java_home -v 1.8 )

# for pip
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

# for PostgreSQL
export PATH=/usr/local/Cellar/postgresql@12/12.10_1/bin:$PATH
export PGDATA=/usr/local/var/postgres

# for custom tools
export PATH=$HOME/bin:$PATH

# neovim
alias vim=nvim

# zsh completion
autoload -Uz compinit && compinit

# zsh history
HISTFILE=~/.zsh_history
LISTMAX=100000
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups
setopt share_history

setopt auto_pushd
setopt list_packed
setopt nolistbeep
autoload colors
colors
autoload zed


# zsh search command
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

source ~/.zsh.d/git-prompt.zsh/git-prompt.zsh
source ~/.zsh.d/git-prompt.zsh/achiku.zsh

# z.sh
# source ~/.zsh.d/z/z.sh
# export _Z_DATA=~/.zsh.d/z-history

function peco-z-search
{
  which peco z > /dev/null
  if [ $? -ne 0 ]; then
    echo "Please install peco and z"
    return 1
  fi
  local res=$(z | sort -rn | cut -c 12- | peco)
  if [ -n "$res" ]; then
    BUFFER+="cd $res"
    zle accept-line
  else
    return 1
  fi
}
zle -N peco-z-search
bindkey '^f' peco-z-search
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/chiku/.local/share/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/chiku/.local/share/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/chiku/.local/share/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/chiku/.local/share/google-cloud-sdk/completion.zsh.inc'; fi
