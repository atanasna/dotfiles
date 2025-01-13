# Install Oh-My-ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#HOMEBREW_NO_AUTO_UPDATE=1 brew install jandedobbeleer/oh-my-posh/oh-my-posh
HOMEBREW_NO_AUTO_UPDATE=1 brew install fzf bat eza fastfetch

# Install Fonts
#oh-my-posh font install firacode 
#oh-my-posh font install terminus

# Install plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/agkozak/zsh-z.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/z
#git clone https://github.com/joshskidmore/zsh-fzf-history-search.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-history-search
#git clone https://github.com/zsh-users/zaw.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zaw

# Install theme
mkdir -p ~/.oh-my-zsh/themes
ln -s atanasna.zsh-theme ~/.oh-my-zsh/themes/atanasna.zsh-theme

# Add symlinks
ln -s .zshrc ~/.zshrc