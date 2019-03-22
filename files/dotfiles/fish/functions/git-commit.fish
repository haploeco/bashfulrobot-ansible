function git-commit

    if count $argv > /dev/null
        git add $argv
    else
        git add -i
    end

    git commit -a
    git status

end
