#!/bin/zsh
readonly UNINSTALL_TARGETS=(
  aliases
  editorconfig
  gitconfig
  gitignore_global
  zprezto
  zshenv
  zshrc
)

echo 'remove dotfiles? (y/N)'
read confirmation
if [[ $confirmation = "y" || $confirmation = "Y" ]]; then
  for target in ${UNINSTALL_TARGETS[@]}; do
    unlink ${HOME}/.${target}
  done
fi
