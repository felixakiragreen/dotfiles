# Path to your oh-my-zsh installation.
export ZSH="/Users/fag/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"
# DEFAULT_USER=$(whoami)

HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git yarn zsh-autosuggestions zsh-syntax-highlighting)
# Note: zsh-syntax-highlighting must be last plugin

source $ZSH/oh-my-zsh.sh

# plugins=( [plugins...] zsh-syntax-highlighting)