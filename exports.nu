use std/util "path add"

path add ".local/bin"
path add ".docker/bin"
path add ".tmux/plugins/tmuxifier/bin"
path add "flutter/bin"
path add ".pub-cache/bin"
path add ".bun/bin"
path add ".cargo/bin"
path add "go/bin"
path add "/snap/bin"
path add "/opt/google-cloud-sdk/bin"
path add "~/.config/scripts"
path add "~/.atuin/bin"

$env.MANPAGER = "nvim +Man!"
$env.MANWIDTH = "999"
$env.EDITOR = "nvim"
$env.KUBE_EDITOR = "nvim"

$env.PATH = ($env.PATH | uniq)
