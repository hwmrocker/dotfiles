# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


if [ $(which lsd 2> /dev/null) ]; then
    alias ls='lsd'
    alias ll='lsd -l'
    alias la='lsd -a'

else
    # some more ls aliases
    alias ll='ls -alF'
    alias la='ls -A'
    alias l='ls -CF'
fi

if [ $(which bat 2> /dev/null) ]; then
    alias cat='bat'
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias p="python"
alias t="python setup.py test"
alias da="deactivate"
alias a="activate"
alias v="python -m venv .venv; activate"
alias md='mkdir -p';
alias rd='rmdir';
mcd () { mkdir "$@" && cd "$@"; }
