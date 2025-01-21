#!/usr/bin/bash

cwd=$(cd "${0%/*}"; pwd)
# copy the files out to where they belong
rsync -rlt --delete --files-from=$cwd/managed.txt $cwd $HOME
# mark them readonly to warn me not to edit them.
# Happily rsync ignores this and copies over them just fine!
cat $cwd/managed.txt | tr '\n' '\0' | (cd $HOME; find -files0-from - -type f -exec chmod ug-w -- {} +)
