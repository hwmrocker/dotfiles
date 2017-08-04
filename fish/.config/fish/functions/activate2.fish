function activate2 --description "looking for virtual envs to activate"
    pushd . > /dev/null
    while test "$PWD" != "/"
        if test -f ./.env2/bin/activate
            . .env2/bin/activate.fish
            break
        else
            cd ..
        end
    end
    popd > /dev/null
end
