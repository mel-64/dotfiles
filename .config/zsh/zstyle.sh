# Case-insensitive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Sort files by modification date
zstyle ':completion:*' file-sort modification

# Use following completers in order
zstyle ':completion:*' completer _extensions _complete _approximate

# Squeeze // to / instead of /*/
zstyle ':completion:*' squeeze-slashes true

# Color completions
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"

# More verbose process completion
zstyle ':completion:*:*:*:*:processes' command 'ps -u $USER -o pid,user,command -w'

# Allow completion of file names from partial names not starting at beginning (file1231.png)
# may be autocompleted from 1231
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Show selection in autocompletion menu
zstyle ':completion:*' menu select

# Turn on completion cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"

