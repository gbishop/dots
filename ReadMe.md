# Manage my dotfiles with Git

I tried various dotfile management strategies and found them too complicated
and/or fragile. I used Stow, bare git, Chezmoi and a few others. I wanted
something really simple that I understood.

This is my attempt at a simpler system. I am emulating the bare repository idea
without keeping the repo in $HOME. The dotfiles live on Github, I clone the repo
locally and copy files into and out of it as I make changes.

The files in $HOME are the source of truth. I edit them there. The repo is for
backup and syncronization.

The flow goes like this:

1. git fetch
2. copy the files from $HOME to the repo.
3. nvim -c G -c only (to manage the merge)
4. git push (should this be in the script?)
5. copy the files from repo to $HOME.
