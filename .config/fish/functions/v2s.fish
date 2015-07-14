function v2s --description "creates a virtualenv for python2 with system packages and activates it"
    virtualenv env --system-site-packages -p python2
    activate
end
