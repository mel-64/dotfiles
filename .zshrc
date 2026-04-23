fastfetch --config examples/16
# fastfetch --config examples/16 --kitty-direct ~/Pictures/shork.png --logo-width 25 --logo-height 10

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME'
alias ledger-shell="ledger-agent ~/.ssh/ledger.conf -s -v"
alias ostui="ostui --mpris"
alias dcd="docker compose down"
alias dcu='UID="$(id -u)" GID="$(id -g)" docker compose up'
alias dcud='UID="$(id -u)" GID="$(id -g)" docker compose up -d'
alias dbounce='docker compose down && dcud'
alias tldr='tldr -L en'
alias needssh="git remote set-url origin \$(git remote get-url origin | sed -e 's|https://github.com/|git@github.com:|' -e 's|/$||' -e 's|\.git$||')"
alias icat="kitten icat --background white"
alias marptohtml="npx @marp-team/marp-cli@latest --html --theme-set themes/mytheme.css - template.md -o index.html"
alias output-on-all-devices="pactl load-module module-combine-sink"
alias remove-exif="exiftool -all= -overwrite_original"
alias fs="sudo rc-service filesync"
alias fs-sync='kill -SIGHUP "$(cat /run/filesync.pid)"'
alias fs-sync-offline='rclone bisync filesync:/files ~/.offline_filesync --conflict-resolve newer --conflict-loser num --timeout 2s --filter-from ~/.offline_filesync/.important-files.txt 2>&1 | grep conflict | grep home | sed -n "s/.*\x1b\[36m\([^[:cntrl:]]*\)\x1b\[0m.*/\1/p" | while read -r conflict; do notify-send "Conflict at $conflict"; echo "Conflict at $conflict" >> ~/.offline_filesync/.conflict_log.txt; done'
alias fs-sync-offline-init='cd ~; rm -rf .offline_filesync; mkdir .offline_filesync; rclone copyto filesync:/files/.important-files.txt ~/.offline_filesync/.important-files.txt --verbose && rclone bisync filesync:/files ~/.offline_filesync --conflict-resolve newer --conflict-loser num --timeout 2s --filter-from ~/.offline_filesync/.important-files.txt --verbose --resync'
alias fast-emerge='sudo PORTAGE_NICENESS=-5 PORTAGE_SCHEDULING_POLICY="other" emerge'

source ~/.config/shellfunctions/fs_sync_offline.sh

export PATH="$PATH:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/go/bin"
export CCACHE_DIR="/var/tmp/ccache"
export SSH_AUTH_SOCK=~/.bitwarden-ssh-agent.sock
export XDG_DATA_DIRS="$XDG_DATA_DIRS:~/.local/share/flatpak/exports/share"

eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"
source <(fzf --zsh)
