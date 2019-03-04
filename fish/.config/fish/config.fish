set -gx PATH ~/bin/ ~/.local/bin ~/.poetry/bin $PATH ~/go/bin
set -gx LANG en_US.UTF-8
set -gx EDITOR vim
set -gx VISUAL vim

# TODO: nvm-fish

if status --is-interactive
  # keychain --eval --quiet -Q id_rsa
  keychain --eval --quiet --agents "ssh,gpg" --nogui --dir ~/.ssh/.keychain ~/.ssh/id_rsa ~/.ssh/id_ed25519
  if test -f ~/.ssh/.keychain/(uname -n)-fish
      echo "source ssh"
      source ~/.ssh/.keychain/(uname -n)-fish
  end
  set gpgagent "~/.ssh/.keychain/"(uname -n)"-fish-gpg"
  if test -f ~/.ssh/.keychain/(uname -n)-fish-gpg
      echo "source gpg"
      source ~/.ssh/.keychain/(uname -n)-fish-gpg
  end
  if test -f /usr/share/fish/completions/autojump.fish
      source /usr/share/fish/completions/autojump.fish
  end
end

alias p "python"
alias p2 "python2"
alias p3 "python3"
alias v "v3"
alias a "activate"
alias a2 "activate2"
alias a3 "activate3"
alias da "deactivate"
alias md "mkdir -p"
alias rd "rmdir"
alias vi "vim"

set -xg LESS_TERMCAP_mb (printf "\e[01;31m")      # begin blinking
set -xg LESS_TERMCAP_md (printf "\e[01;31m")      # begin bold
set -xg LESS_TERMCAP_me (printf "\e[0m")          # end mode
set -xg LESS_TERMCAP_se (printf "\e[0m")          # end standout-mode
set -xg LESS_TERMCAP_so (printf "\e[01;44;33m")   # begin standout-mode - info box
set -xg LESS_TERMCAP_ue (printf "\e[0m")          # end underline
set -xg LESS_TERMCAP_us (printf "\e[01;32m")      # begin underline

set -xg TERM xterm-256color

set -x PATH "/home/olaf/.pyenv/bin" $PATH
status --is-interactive; and . (pyenv init -|psub)
status --is-interactive; and . (pyenv virtualenv-init -|psub)
