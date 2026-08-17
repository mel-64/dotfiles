## TODO:
- Add usefull README
    - General information
    - Screenshots
- Add installation script

## How to install Dotfiles:
- Make sure you installed Hyprland and all programs listed in hyprland.conf
- Run `alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'`
- Run `git clone --bare https://git.shork.ch/melody/dotfiles.git $HOME/.dotfiles`
- Run `dotfiles config --local status.showUntrackedFiles no`
- Run `dotfiles checkout`
- Finally restart your shell to be able to update the dotfiles via the `dotfiles pull origin main` command.

## Non-exhaustive list of required binaries / packages

### Core components
- hyprland (compositor)
- hypridle (idle manager)
- hyprlock (lock screen)
- awww (wallpaper)
- waybar (bar)
- mako (notifications)
- kitty (terminal)
- hyprshot (screenshots)
- hyprpicker (color picker)
- hyprlauncher (launcher)
- cosmic-files (file manager)
- fprintd (fingerprint)
- polkit-gnome-authentication-agent-1 (auth dialogs)

### Audio / Media / Hardware
- gentoo-pipewire-launcher / pipewire
- pavucontrol (audio GUI)
- playerctl (media keys)
- brightnessctl (backlight)
- Nerd Fonts (0xProto)

### System
- NetworkManager
- bluez (bluetooth)
- blueman (bluetooth manager)
- power-profiles-daemon

### Shell / CLI
- zsh
- bash
- zoxide
- starship
- fzf
- fastfetch
- websocat
- jq
- rclone
- notify-send

### distrobox called arch with
- pear-desktop
- feishin


## Colors
- Accent 1: `#de00a3ee`
- Accent 2: `#05aff7ee`
- Accent 1 secondary: `#de00a399`
- Accent 2 secondary: `#de00a399`
- Background: `#14141ebf`
- Text: `#f0f0fae6`
