export JAVA_HOME=/opt/java/current-java
export GRADLE_HOME=/opt/gradle/current-gradle
export MAVEN_HOME=/opt/maven/current-maven
export RBENV_HOME=$HOME/.rbenv
export SCALA_HOME=/opt/scala/current-scala
export PATH=$PATH:$JAVA_HOME/bin:$GRADLE_HOME/bin:$RBENV_HOME/bin:$SCALA_HOME/bin:$MAVEN_HOME/bin:$HOME/.rvm/bin
SSH_ENV=$HOME/.ssh/environment

# start the ssh-agent
function start_agent {
    echo "Initializing new SSH agent..."
    # spawn ssh-agent
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add
}

if [ -f "${SSH_ENV}" ]; then
     . "${SSH_ENV}" > /dev/null
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

alias c='clear'
alias ll='ls --color=auto'
alias ll='ls -ls'
alias apt-get='sudo apt-get'
alias ..='cd ..'
alias mkdir='mkdir -p'
alias vi=vim
alias ping='ping -c 5'
alias ports='netstat -tulanp'
alias gss='git status'
alias gpl='git pull origin'
alias gplr='git pull --rebase origin'
alias gph='git push origin'

eval "$(rbenv init -)"

set -o vi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/local/IMPELLO/shilton/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

