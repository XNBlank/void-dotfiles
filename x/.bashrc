# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#                                   Settings

# TERMCAP Setup
# enter blinking mode - red
export LESS_TERMCAP_mb=$(printf '\e[01;31m')
# enter double-bright mode - bold, magenta
export LESS_TERMCAP_md=$(printf '\e[01;35m')
# turn off all appearance modes (mb, md, so, us)
export LESS_TERMCAP_me=$(printf '\e[0m')
# leave standout mode
export LESS_TERMCAP_se=$(printf '\e[0m')
# enter standout mode - green
export LESS_TERMCAP_so=$(printf '\e[01;32m')
# leave underline mode
export LESS_TERMCAP_ue=$(printf '\e[0m')
# enter underline mode - blue
export LESS_TERMCAP_us=$(printf '\e[04;34m')

# PS1 Setup
PROMPT_COMMAND=__prompt_command

__prompt_command() {
    local EXITCODE="$?"

    local HOSTCOLOR="5"
    local PATHCOLOR="4"

    local BOLD=$(tput bold)
    local NORM=$(tput sgr0)

    PS1="${BOLD}\[\e[3${HOSTCOLOR}m\] \u\[\e[3${HOSTCOLOR}m\]  \[\e[3${PATHCOLOR}m\] \w  ";

    if [ $EXITCODE == 0 ]; then
        PS1+="\[\e[32m\]\$ \[\e[0m\]";
    else
        PS1+="\[\e[31m\]\$ \[\e[0m\]";
    fi
}

#                                    Binds

# Fancy commands output
alias unmask="sudo dispatch-conf"

alias eq="sudo emerge --search"
alias ea="sudo emerge --ask"
alias eu="sudo emerge --unmerge"

#                                   Functions

# Extract archive
function extract {
    if [ -z "$1" ]; then
        echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    else
        if [ -f $1 ] ; then
            case $1 in
                *.tar.bz2)   tar xvjf ./$1    ;;
                *.tar.gz)    tar xvzf ./$1    ;;
                *.tar.xz)    tar xvJf ./$1    ;;
                *.lzma)      unlzma ./$1      ;;
                *.bz2)       bunzip2 ./$1     ;;
                *.rar)       unrar x -ad ./$1 ;;
                *.gz)        gunzip ./$1      ;;
                *.tar)       tar xvf ./$1     ;;
                *.tbz2)      tar xvjf ./$1    ;;
                *.tgz)       tar xvzf ./$1    ;;
                *.zip)       unzip ./$1       ;;
                *.Z)         uncompress ./$1  ;;
                *.7z)        7z x ./$1        ;;
                *.xz)        unxz ./$1        ;;
                *.exe)       cabextract ./$1  ;;
                *)           echo "extract: '$1' - unknown archive method" ;;
            esac
        else
            echo "$1 - file does not exist"
        fi
    fi
}

