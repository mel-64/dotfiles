alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
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
alias spueue='sudo pueue -c /etc/pueue.yml'

