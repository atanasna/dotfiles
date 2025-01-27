# Install
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
HOMEBREW_NO_AUTO_UPDATE=1 brew install fzf bat eza fastfetch

# Add plugins
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/agkozak/zsh-z.git $HOME/.oh-my-zsh/custom/plugins/z

# Link
mkdir -p $HOME/.oh-my-zsh/themes
ln -s atanasna.zsh-theme $HOME/.oh-my-zsh/themes/atanasna.zsh-theme
ln -s fastfetch.config.jsonc $HOME/.config/fastfetch/config.jsonc
ln -s zsh_rc $HOME/.zshrc