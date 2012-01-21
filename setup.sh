#!/bin/bash

# Create symbolic links into $HOME

for file in $(ls --format=single-column \
            | grep -vi "exclude" \
            | grep -vi "readme" \
            | grep -v "setup\.sh"); do
	ln -s $(pwd)/$file ~/.$file
done
