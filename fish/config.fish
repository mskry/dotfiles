alias nv "nvim ."

if type -q eza
    alias ll "eza -l1 -g --icons"
    alias lla "ll -a"
end

if status is-interactive
    starship init fish | source
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# pnpm
set -gx PNPM_HOME "/home/ms/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# set default editor for the fzf to open files
set -gx EDITOR "nvim"
set fzf_directory_opts --bind "ctrl-o:execute($EDITOR {} &> /dev/tty)"

set --global _fzf_search_vars_command '_fzf_search_variables (set --show | psub) (set --names | psub)'


# Install the default bindings, which are mnemonic and minimally conflict with fish's preset bindings
fzf_configure_bindings

/home/ms/.local/bin/mise activate fish | source
