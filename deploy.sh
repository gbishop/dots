#!/usr/bin/bash

# copy the files out to where they belong
rsync -rlt --files-from=managed.txt . $HOME
# mark them readonly to warn me not to edit them.
# Happily rsync ignores this and copies over them just fine!
cat managed.txt | tr '\n' '\0' | (cd $HOME; find -files0-from - -type f -exec chmod ug-w -- {} +)
