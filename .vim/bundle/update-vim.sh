#!/bin/sh

for d in ~/.vim/bundle/*; do
    if [ -d "$d/.git" ]; then
        (echo -ne "$d\t"; cd $d; git pull)
    elif [ -d "$d/.svn" ]; then
        (echo -ne "$d\t"; cd $d; svn update)
    fi
done
