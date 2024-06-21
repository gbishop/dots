#!/usr/bin/bash
rsync -ra --files-from=managed.txt . $HOME
