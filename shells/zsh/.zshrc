# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

## Debug!
[[ -n "$DEBUG" && "$DEBUG" == "1" ]] && echo "(Debug) ${0} PATH = $PATH \n"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

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
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git
zsh-syntax-highlighting
zsh-autosuggestions
zsh-interactive-cd
zsh-navigation-tools
fzf
)

source $ZSH/oh-my-zsh.sh

# User configuration

export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='subl -w'
fi

# kaleyra github PAT
export GH_TOKEN='ghp_YCshitialmostcommitedasecret'

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#

# -------
# aliases
# -------
alias sublime=subl

# -------------------
# Edit various files
# -------------------
alias edit-zshconfig="sublime ~/.zshrc"
alias edit-ohmyzsh="sublime ~/.oh-my-zsh"
alias edit-p10k="sublime ~/.p10k.zsh"
alias edit-sshconfig="sublime ~/.ssh/config"
alias edit-claude="sublime '~/Library/Application Support/Claude/claude_desktop_config.json'"
alias edit-opencode="sublime ~/.config/opencode/opencode.jsonc"

# reload oh-my-zsh
alias reload='omz reload'

# python
alias python=python3
alias pip=pip3
alias notebook='uv run --with jupyter jupyter notebook'
alias uvp="uv pip"
alias uvn="echo -e 'Run: \n uv run ipython kernel install --user --name=notebook-name --display-name \"Name of notebook\" \n jupyter notebook'"

# kube
alias kc=kubectl

# kube
export KUBECONFIG="$HOME/.kube/config:$HOME/.kube/config-oracle:$HOME/.kube/config-proxmox"
alias kubectl=kubecolor
alias kc=kubectl

# tailscale
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"

# claude
alias claude="$HOME/.claude/local/claude"


# generate password from /dev/random
alias getpass='head -c 16 /dev/random | base64 | tr -dc "[:alnum:]" | tee >(pbcopy)'

# restart dns
alias restartdns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'

# toggle short/normal alias for very long paths
export ORIGINAL_PS1="$PS1"
alias sp='PS1="\[\e[0;32m\]\W \$\[\e[0m\] "'
alias op='PS1="$ORIGINAL_PS1"'


# allow app through mac quarantine
alias allowapp='sudo xattr -cr' 

# steamguard approval 
alias approve-steam='steamguard confirm && steamguard approve'

# ---------
# functions
# ---------

cht() {
  curl cht.sh/"$@"
}

venv_activate() {
  local venv_path
  if [ -f .venv/bin/activate ]; then
    venv_path='.venv/bin/activate'
  elif [ -f venv/bin/activate ]; then
    venv_path='venv/bin/activate'
  else
    echo "Error: no 'venv' or '.venv' dir found, exiting"
    return 1
  fi 
  echo "sourcing     $venv_path"
  source "$venv_path"
}

# save temp secrets to file
getpass() {
  local FNAME="$HOME/sometempfile.txt"
  if [ -z "$1" ]; then
    echo -e "Error: Empty parameter unsupported \nUsage: \"$0 <website/description of temporary password>\""
    return 1
  fi
  local INFO="$1"
  local SECRET=$(head -c 16 /dev/random | base64 | tr -dc "[:alnum:]" | tee >(pbcopy))
  # markdown table format
  local ROW=$(printf '| %s | %s |' "$INFO" "$SECRET")
  echo "$ROW" | tee -a "$FNAME"
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# hack to pull windows docker images
#export DOCKER_DEFAULT_PLATFORM=linux/amd64

. "$HOME/.local/bin/env"
export PATH="/opt/homebrew/opt/gnu-getopt/bin:$PATH"
export PATH="/Users/davidshepard/Library/Python/3.9/bin$PATH"

export PATH="/opt/homebrew/opt/node@22/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/node@22/lib"
export CPPFLAGS="-I/opt/homebrew/opt/node@22/include"

export NODE_TLS_REJECT_UNAUTHORIZED=0

# tone down zsh autocorrecter
unsetopt correct_all
setopt correct

# kubecolor (kubectl completions are in kubectl plugin above)
compdef kubecolor=kubectl

# ------------------
# shell completions
# ------------------
source <(helm_ls completion zsh)
source <(flux completion zsh)
source <(gitops completion zsh)
source <(codex completion zsh)
source "$HOME/.cargo/env"
source <(helm_ls completion zsh)
