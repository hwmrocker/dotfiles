function activate3 --description "looking for virtual envs to activate"
    pushd . > /dev/null
    while test "$PWD" != "/"
        if test -f ./.env3/bin/activate
            . .env3/bin/activate.fish
            break
        else
            cd ..
        end
    end
    popd > /dev/null
end
