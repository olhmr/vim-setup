# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Inspiration here: https://opensource.com/article/20/8/iterm2-zsh

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

# Only check cache dump once a day: https://medium.com/@dannysmith/little-thing-2-speeding-up-zsh-f1860390f92
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

# Improve compinit time in startup
skip_global_compinit=1

# Set theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  # export EDITOR='mvim'
  export EDITOR='nvim'
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/olhmr/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/olhmr/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/olhmr/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/olhmr/google-cloud-sdk/completion.zsh.inc'; fi

#--------------------#
#       Aliases      #
#--------------------#

# Editing and sourcing bash
alias edit-bash='nvim ~/.zshrc'
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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
