#!/usr/bin/env nu

let current_dir = (pwd)
let dotfiles = (ls).name
enter ~/.config/

for file in $dotfiles {
  try {
    mv $file $"($file).backup"
  } catch {
    echo "No such file"
  }
  ln -s $"($current_dir)/($file)" $file
}

