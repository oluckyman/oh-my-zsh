# Shell Aliases
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
alias du="du -h"
alias du1="du -d 1"
alias grep="grep --color=auto"

# qfind - used to quickly find files that contain a string in a directory
qfind () {
    find . -exec grep -l $1 {} \;
    return 0
}

