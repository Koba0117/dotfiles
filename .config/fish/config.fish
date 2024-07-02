if status is-interactive
  # Commands to run in interactive sessions can go here
  alias l='ls -lah'
  alias v='nvim'
  alias g='gitui'
  alias sus='systemctl suspend'

  set -x EDITOR nvim
  set -x VISUAL $EDITOR
  set -x SUDO_EDITOR $EDITOR

  set fish_cursor_default block
  set fish_cursor_insert line
  set fish_cursor_replace_one underscore
  set fish_cursor_replace underscore
end
