export ZSH=~/.oh-my-zsh

if [ ! -d $ZSH ]; then
  # Install oh-my-zsh
  git clone https://github.com/robbyrussell/oh-my-zsh.git $ZSH
  # Install spaceship theme
  git clone https://github.com/denysdovhan/spaceship-prompt.git $ZSH/custom/themes/spaceship-prompt
  # Install zsh auto suggestions
  git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH/custom/plugins/zsh-autosuggestions
  # Install zsh syntax highlighting
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH/custom/plugins/zsh-syntax-highlighting
fi

#  if symlink doesn't exist, create it
if [ ! -L "$ZSH_CUSTOM/themes/spaceship.zsh-theme" ]; then
  ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
fi
