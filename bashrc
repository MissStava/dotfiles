export PATH=$PATH:~/gitlab/gitlab.com/travis-perkins/ccoe/docker/tooling/scripts

SSH_ENV=$HOME/.ssh/environment

export GOPATH=~/go

alias ll='ls --color=auto -lsa'
alias apt='sudo apt'
alias aptall='sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y'
alias mkdir='mkdir -p'
alias cd..='cd ..'
alias ..='cd ..'
alias vi='vim'
alias ping='ping -c 5'
alias ports='netstat -tulanp'
alias gcl='gcloud'
alias kc='kubectl'
alias tf='terraform'
alias cgs='clear; git status'

alias watch='watch '
alias vpn='sudo openvpn --config sharedvpn.ovpn'

K8S_BASIC_ASSETS="pods,services,ingresses,deployments,daemonsets,statefulsets,replicasets,horizontalpodautoscalers,poddisruptionbudgets"
K8S_CMD="kubectl get -o wide --sort-by='{.metadata.name}' componentstatuses ; echo ; kubectl get -o wide nodes ; echo ; kubectl get  --ignore-not-found ${K8S_BASIC_ASSETS}"
K8S_MORE_CMD="kubectl get -o wide --sort-by='{.metadata.name}' componentstatuses ; echo ; kubectl get -o wide nodes ; echo ; kubectl get --ignore-not-found ${K8S_BASIC_ASSETS},cronjobs,jobs,secrets,configmaps,networkpolicies,endpoints,replicationcontrollers,controllerrevisions,podsecuritypolicies,pods,persistentvolumeclaims,persistentvolumes,volumeattachments"

alias k8sshow="${K8S_CMD}"
alias k8sshowall="${K8S_CMD} --all-namespaces"
alias k8swatch="watch -n 1 '${K8S_CMD}'"
alias k8swatchall="watch -n 1 '${K8S_CMD} --all-namespaces -owide'"
alias k8sshowmore="${K8S_MORE_CMD}"
alias k8sshowmoreall="${K8S_MORE_CMD} --all-namespaces"
alias k8sshoweverything="${K8S_MORE_CMD} -o wide"
alias k8sshoweverythingall="${K8S_MORE_CMD} -o wide --all-namespaces"

alias aws_who_am_i='echo "ACCOUNT  : $(aws iam list-account-aliases | jq -r '.AccountAliases[]')" ; echo "USER ARN : $(aws sts get-caller-identity | jq -r '.Arn')"'
alias aws_clear_env_creds='for item in $(set | grep AWS | grep KEY | awk -F= '"'"'{print $1}'"'"'); do unset ${item}; done'
alias aws_creds='mv ~/Downloads/credentials ~/.aws/credentials'
alias kc_gcon='kubectl config get-contexts'

alias vlogin='vault login -method=userpass username=stephanie.hilton && unset VAULT_TOKEN'
alias vprod='export VAULT_ADDR=https://vault.iris.travisperkins.digital/'
alias vsandpit='export VAULT_ADDR=https://vault.sandpit.fkaj.com/'
alias vwhoami="vault token lookup -format=json | jq -j '.data.meta'"
alias vloginapp='export VAULT_TOKEN="$(vault write auth/approle/login role_id=7037d7f6-74c7-c133-2ed4-6d15fe858cf2 secret_id=87fe2b9d-2adc-ca2a-ad0e-0b979786e1ac -format=json | jq -r '.auth.client_token' )"'

alias iris01='aws eks update-kubeconfig --name iris01'
alias iris02='aws eks update-kubeconfig --name iris02'
alias gitlab-com-runners='aws eks update-kubeconfig --name gitlab-com-runners'
alias refraction='aws eks update-kubeconfig --name refraction'
alias digitaldev01='aws eks update-kubeconfig --name digitaldev01'
alias digitaltest01='aws eks update-kubeconfig --name digitaltest01'
alias digitalstage01='aws eks update-kubeconfig --name digitalstage01'
alias digitalprod01='aws eks update-kubeconfig --name digitalprod01'

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
#force_color_prompt=yes

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
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

complete -C /opt/hashicorp/vault vault

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/hilts/google-cloud-sdk/path.bash.inc' ]; then . '/home/hilts/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/hilts/google-cloud-sdk/completion.bash.inc' ]; then . '/home/hilts/google-cloud-sdk/completion.bash.inc'; fi
