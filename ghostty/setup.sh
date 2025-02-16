#---------------------
# Install Dependencies
#---------------------
# Basic 
brew install --cask ghostty

# Fonts
brew install --cask font-terminess-ttf-nerd-font

#---------------------
# Link
#---------------------
echo "Linking ..." 
main_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ln -s $main_dir/config $HOME/Library/Application\ Support/com.mitchellh.ghostty/config
