# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="fishy"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME'

fastfetch --config examples/16
# fastfetch --config examples/16 --kitty-direct ~/Pictures/shork.png --logo-width 25 --logo-height 10

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'


# export XDG_CURRENT_DESKTOP=sway
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

eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"
source <(fzf --zsh)
