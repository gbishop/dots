#!/bin/bash

set -x

cd ~/Downloads
mkdir -p tmp-tmux
cd tmp-tmux
curl -s https://api.github.com/repos/tmux/tmux/releases/latest \
| grep "browser_download_url" \
| cut -d '"' -f 4 \
| wget -qi -

tar -zxf tmux-*.tar.gz
cd tmux-*/
./configure
make && sudo make install

cd ../..
rm -rf tmp-tmux
