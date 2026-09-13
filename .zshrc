setopt LOCAL_OPTIONS NO_MONITOR
fastfetch &

source $HOME/.config/zsh/*.sh

eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"
source <(fzf --zsh)

wait

# Load autocompletions from fpath param
autoload -U compinit; compinit

setopt LOCAL_OPTIONS MONITOR
