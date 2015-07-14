set -g PATH ~/bin/ $PATH

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
