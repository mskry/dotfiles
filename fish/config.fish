set PATH $HOME/.cargo/bin $PATH
set PATH /usr/local/Cellar/llvm/17.0.1/bin $PATH

# Define alias in shell
alias vim "nvim"
alias vi "nvim"
alias nv "nvim ."
alias ls "eza --long"

# Set default editor
set EDITOR "nvim"
set VISUAL "nvim"

if status is-interactive
    eval (starship init fish | source)
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# pnpm
set -gx PNPM_HOME "/Users/mac/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end
