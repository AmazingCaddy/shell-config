# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/wenbin/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git brew)

source $ZSH/oh-my-zsh.sh

# source "$(navi widget zsh)"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export LC_ALL=en_US.UTF-8

# export environments
export PATH="/usr/local/sbin:$PATH"

# add path for pipx
export PATH="$PATH:/Users/wenbin/.local/bin"

# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

export MACOSX_DEPLOYMENT_TARGET=10.15

# environment for mla
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export HANLP_STATIC_ROOT=/Users/wenbin/Repos/mla/data/hanlp-1.7.3-release
export HANLP_JAR_PATH=/Users/wenbin/Repos/mla/data/hanlp-1.7.3-release/hanlp-1.7.3.jar
export LTP_CWS_MODEL_PATH=/Users/wenbin/Repos/mla/data/ltp-cws.model

# alias
alias ll="ls -sailh"
alias showall="defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder"
alias hideall="defaults write com.apple.finder AppleShowAllFiles FALSE; killall Finder"

# pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

function _init_pyvenv {
  (
    proj_name=$(basename $(pwd))
    echo "setting up ${proj_name}..."
    pyenv virtualenv 3.6.8 $proj_name
    pyenv local $proj_name

    pip install -r ./requirements_dev.txt
    pip install -r ./requirements_prod_server.txt
    pip install -e $(pwd) --no-binary :all:
  )
}

alias init-pyvenv=_init_pyvenv

function _setup_mnvai_pip {
  export PIP_INDEX_URL=http://192.168.1.74:9999/simple
  export PIP_TRUSTED_HOST=192.168.1.74
}
alias setup-mnvai-pip=_setup_mnvai_pip
