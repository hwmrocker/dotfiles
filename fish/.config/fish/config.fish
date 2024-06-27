set -gx PATH ~/bin/ ~/.local/bin ~/.yarn/bin $PATH ~/go/bin
set -gx LANG en_US.UTF-8
set -gx EDITOR vim
set -gx VISUAL vim

# TODO: nvm-fish

if status --is-interactive
    keychain --quiet --agents "ssh,gpg" --nogui --dir ~/.ssh/.keychain ~/.ssh/id_rsa ~/.ssh/id_ed25519
    if test -f ~/.ssh/.keychain/(uname -n)-fish
        source ~/.ssh/.keychain/(uname -n)-fish
    end
    set gpgagent ~/.ssh/.keychain/(uname -n)-fish-gpg
    if test -f ~/.ssh/.keychain/(uname -n)-fish-gpg
        source ~/.ssh/.keychain/(uname -n)-fish-gpg
    end
    if test -d ~/.cargo/bin
        set -x PATH ~/.cargo/bin $PATH
    end
end

alias a activate
alias da deactivate
alias md "mkdir -p"
alias vi vim

if which lsd >/dev/null
    alias ls lsd
    alias ll "lsd -l"
    alias la "lsd -a"
    alias lla "lsd -la"
else if which exa >/dev/null
    alias ls exa
    alias ll "exa -l"
    alias la "exa -a"
    alias lla "exa -la"
else
    alias ll "ls -l"
    alias la "ls -a"
    alias lla "ls -la"
end

if which bat >/dev/null
    alias cat bat
end

set -xg LESS_TERMCAP_mb (printf "\e[01;31m") # begin blinking
set -xg LESS_TERMCAP_md (printf "\e[01;31m") # begin bold
set -xg LESS_TERMCAP_me (printf "\e[0m") # end mode
set -xg LESS_TERMCAP_se (printf "\e[0m") # end standout-mode
set -xg LESS_TERMCAP_so (printf "\e[01;44;33m") # begin standout-mode - info box
set -xg LESS_TERMCAP_ue (printf "\e[0m") # end underline
set -xg LESS_TERMCAP_us (printf "\e[01;32m") # begin underline

set -xg TERM xterm-256color
set -xg PIPENV_IGNORE_VIRTUALENVS 1

# set -x PATH "~/.pyenv/bin" $PATH
# status --is-interactive; and . (pyenv init -|psub)
# status --is-interactive; and . (pyenv virtualenv-init -|psub)

# The next line updates PATH for the Google Cloud SDK.
if [ -f ~/opt/google-cloud-sdk/path.fish.inc ]
    . ~/opt/google-cloud-sdk/path.fish.inc
end

if [ -f '/opt/asdf-vm/asdf.fish' ]
    source /opt/asdf-vm/asdf.fish
end

if [ -d ~/.cargo/bin ]
    set -x PATH ~/.cargo/bin $PATH
end

set -x RYE_HOME ~/.local/rye
if [ -d ~/.local/rye ]
    set -x PATH ~/.local/rye/shims $PATH
end

if [ -d /opt/nvim-linux64 ]
    set -x PATH $PATH /opt/nvim-linux64/bin
end

if which direnv >/dev/null
    direnv hook fish | source
    set -g direnv_fish_mode eval_on_arrow
end

if which starship >/dev/null
    starship init fish | source
end

if which zoxide >/dev/null
    zoxide init fish --cmd j | source
end

if [ "$XDG_SESSION_TYPE" = wayland ]
    set -xg MOZ_ENABLE_WAYLAND 1
end
