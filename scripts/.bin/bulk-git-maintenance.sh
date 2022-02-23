find ~+ . -name '.git' -type d -prune 2> /dev/null | while read fname; do
    cd "$fname"
    cd ..
    git maintenance run
done
