function read_confirm
    while true
        read -l -P 'Do you want to continue? [y/N] ' confirm

        switch $confirm
            case Y y
                return 0
            case '' N n
                return 1
        end
    end
end

function clean-img
    echo "Are you in the directory with your JPG images?"
    if read_confirm
        exiftool -all= *.jpg
    end
end