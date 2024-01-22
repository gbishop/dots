/home/gb/bin/log .profile starts

[ -n "$DISPLAY" ] && [ -f ~/.Xresources ] && xrdb -merge ~/.Xresources

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi


/home/gb/bin/log .profile ends
