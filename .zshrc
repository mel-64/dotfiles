autoload -U compinit; compinit

# Case-insensitive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Sort files by modification date
zstyle ':completion:*' file-sort modification

# Use following completers in order
zstyle ':completion:*' completer _extensions _complete _approximate

# Squeeze // to / instead of /*/
zstyle ':completion:*' squeeze-slashes true

# Allow navigating up with shift + tab
bindkey '^[[Z' reverse-menu-complete

# Allow completion of file names from partial names not starting at beginning (file1231.png)
# may be autocompleted from 1231
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Show selection in autocompletion menu
zstyle ':completion:*' menu select

# Turn on completion cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"

# OMZ ls colors
export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=00:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.7z=01;31:*.ace=01;31:*.alz=01;31:*.apk=01;31:*.arc=01;31:*.arj=01;31:*.bz=01;31:*.bz2=01;31:*.cab=01;31:*.cpio=01;31:*.crate=01;31:*.deb=01;31:*.drpm=01;31:*.dwm=01;31:*.dz=01;31:*.ear=01;31:*.egg=01;31:*.esd=01;31:*.gz=01;31:*.jar=01;31:*.lha=01;31:*.lrz=01;31:*.lz=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.lzo=01;31:*.pyz=01;31:*.rar=01;31:*.rpm=01;31:*.rz=01;31:*.sar=01;31:*.swm=01;31:*.t7z=01;31:*.tar=01;31:*.taz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tgz=01;31:*.tlz=01;31:*.txz=01;31:*.tz=01;31:*.tzo=01;31:*.tzst=01;31:*.udeb=01;31:*.war=01;31:*.whl=01;31:*.wim=01;31:*.xz=01;31:*.z=01;31:*.zip=01;31:*.zoo=01;31:*.zst=01;31:*.avif=01;35:*.jpg=01;35:*.jpeg=01;35:*.jxl=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:*~=00;90:*#=00;90:*.bak=00;90:*.crdownload=00;90:*.dpkg-dist=00;90:*.dpkg-new=00;90:*.dpkg-old=00;90:*.dpkg-tmp=00;90:*.old=00;90:*.orig=00;90:*.part=00;90:*.rej=00;90:*.rpmnew=00;90:*.rpmorig=00;90:*.rpmsave=00;90:*.swp=00;90:*.tmp=00;90:*.ucf-dist=00;90:*.ucf-new=00;90:*.ucf-old=00;90:'

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt HIST_IGNORE_SPACE # Don't save to history if space in front

bindkey  "^[[H"   beginning-of-line # Home key
bindkey  "^[[F"   end-of-line # End key
bindkey  "^[[3~"  delete-char # Delete key

alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME'
alias ls='ls --color=tty'
alias ostui="ostui --mpris"
alias tldr='tldr -L en'
alias icat="kitten icat --background white"
alias marptohtml="npx @marp-team/marp-cli@latest --html --theme-set themes/mytheme.css - template.md -o index.html"
alias output-on-all-devices="pactl load-module module-combine-sink"
alias remove-exif="exiftool -all= -overwrite_original"
alias fs="sudo rc-service filesync"
alias fs-sync='kill -SIGHUP "$(cat /run/filesync.pid)"'
alias fs-sync-offline='rclone bisync filesync:/files ~/.offline_filesync --conflict-resolve newer --conflict-loser num --timeout 2s --filter-from ~/.offline_filesync/.important-files.txt 2>&1 | grep conflict | grep home | sed -n "s/.*\x1b\[36m\([^[:cntrl:]]*\)\x1b\[0m.*/\1/p" | while read -r conflict; do notify-send "Conflict at $conflict"; echo "Conflict at $conflict" >> ~/.offline_filesync/.conflict_log.txt; done'
alias fs-sync-offline-init='cd ~; rm -rf .offline_filesync; mkdir .offline_filesync; rclone copyto filesync:/files/.important-files.txt ~/.offline_filesync/.important-files.txt --verbose && rclone bisync filesync:/files ~/.offline_filesync --conflict-resolve newer --conflict-loser num --timeout 2s --filter-from ~/.offline_filesync/.important-files.txt --verbose --resync'
alias fast-emerge='sudo PORTAGE_NICENESS=-5 PORTAGE_SCHEDULING_POLICY="other" emerge'

source ~/.config/shellfunctions/fs_sync_offline.sh &> /dev/null

export PATH="$PATH:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/go/bin"
export CCACHE_DIR="/var/tmp/ccache"
export SSH_AUTH_SOCK="$HOME/.bitwarden-ssh-agent.sock"

eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"
source <(fzf --zsh)

fastfetch --config examples/16
