#---------------------
# Install Dependencies
#---------------------
# Tools
HOMEBREW_NO_AUTO_UPDATE=1 brew install fzf bat eza fastfetch

# Main 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Plugins
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/agkozak/zsh-z.git $HOME/.oh-my-zsh/custom/plugins/z

#---------------------
# Link
#---------------------
echo "Linking ..." 

src_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
dst_theme_dir="${HOME}/.oh-my-zsh/themes"
dst_fastfetch_dir="${HOME}/.config/fastfetch"
dst_zsh_dir="${HOME}/.config/zsh"

mkdir -p "${dst_theme_dir}"
mkdir -p "${dst_fastfetch_dir}"
mkdir -p "${dst_zsh_dir}"
ln -s "${src_dir}/atanasna.zsh-theme" "${dst_theme_dir}/atanasna.zsh-theme"
ln -s "${src_dir}/fastfetch.config.jsonc" "${dst_fastfetch_dir}/config.jsonc"
mv "$HOME/.zshrc" "$HOME/.zshrc.backup"
ln -s "${src_dir}/zsh_aliases" "${dst_zsh_dir}/aliases"
ln -s "${src_dir}/zsh_rc" "$HOME/.zshrc"
