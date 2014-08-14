parse_git_branch() {
    branches=`git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'`
    if [ "$branches" ];
    then
        echo "$branches "
    fi
}

export PS1="\[\033[00m\]\u\[\033[01;34m\] \w \[\033[31m\]\$(parse_git_branch)\[\033[0m\]$ "

