alias nv "nvim ."

if type -q eza
    alias ls="eza"
end

if type -q bat
    alias cat="bat"
end

if type -q fd
    alias find="fd --type f"
end

if status is-interactive
    starship init fish | source
end

if type -q mise
    /home/ms/.local/bin/mise activate fish | source
end
# set default editor for the fzf to open files
set -gx EDITOR "nvim"
set fzf_directory_opts --bind "ctrl-o:execute($EDITOR {} &> /dev/tty)"
set --global _fzf_search_vars_command '_fzf_search_variables (set --show | psub) (set --names | psub)'
# Install the default bindings, which are mnemonic and minimally conflict with fish's preset bindings
fzf_configure_bindings

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/ms/miniconda3/bin/conda
    eval /home/ms/miniconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/ms/miniconda3/etc/fish/conf.d/conda.fish"
        . "/home/ms/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/ms/miniconda3/bin" $PATH
    end
end
# <<< conda initialize <<<

