# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTTIMEFORMAT="%d/%m/%y %T "
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
# [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


#
#  Better prompt
#

# git_current_info=""
# function set_prompt() {
#     git_current_info=$(parse_git_branch)
#     [ -n "$git_current_info" ] && git_current_info="$git_current_info "
# }
# PROMPT_COMMAND=set_prompt

# _prompt_username () { if [ $UID -eq 0 ] ; then echo '\[\e[01;31m\]\u' ; else echo '\[\e[01;32m\]\u' ; fi }
# _prompt_hostname () { if [ "`who am i | sed 's/.*(\(.*\))/\1/g'`" != ':0' ] ; then echo '\[\e[01;30m\]@\H' ; fi }

# _prompt_virtualenv () {
#     [ -n "$VIRTUAL_ENV" ] && printf '\e[01;31m'$(basename $VIRTUAL_ENV)'\e[00m '
# }

# PS1="\e]0;\w\007\[\e[01;30m\]\A $(_prompt_username)$(_prompt_hostname)  \${git_current_info} \$(_prompt_virtualenv)\[\e[01;34m\]\w\n\[\e[01;31m\]\$\[\e[00m\] "
# PS2='\[\e[01;31m\]>\[\e[00m\] '
# unset _prompt_hostname _prompt_username

eval "$(starship init bash)"
eval "$(zoxide init bash --cmd j)"

#
# source
#


if [ -f ~/.nvm/nvm.sh ]; then
    source ~/.nvm/nvm.sh
fi
[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion
# source ~/.virtualenv/tools.sh

export PYENV_ROOT="${HOME}/.pyenv"

if [ -d "${PYENV_ROOT}" ]; then
  export PATH="${PYENV_ROOT}/bin:${PATH}"
  eval "$(pyenv init -)"
fi

#
# home bin
#

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

keychain --quiet --agents "ssh,gpg" --nogui --dir ~/.ssh/.keychain ~/.ssh/id_rsa ~/.ssh/id_ed25519
if [ -f ~/.ssh/.keychain/"$HOSTNAME-sh" ]; then
    source ~/.ssh/.keychain/"$HOSTNAME-sh"
fi
if [ -f ~/.ssh/.keychain/"$HOSTNAME-sh-gpg" ]; then
    source ~/.ssh/.keychain/"$HOSTNAME-sh-gpg"
fi

if [ -f ~/.local_bashrc ]; then
    source ~/.local_bashrc
fi
PATH=$PATH:/home/olaf/.linjark/bin:/home/olaf/.cargo/bin
export PATH

if [ -f /opt/asdf-vm/asdf.sh ]; then
    . /opt/asdf-vm/asdf.sh
fi

# ssh
function zz {
  local host="$(cat ~/.ssh/config | grep "Host " | awk '{print $2}' | sort -u | fzf -q "$1" -1 --color fg:-1,bg:-1,hl:230,fg+:3,bg+:233,hl+:229,info:150,prompt:110,spinner:150,pointer:167,marker:174)"
  if [ -n "${host}" ]; then
    echo "ssh '${host}'"
    ssh "${host}"
  fi
}
