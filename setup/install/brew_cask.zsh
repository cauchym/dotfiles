#!/bin/zsh
# include util functions
source ${HOME}/.dotfiles/setup/util.zsh

install::brew_cask() {
  util::info 'install brew cask formulas...'

  local taps=(
    caskroom/cask
  )

  local casks=(
    alfred
    appcleaner
    atom
    caffeine
    clipy
    docker
    dropbox
    firefox
    google-cloud-sdk
    google-chrome
    google-japanese-ime
    iterm2
    java
    karabiner-elements
    licecap
    moom
    mysqlworkbench
    nosleep
    rescuetime
    shiftit
    slack
    vagrant
    virtualbox
    xquartz
  )

  brew tap ${taps[@]}
  brew cask install ${casks[@]}
  apm install sync-settings
}
