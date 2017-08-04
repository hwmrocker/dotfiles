function activate --description "looking for virtual envs to activate"
    pushd . > /dev/null
    while test "$PWD" != "/"
        if test -f ./.env3/bin/activate
            . .env3/bin/activate.fish
            popd > /dev/null
            return
        else
            if test -f ./.env2/bin/activate
            . .env2/bin/activate.fish
                popd > /dev/null
                return
            else
                cd ..
            end
        end
    end
end
