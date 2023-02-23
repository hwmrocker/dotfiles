function v --description "creates a python venv and activates it"
    if test (count $argv) -eq 0
        set python_exe python
    else
        set python_exe $argv[1]
    end

    $python_exe -m venv .venv
    activate
end
