# ~/.bash_aliases: separated custom aliases & functions

## ------------------ ##
## Aliases            ##
## ------------------ ##

# jump to windows home directory
alias go-home='cd /mnt/c/Users/david'

alias goto-projects='cd ~/sandbox/projects'
alias list-services='systemctl list-units -at service'

alias reload='source ~/.profile'

# neat alais to open current dir in windows explorer
alias explorer='explorer.exe $(wslpath -w $(pwd))'

# k8s
alias kc=kubectl
#alias kustomize='kubectl kustomize'

## ------------------ ##
## Functions          ##
## ------------------ ##

# cht.sh
cht() {
    curl "cheat.sh/$*"
}

# uv venv helper
venv() {
    if [ -d ".venv" ]; then
        source .venv/bin/activate
    else
        uv venv .venv
    fi
    source .venv/bin/activate
}
