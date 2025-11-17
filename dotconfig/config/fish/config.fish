if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Start X at login
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end

pyenv init - fish | source

starship init fish | source

set --universal nvm_default_version v22.20.0
set --universal nvm_default_packages pnpm np

fzf --fish | source
