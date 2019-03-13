#!/bin/zsh
# include util functions
source ${HOME}/.dotfiles/setup/util.zsh

# zplug
util::confirm 'install zplug plugins?'
if [[ $? = 0 ]]; then
  source ${HOME}/.dotfiles/setup/install/zplug.zsh
  install::zplug
fi

# brew
util::confirm 'install brew formulas?'
if [[ $? = 0 ]]; then
  source ${HOME}/.dotfiles/setup/install/brew.zsh
  install::brew
fi

# font
util::confirm 'install font files?'
if [[ $? = 0 ]]; then
  source ${HOME}/.dotfiles/setup/install/font.zsh
  install::font
fi

# Ruby
util::confirm 'install Ruby and gems?'
if [[ $? = 0 ]]; then
  source ${HOME}/.dotfiles/setup/install/ruby.zsh
  install::ruby
fi

# Node.js
util::confirm 'install Node.js?'
if [[ $? = 0 ]]; then
  source ${HOME}/.dotfiles/setup/install/nodejs.zsh
  install::nodejs
fi

# Python
util::confirm 'install Python?'
if [[ $? = 0 ]]; then
  source ${HOME}/.dotfiles/setup/install/python.zsh
  install::python
fi

# Cask
util::confirm 'install brew cask?'
if [[ $? = 0 ]]; then
  source ${HOME}/.dotfiles/setup/install/brew_cask.zsh
  install::brew_cask
fi

# Finallize...
info 'cleanup...'
brew cleanup
brew cask cleanup
info 'done!'
