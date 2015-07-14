function activate --description "looking for virtual envs to activate"
    pushd . > /dev/null
    while test "$PWD" != "/"
        if test -f ./env/bin/activate
            . env/bin/activate.fish
            break
        else
            cd ..
        end
    end
    popd > /dev/null
end
