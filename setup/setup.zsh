#!/bin/zsh
# setup script.
# exit when git is not found
git --version | grep 'git version'
if [ "$?" -eq 0 ]
then
  echo 'git is found'
else
  echo 'install git first'
  exit
fi

# downlaod dotfiles
if [[ ! -e ${HOME}/.dotfiles ]]; then
  git clone --recursive https://github.com/cauchym/dotfiles.git ${HOME}/.dotfiles
else
  git pull ${HOME}/.dotfiles
fi

# move dotfiles dir
cd ${HOME}/.dotfiles

# deploy dotfiles
for name in *; do
  if [[ ${name} != 'setup' ]] && [[ ${name} != 'config' ]] && [[ ${name} != 'README.md' ]]; then
    if [[ -L ${HOME}/.${name} ]]; then
      unlink ${HOME}/.${name}
    fi
    ln -sfv ${PWD}/${name} ${HOME}/.${name}
  fi
done

# deploy config
if [[ ! -d ${HOME}/.config ]]; then
  mkdir ${HOME}/.config
fi
cd .config
for name in *; do
  if [[ -L ${XDG_CONFIG_HOME:-$HOME/.config}/$name ]]; then
    unlink ${XDG_CONFIG_HOME:-$HOME/.config}/$name
  fi
  ln -sfv ${PWD}/${name} ${XDG_CONFIG_HOME:-$HOME/.config}/${name}
done
cd ..

# download zplug
if [[ ! -d ${HOME}/.zplug ]]; then
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi
source ${HOME}/.zshrc

# install...
FORCE=1
source ${HOME}/.dotfiles/setup/install.zsh

# replace zsh
echo 'update using zsh path? (y/n)'
read confirmation
if [[ ${confirmation} = "y" || ${confirmation} = "Y" ]]; then
  brew upgrade
  brew install zsh --without-etcdir
  sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
  chsh -s /usr/local/bin/zsh
  source ${HOME}/.zshrc
fi
