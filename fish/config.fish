# >>> mise initialize >>>
~/.local/bin/mise activate fish | source
# <<< mise initialize <<<

alias nv "nvim ."

if type -q eza
    alias ls="eza"
    # rest of the aliases are in fish/functions/l*.fish
end

if type -q bat
    alias cat="bat"
end

if type -q fd
    alias find="fd --type f"
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
~/.local/share/mise/installs/zoxide/latest/bin/zoxide init fish | source
#abbr --erase cd &>/dev/null
alias cd=__zoxide_z

# switch keymap on both shifts pressed
setxkbmap -model pc105 -layout us,ua -variant qwerty -option grp:shifts_toggle

set -gx BROWSER "brave"

~/.local/share/mise/installs/starship/latest/bin/starship init fish | source
