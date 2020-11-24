# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/olhmr/.oh-my-zsh"
export PATH=$(brew --prefix openvpn)/sbin:$PATH
export PATH="$PATH:~/workspace/beetle/.stack-work/dist/x86_64-osx/Cabal-2.4.0.1/build/beetle"
export PATH="$HOME/anaconda3/bin:$PATH"
export PATH="$HOME/clojure/bin:$PATH"
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
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
plugins=(
  git
  autojump
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR="/usr/local/bin/atom -nw"
# else
#   export EDITOR="/usr/local/bin/atom -nw"
# fi

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  # export EDITOR='mvim'
  export EDITOR='nvim'
fi

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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/olhmr/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/olhmr/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/olhmr/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/olhmr/google-cloud-sdk/completion.zsh.inc'; fi

#--------------------#
#       Aliases      #
#--------------------#

# Editing and sourcing bash
alias edit-bash='vim ~/.zshrc'
alias source-bash='source ~/.zshrc'

# vi / vim / nvim
alias notes='nvim ~/workspace/ad-hoc/notes/'
alias edit-vimrc='nvim ~/.vimrc'
alias edit-vim-runtime='nvim ~/.vim_runtime/'

# Kubernetes
alias switch-blue='kubectl config use-context blue.kube.usw.co'
alias kldn='kubectl -n ldn'
function force-cron() {
u k8s force-cron -n ldn $1
}

# Git and github
alias gito='git-open'
alias glb='git branch -a | grep -v remote'
function grpop() {
  git remote prune origin
  git pull
}

# dbt
function dbtpp() {
    dbt --partial-parse $@
}

# BigQuery CLI
function bq_dry() {
  # Run dry run
  RESULT=$(bq query --dry_run $@)
  # Check if validation succeeded
  if [[ $RESULT == *"Query successfully validated"* ]]; then
    # Convert the number of bytes from dry run to gigabytes
    NUMBER=$(echo $RESULT | tr -dc '0-9')
    GB=$(echo "${NUMBER} / 1000000000" | bc)
    echo "Query successfully validated. Assuming the tables are not modified, running this query will process ${GB} gigabytes of data."
  else
    # Print the full message
    echo $RESULT
  fi
}

#--------------------#

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"


#--------------------#

# Require active virtualenv for pip
export PIP_REQUIRE_VIRTUALENV=true

# Function to override and install a package globally
global_pip() {
    PIP_REQUIRE_VIRTUALENV="" pip "$@"
}
