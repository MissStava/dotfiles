export JAVA_HOME=/opt/java/current-java
export GRADLE_HOME=/opt/gradle/current-gradle
export MAVEN_HOME=/opt/maven/current-maven
export PATH=$PATH:$JAVA_HOME/bin:$GRADLE_HOME/bin:$MAVEN_HOME/bin

SSH_ENV=$HOME/.ssh/environment

alias ll='ls --color=auto'
alias apt-get='sudo apt-get'
alias ..='cd ..'
alias mkdir='mkdir -p'
alias vi=vim
alias ping='ping -c 5'
alias ports='netstat -tulanp'

set -o vi

