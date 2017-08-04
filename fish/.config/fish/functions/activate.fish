function activate --description "looking for virtual envs to activate"
    pushd . > /dev/null
    while test "$PWD" != "/"
        if test -f ./.env3/bin/activate
            . .env3/bin/activate.fish
            break
        else
            if test -f ./.env2/bin/activate
                . .env2/bin/activate.fish
                break
            else
                cd ..
            end
        end
    end
    popd > /dev/null
end
