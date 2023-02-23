function activate --description "looking for virtual envs to activate"
    # looking for virtual envs to activate in the following order:
    # 1. poetry
    # 2. pipenv
    # 3. .venv
    # if none of them are found, look for them in the parent directories


    set activator ""

    pushd . >/dev/null
    while test "$PWD" != /
        if test -f ./pyproject.toml
            if rg [tool.poetry] pyproject.toml >/dev/null
                echo "Activating poetry virtual env..."
                set poetry_path (poetry env info -p)
                set activator $poetry_path/bin/activate.fish
                break
            end
        end
        if test -f ./Pipfile
            echo "Activating pipenv virtual env..."
            set pipenv_path (pipenv --venv)
            set activator $pipenv_path/bin/activate.fish
            break
        end
        if test -f ./.venv/bin/activate.fish
            echo "Activating .venv ..."
            set activator .venv/bin/activate.fish
            break
        end
        cd ..
    end
    if test -n "$activator"
        echo "Activating $activator"
        source $activator
    end
    popd >/dev/null
end
