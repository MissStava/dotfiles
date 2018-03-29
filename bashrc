export JAVA_HOME=/opt/java/current-java
export GRADLE_HOME=/opt/gradle/current-gradle
export MAVEN_HOME=/opt/apache/current-maven
export RBENV_HOME=~/.rbenv
export PATH=$PATH:$JAVA_HOME/bin:$GRADLE_HOME/bin:$MAVEN_HOME/bin:$RBENV_HOME/bin:~/.local/bin

SSH_ENV=$HOME/.ssh/environment

alias ll='ls --color=auto -lsa'
alias apt='sudo apt'
alias apt-get='sudo apt-get'
alias ..='cd ..'
alias mkdir='mkdir -p'
alias vi=vim
alias ping='ping -c 5'
alias ports='netstat -tulanp'
alias kc='kubectl'

set -o vi

eval "$(rbenv init -)"

source <(kubectl completion bash)
