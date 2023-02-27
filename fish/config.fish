set PATH $HOME/.cargo/bin $PATH
set PATH /usr/local/Cellar/llvm/15.0.2/bin $PATH
set ZELLIJ_CONFIG_DIR $HOME/.config/zellij

# Define alias in shell
alias vim "nvim"
alias vi "nvim"
alias ls "exa --long"
alias zellij "zellij -l compact"

# Set default editor
set EDITOR "nvim"
set VISUAL "nvim"

if status is-interactive
    # Commands to run in interactive sessions can go here
    eval (zellij setup --generate-auto-start fish | string collect)
    eval (starship init fish | source)
end

# pnpm
set -gx PNPM_HOME "/Users/mac/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end