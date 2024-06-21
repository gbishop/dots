# Manage my dotfiles with Git

I tried various dotfile management strategies and found them too complicated
and/or fragile. I used Stow, bare git, Chezmoi and a few others. I wanted
something really simple that I understood.

This is my attempt at a simpler system. I am emulating the bare repository idea
without keeping the repo in $HOME. The dotfiles live on Github, I clone the repo
locally and copy files out of it as I make changes.

The files in the repo are the source of truth. I edit them there.
