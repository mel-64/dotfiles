setopt LOCAL_OPTIONS NO_MONITOR
fastfetch &

source $HOME/.config/zsh/*.sh

eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"
source <(fzf --zsh)

# Doesn't seem to be setable via sourced file, so is defined here for now.
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
fpath+=~/.zfunc # Autocompletion

wait

# Load autocompletions from fpath param
autoload -U compinit; compinit

setopt LOCAL_OPTIONS MONITOR
