function v3s --description "creates a virtualenv for python3 with site packages and activates it"
    virtualenv env --system-site-packages -p /usr/bin/python3
    activate
end
