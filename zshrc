export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
# export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
# export PIP_REQUIRE_VIRTUALENV=true
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="miloshadzic"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
	git
	git-extras
	git-extra-commands
	npm
	pip
	redis-cli
	docker
	docker-compose
	dotenv
	# vagrant
	autojump
	fzf
	macos
	zsh-autosuggestions
	# must be the last one
	# zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="$HOME/soft/bin:$HOME/.npm-packages/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
export TERM="xterm-256color"


# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

. ~/.bash_aliases
export GOPATH=~/sources/golang
export PATH=$PATH:$GOPATH/bin

if [ -d "$HOME/soft/google-cloud-sdk" ]; then
	# The next line updates PATH for the Google Cloud SDK.
	source $HOME/soft/google-cloud-sdk/path.zsh.inc

	# The next line enables bash completion for gcloud.
	source $HOME/soft/google-cloud-sdk/completion.zsh.inc
fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

if [[ `uname` == 'Linux' ]]
then
	export LINUX=1
else
	export LINUX=
fi
if [[ `uname` == 'Darwin' ]]
then
	export OSX=1
else
	export OSX=
fi


# gettext bin
export PATH=${PATH}:/usr/local/opt/gettext/bin

# node
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion



fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

export GEM_HOME=/usr/local/Cellar/ruby/2.5.1
export PATH=$PATH:/usr/local/Cellar/ruby/2.5.1/bin

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"


function myip { curl ifconfig.me }
function pjson {
    if [ $# -gt 0 ];
        then
        for arg in $@
        do
            if [ -f $arg ];
                then
                less $arg | python -m json.tool
            else
                echo "$arg" | python -m json.tool
            fi
        done
    fi
}

# source "$(navi widget zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="/opt/homebrew/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/snoopt/soft/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/snoopt/soft/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/snoopt/soft/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/snoopt/soft/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

source /Users/snoopt/.config/broot/launcher/bash/br
export GPG_TTY=$(tty)
