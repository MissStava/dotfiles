export JAVA_HOME=/opt/java/current-java
export GRADLE_HOME=/opt/gradle/current-gradle
export MAVEN_HOME=/opt/maven/current-maven
export SCALA_HOME=/opt/scala/current-scala
export RBENV_HOME=$HOME/.rbenv
export PATH=$PATH:$JAVA_HOME/bin:$GRADLE_HOME/bin:$RBENV_HOME/bin:$SCALA_HOME/bin:$MAVEN_HOME/bin:$HOME/.rvm/bin
SSH_ENV=$HOME/.ssh/environment

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

