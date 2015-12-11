set -gx PATH ~/bin/ $PATH

# TODO: nvm-fish

keychain --quiet --agents "ssh,gpg" --nogui --dir ~/.ssh/.keychain ~/.ssh/id_rsa ~/.ssh/id_ed25519
if test -f ~/.ssh/.keychain/"$HOSTNAME-sh"
    source ~/.ssh/.keychain/"$HOSTNAME-sh"
end
if test -f ~/.ssh/.keychain/"$HOSTNAME-sh-gpg"
    source ~/.ssh/.keychain/"$HOSTNAME-sh-gpg"
end
if test -f ~/.autojump/share/autojump/autojump.fish
    source ~/.autojump/share/autojump/autojump.fish
end
alias p "python3"
alias p2 "python2"
alias p3 "python3"
alias v "v3"
alias v "v3"
alias vs "v3s"
alias a "activate"
alias da "deactivate"
alias md "mkdir -p"
alias rd "rmdir"
alias vi "vim"

set -xU LESS_TERMCAP_mb (printf "\e[01;31m")      # begin blinking
set -xU LESS_TERMCAP_md (printf "\e[01;31m")      # begin bold
set -xU LESS_TERMCAP_me (printf "\e[0m")          # end mode
set -xU LESS_TERMCAP_se (printf "\e[0m")          # end standout-mode
set -xU LESS_TERMCAP_so (printf "\e[01;44;33m")   # begin standout-mode - info box
set -xU LESS_TERMCAP_ue (printf "\e[0m")          # end underline
set -xU LESS_TERMCAP_us (printf "\e[01;32m")      # begin underline
