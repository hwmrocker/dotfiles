alias pypo="ve pypo"
alias p="python"
alias t="python setup.py test"
alias da="deactivate"
alias a=". activate"
alias v2="virtualenv env; . activate"
alias v2s="virtualenv --system-site-packages env; . activate"
alias v3="virtualenv env -p python3; . activate"
alias v3s="virtualenv --system-site-packages env -p python3; . activate"
alias v="virtualenv env -p python3; . activate"
alias vs="virtualenv --system-site-packages env -p python3; . activate"
alias md='mkdir -p';
alias rd='rmdir';
mcd () { mkdir "$@" && cd "$@"; }