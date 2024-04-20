if status is-interactive
    # Commands to run in interactive sessions can go here
    alias l='ls -lah'
    alias v='nvim'

    set -x EDITOR nvim
    set -x VISUAL $EDITOR
    set -x SUDO_EDITOR $EDITOR
end
