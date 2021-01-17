#!/bin/bash
set -e

for gitdir in $(find . -type d -name .git | grep -v "^./.git$" | sort --unique)
do
    commented=true
    while [ $commented = true ]
    do
        commented=false
        commentme=$(git check-ignore --verbose "$gitdir" | cut -d: -f1,2 || true)
        if [ -n "$commentme" ]
        then
            file=$(echo $commentme | cut -d: -f1)
            line=$(echo $commentme | cut -d: -f2)
            sed -i "$line s/^/###/" "$file"
            commented=true
        fi
    done

    echo rm -rf "$gitdir"
    rm -rf "$gitdir"
done
