#!/bin/bash
source ~/.zshrc

kitty @ launch \
  --no-response \
  --title Mezetude \
  --tab-title Editor \
  --type os-window \
  --cwd ~/github.com/callahanrts/mezetude \
  zsh -c 'source ~/.zshrc; nvim; zsh -i'

kitty @ launch \
  --no-response \
  --tab-title Editor \
  --type window \
  --cwd ~/github.com/callahanrts/mezetude \
  zsh -c 'source ~/.zshrc; zsh -i'

kitty @ launch \
  --no-response \
  --tab-title Server \
  --type tab \
  --cwd ~/github.com/callahanrts/mezetude \
  zsh -c 'source ~/.zshrc; make serve; zsh -i'

