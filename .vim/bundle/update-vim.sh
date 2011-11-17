#!/bin/sh

for d in ~/.vim/bundle/*; do
    if [ -d "$d/.git" ]; then
        (echo -ne "$d\t"; cd $d; git pull)
    elif [ -d "$d/.hg" ]; then
        (echo -ne "$d\t"; cd $d; hg pull --update)
    elif [ -d "$d/_darcs" ]; then
        (echo -ne "$d\t"; cd $d; darcs pull -a)
    elif [ -d "$d/.bzr" ]; then
        (echo -ne "$d\t"; cd $d; bzr pull)
    elif [ -d "$d/.svn" ]; then
        (echo -ne "$d\t"; cd $d; svn update)
    fi
done
