export JAVA_HOME=/opt/java/current-java
export GRADLE_HOME=/opt/gradle/current-gradle
export MAVEN_HOME=/opt/maven/current-maven
export TERRAFORM_HOME=/opt/terraform
export CONSUL_HOME=/opt/consul
export RBENV_HOME=/home/stu/.rbenv
export PATH=$PATH:$JAVA_HOME/bin:$GRADLE_HOME/bin:$MAVEN_HOME/bin:$TERRAFORM_HOME/terraform:$CONSUL_HOME/consul:$RBENV_HOME/bin

SSH_ENV=$HOME/.ssh/environment

alias ll='ls --color=auto -lsa'
alias apt='sudo apt'
alias apt-get='sudo apt-get'
alias ..='cd ..'
alias mkdir='mkdir -p'
alias vi=vim
alias ping='ping -c 5'
alias ports='netstat -tulanp'

set -o vi

eval "$(rbenv init -)"

