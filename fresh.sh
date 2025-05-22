#!/bin/sh

echo "Setting up your Mac..."

# Install Oh My Zsh if not already installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh My Zsh..."
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Install Homebrew if not already installed
if ! command -v brew >/dev/null 2>&1; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Set up Homebrew shell environment based on architecture
  if [[ $(uname -m) = "arm64" ]]; then
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
    eval "$(/opt/homebrew/bin/brew shellenv)"
  else
    echo 'eval "$(/usr/local/bin/brew shellenv)"' >> "$HOME/.zprofile"
    eval "$(/usr/local/bin/brew shellenv)"
  fi
fi

# Remove existing .zshrc and link to custom one from .dotfiles
echo "Linking .zshrc from .dotfiles..."
rm -f "$HOME/.zshrc"
ln -s "$HOME/.dotfiles/.zshrc" "$HOME/.zshrc"

# Install Zsh plugins
echo "Installing zsh plugins..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
  "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"

git clone https://github.com/zsh-users/zsh-autosuggestions.git \
  "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"

# Update Homebrew
echo "Updating Homebrew..."
brew update

# Run custom brew install script
DOTFILES="$HOME/.dotfiles"
echo "Installing apps and tools from brewfile.sh..."
sh "$DOTFILES/brewfile.sh"

# Create work directories
mkdir -p "$HOME/code"
mkdir -p "$HOME/herd"

echo "Done setting up your Mac."