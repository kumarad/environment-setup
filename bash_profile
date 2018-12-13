export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export "EDITOR=vi"

deleteGit() {
    git branch | grep "$1" | xargs git branch -D
}


parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1='[\w$(parse_git_branch)]\$ '

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

alias config-service='cd ~/convey/github/config-service'

alias test_es_tunnel_http='ssh -L 9200:test-elasticsearch-2.us-east-1.getconvey.com:9200 etl-1'

portChecker() {
	lsof -n -i:"$1" | grep LISTEN
}

tcpConnectionChecker() {
	lsof -i -a -p $1
}

sshAws() {
	ssh -i ~/.ssh/id_rsa_aws -oProxyCommand='ssh -W %h:%p pivotfreight@bastion' pivotfreight@"$1"
}


alias current-utc='python -c "from datetime import datetime; print(datetime.utcnow())"'

