#!/bin/bash

set -e

here=`dirname $0`

dotfiles=`ls "$here/dotfiles"`

for dot in $dotfiles; do
  if [ -h "$HOME/.$dot" ]; then
    rm -f "$HOME/.$dot"
  fi
  if [ -f "$HOME/.$dot" ]; then
    echo "Skipping $dot, target already exists"
  else
    ln -s "$here/dotfiles/$dot" "$HOME/.$dot"
  fi
done

