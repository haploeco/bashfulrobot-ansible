function git-drop
    git checkout -- (git ls-files -m)
end
