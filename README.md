## TODO:
- Add usefull README
    - Dependencies
    - General information
    - Screenshots
- Add installation script

## How to install Dotfiles:
- Make sure you installed Hyprland and all programs listed in hyprland.conf
- Run `alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME'`
- Run `git clone --bare REPO-CLONE-URL-HERE $HOME/dotfiles`
- Run `dotfiles config --local status.showUntrackedFiles no`
- Run `dotfiles checkout`
- Finally restart your shell to be able to update the dotfiles via the `dotfiles pull origin main` command.

## Non-exhaustive list of required binaries / packages
- hypr{idle,land,lock,paper}
- zsh
- bash
- waybar
- kitty
- fastfetch
- websocat
- Nerd Fonts (0xProto)
- jq
- distrobox called arch with 
    - pear-desktop
    - feishin


## Colors
- Accent 1: `#de00a3ee`
- Accent 2: `#05aff7ee`
- Accent 1 secondary: `#de00a399`
- Accent 2 secondary: `#de00a399`
- Background: `#14141ebf`
- Text: `#f0f0fae6`
