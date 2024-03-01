if status is-interactive
    # Commands to run in interactive sessions can go here
    #pokemon-colorscripts --random --no-title 
    krabby random --no-title
end

function fish_greeting
    # echo "🐟"
end

# Created by `pipx` on 2023-12-13 23:25:56
set PATH $PATH /home/paveun/.local/bin

set --path -x XDG_DATA_DIRS $XDG_DATA_DIRS

set QT_QPA_PLATFORMTHEME qt6ct

starship init fish | source

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/miniconda3/bin/conda
    eval /opt/miniconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/opt/miniconda3/etc/fish/conf.d/conda.fish"
        . "/opt/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/opt/miniconda3/bin" $PATH
    end
end
# <<< conda initialize <<<

alias ssh="TERM=xterm-256color $(which ssh)"
