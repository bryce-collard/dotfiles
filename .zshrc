export PS1="$ "

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:~/.rd/bin:$PATH"
export PATH="$PATH:/Users/bcollard/oci/rads/bin"

alias vim="~/vim/src/vim"

# git laziness
alias syncbranch="git pull && git submodule sync && git submodule update --init --recursive"
alias syncsubmodules="git submodule sync && git submodule update --init --recursive"
alias gpoh="git push origin HEAD"
gri() { git rebase -i HEAD~${1:-2} } # "gri N" == "git rebase -i HEAD~N"
alias gc-="git commit -m \"-\""

alias ter="terraform"

alias sshpi="ssh bcollard@192.168.1.233"
# VM password is LDAP password (Txxxxxxxxxxxxx1)
# https://confluence.oci.oraclecorp.com/pages/viewpage.action?spaceKey=~azhilyak&title=PNP+Dev+VMs
alias sshvm="ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no brcollar@100.96.189.195"

alias seeks="~/oci/seeks/venv/bin/seeks"

alias rb-analysis="java -jar /usr/local/bin/rb-analysis.jar"

alias ls="ls -G"

# run this from ~/oci/rads for go1.23 conatiner for building artifacts
# https://bitbucket.oci.oraclecorp.com/projects/PNP/repos/rads-containers/browse/build
# Use -buildvcs=false to disable VCS stamping. --> "export GOFLAGS=-buildvcs=false"
alias gocontainer="docker run -it --rm -v `pwd`:/root/rads -v ~/.ssh/id_ed25519:/root/.ssh/id_ed25519 -v /usr/local/go/pkg:/root/go/pkg --platform=linux/amd64 elpaso-docker-local.artifactory.oci.oraclecorp.com/golang_1_23:0.1.33"

# /Library/Frameworks/Python.framework/Versions/3.6/bin/python3
#alias python3="/usr/local/bin/python3.9"

# https://dyn.slack.com/archives/CJ2MW139C/p1661554076976329?thread_ts=1661533192.371779&cid=CJ2MW139C
docker() {
 if [[ `uname -m` == "arm64" ]] && [[ "$1" == "run" || "$1" == "build" ]]; then
     ~/.rd/bin/docker "$1" --platform linux/amd64 "${@:2}"
  else
     ~/.rd/bin/docker "$@"
  fi
}

# renew oc2/oc3 access
renew () {
	echo "Log in to oc2"
	ssh bastion-ad1.us-gov-chicago-1.oraclegoviaas.com 'exit'
	echo "Log in to oc3"
	ssh bastion-ad1.us-langley-1.oraclegoviaas.com 'exit'
	echo "Log in to oc23"
	ssh bastion-ad1.rb.us-thames-1.oci.oraclerealm23.com 'exit'
}

findnotes() {
	case "$1" in
		-i) grep -ri --color "$2" ~/Documents/daily ~/Documents/notes/my_work ~/Documents/notes/oncall ;;
		*) grep -r --color "$1" ~/Documents/daily ~/Documents/notes/my_work ~/Documents/notes/oncall ;;
	esac
}

export RADSDIR=/Users/bcollard/oci/elpaso/go/src/oracle/el-paso/rads
export GOBGPDIR=/Users/bcollard/oci/elpaso/go/src/oracle/el-paso/gobgp

# the java version used for mfo cli
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/bcollard/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# https://towardsdatascience.com/how-to-use-manage-multiple-python-versions-on-an-apple-silicon-m1-mac-d69ee6ed0250
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi
if [ $(arch) = "i386" ]; then
    alias brew86="/usr/local/bin/brew"
    alias pyenv86="arch -x86_64 pyenv"
fi

# https://bitbucket.oci.oraclecorp.com/projects/NETAUTO/repos/networktools/browse/ncp/cookbook/installation.md
# eval "$(pyenv init -)"
# eval "$(pyenv init --path)"
# eval "$(pyenv virtualenv-init -)"
