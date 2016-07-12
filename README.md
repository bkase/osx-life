# OSX life (a nix-shell definition)

This is my life as a nix shell definition

Stick this in your ~/.profile to have your life in every virtual terminal:

```bash
. /Users/bkase/.nix-profile/etc/profile.d/nix.sh
# no prompt change because this is the first shell
alias code='nix-shell . -I nixpkgs=/Users/bkase/life/nixpkgs --command "exec zsh; return"'

cd life && code
```

Make sure you fix all the paths in the `~/.profile` for your system

