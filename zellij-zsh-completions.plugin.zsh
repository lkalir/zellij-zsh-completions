if ! (( $+commands[zellij] )); then
  return
fi

# If the completion file doesn't exist yet, we need to autoload it and
# bind it to `zellij`. Otherwise, compinit will have already done that
if [[ ! -f "$ZSH_CACHE_DIR/completions/_zellij" ]]; then
  autoload -Uz _zellij
  typeset -g -A _comps
  _comps[zellij]=_zellij
fi

# Generate completion files in the background
zellij setup --generate-completion zsh >| "$ZSH_CACHE_DIR/completions/_zellij" &|
