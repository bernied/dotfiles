
#export PATH=/usr/local/bin:/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

export PATH=$PATH:~/bin:/usr/local/bin
#export TNS_ADMIN=/usr/ora_instant_client/instantclient10_1

alias ls="ls -GF"
alias vip="vi -u ~/.vimrc_secure"

function parse_git_dirty { if [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]]; then 
 echo "*" 
 elif (( $(git status 2> /dev/null | grep 'Your branch is ahead of' | wc -l) != 0 )); then
 echo "+"
 fi
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}
#export PS1='\u@\h \[\033[1;33m\]\w\[\033[0m\]$(parse_git_branch)$ '
export PS1='\[\033[1;33m\]\w\[\033[0m\]'
export PS1="$PS1\$(git-radar --bash --fetch) $ "

# Change your JAVA_HOME
function setjdk() {
     if [ $# -ne 0 ];
         then export JAVA_HOME=`/usr/libexec/java_home -v $@`;
     fi;
}
 
# set the JAVA_HOME
export JAVA_HOME=$(/usr/libexec/java_home)
#export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home

#source ~/.m2/maven2

