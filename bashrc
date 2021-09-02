export PATH=$PATH:~/git/gitlab.com/travis-perkins/ccoe/docker/platform/scripts
export PATH=$PATH:~/Scripts

SSH_ENV=$HOME/.ssh/environment

export GOPATH=~/go

##########################################################################################################

alias ll='ls --color=auto -lsa'
alias apt='sudo apt'
alias aptall='sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y'
alias mkdir='mkdir -p'
alias ..='cd ..'
alias vi='vim'
alias ping='ping -c 5'
alias ports='netstat -tulanp'
alias t='terraform'
alias cgs='clear; git status'
alias c='clear'
alias gco='git commit -am "Snapshot"'
alias fix_ethernet='sudo ~/Documents/r8125-9.004.01/autorun.sh'

alias watch='watch '
alias vpn='cd ~/vpn; sudo openvpn --config sharedvpn.ovpn'
alias git_ssh='git config --global url."git@gitlab.com:".insteadOf https://gitlab.com/'
alias rnm='sudo service network-manager restart'

alias git_refresh='git.reset.all.sh ; git.prune.tag.all.sh ; git.prune.branch.all.sh ; git.fetch.all.sh ; git.pull.all.sh ; git.push.all.sh ; git.clean.logs.all.sh'
alias git_master_refresh='cd ~/git/gitlab.com/git_scripts/; ./git.checkout.main.branch.sh; ./git.reset.all.sh ; ./git.prune.tag.all.sh ; ./git.prune.branch.all.sh ; ./git.fetch.all.sh ; ./git.pull.all.sh ; ./git.push.all.sh ; ./git.clean.logs.all.sh'

##########################################################################################################

K8S_BASIC_ASSETS="pods,services,ingresses,deployments,daemonsets,statefulsets,replicasets,horizontalpodautoscalers,poddisruptionbudgets"
K8S_CMD="kubectl get -o wide --sort-by='{.metadata.name}' componentstatuses ; echo ; kubectl get -o wide nodes ; echo ; kubectl get  --ignore-not-found ${K8S_BASIC_ASSETS}"
K8S_MORE_CMD="kubectl get -o wide --sort-by='{.metadata.name}' componentstatuses ; echo ; kubectl get -o wide nodes ; echo ; kubectl get --ignore-not-found ${K8S_BASIC_ASSETS},cronjobs,jobs,secrets,configmaps,networkpolicies,endpoints,replicationcontrollers,controllerrevisions,podsecuritypolicies,pods,persistentvolumeclaims,persistentvolumes,volumeattachments"

alias kshow="${K8S_CMD}"
alias kshowall="${K8S_CMD} --all-namespaces"
alias kwatch="watch -n 1 '${K8S_CMD}'"
alias kwatchall="watch -n 1 '${K8S_CMD} --all-namespaces -owide'"
alias kevents='kubectl get events --all-namespaces=true --show-kind=true --watch=true'
alias kshowmore="${K8S_MORE_CMD}"
alias kshowmoreall="${K8S_MORE_CMD} --all-namespaces"
alias kshoweverything="${K8S_MORE_CMD} -o wide"
alias kshoweverythingall="${K8S_MORE_CMD} -o wide --all-namespaces"
alias kwatcheverything="watch -n 1 '${K8S_MORE_CMD}'"
alias kwatcheverythingall="watch -n 1 '${K8S_MORE_CMD} --all-namespaces -owide'"

alias k='kubectl'
alias kwhoami='kubectl config current-context'

##########################################################################################################

alias vlogin='vault login -method=userpass username=stephanie.hilton && unset VAULT_TOKEN'
alias vprod='export VAULT_ADDR=https://vault.iris.travisperkins.digital/'
alias vsandpit='export VAULT_ADDR=https://vault.sandpit01.travisperkins.digital/'
alias vwhoami="vault token lookup -format=json | jq -j '.data.meta'"

##########################################################################################################

alias awswhoami='echo "ACCOUNT  : $(aws iam list-account-aliases | jq -r '.AccountAliases[]')" ; echo "USER ARN : $(aws sts get-caller-identity | jq -r '.Arn')"'
alias awsclearenvcreds='for item in $(set | grep AWS | grep KEY | awk -F= '"'"'{print $1}'"'"'); do unset ${item}; done'
alias awscreds='mv ~/Downloads/credentials ~/.aws/credentials'
alias creds='mv ~/Downloads/credentials ~/.aws/credentials'
alias awsew1='export AWS_REGION=eu-west-1'
alias awsew2='export AWS_REGION=eu-west-2'

alias iris01='creds; clear; aws eks update-kubeconfig --name iris01'
alias iris02='creds; clear; aws eks update-kubeconfig --name iris02'
alias runners01='creds; clear; aws eks update-kubeconfig --name runners01'
alias runners02='creds; clear; aws eks update-kubeconfig --name runners02'
alias sandpit01='creds; clear; aws eks update-kubeconfig --name sandpit01'
alias sandpit02='creds; clear; aws eks update-kubeconfig --name sandpit02'
alias sandpit03='creds; clear; aws eks update-kubeconfig --name sandpit03'
alias digitaldev01='creds; clear; aws eks update-kubeconfig --name digitaldev01'
alias digitaldev02='creds; clear; aws eks update-kubeconfig --name digitaldev02'
alias digitaldev03='creds; clear; aws eks update-kubeconfig --name digitaldev03'
alias digitaldev04='creds; clear; aws eks update-kubeconfig --name digitaldev04'
alias digitaldev05='creds; clear; aws eks update-kubeconfig --name digitaldev05'
alias digitaldev06='creds; clear; aws eks update-kubeconfig --name digitaldev06'
alias digitaltest01='creds; clear; aws eks update-kubeconfig --name digitaltest01'
alias digitalstage01='creds; clear; aws eks update-kubeconfig --name digitalstage01'
alias digitalprod01='creds; clear; aws eks update-kubeconfig --name digitalprod01'
alias mantle01='creds; clear; aws eks update-kubeconfig --name mantle01'
alias mantle02='creds; clear; aws eks update-kubeconfig --name mantle02'
alias canary01='creds; clear; aws eks update-kubeconfig --name canary01'

##########################################################################################################

set -o vi

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

complete -C /opt/hashicorp/vault vault
complete -C '/usr/local/bin/aws_completer' aws
source /usr/share/bash-completion/completions/git
