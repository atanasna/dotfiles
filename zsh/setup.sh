#---------------------
# Init
#---------------------
src_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
dst_theme_dir="${HOME}/.oh-my-zsh/themes"
dst_zsh_dir="${HOME}/.config/zsh"

#---------------------
# Cleanup
#---------------------
rm -rf $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
rm -rf $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

rm -rf "${dst_theme_dir}"
rm -rf "${dst_zsh_dir}"

#---------------------
# Install
#---------------------
# Tools
if ! command -v brew >/dev/null 2>&1
then
  HOMEBREW_NO_AUTO_UPDATE=1 brew install fzf bat eza fd rg zoxide
fi

# Main 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Plugins
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

#---------------------
# Link
#---------------------
echo "Linking ..." 

mkdir -p "${dst_theme_dir}"
mkdir -p "${dst_zsh_dir}"
touch "${dir_zsh_dir}/secrets"
touch "${dir_zsh_dir}/custom"

ln -s "${src_dir}/atanasna.zsh-theme" "${dst_theme_dir}/atanasna.zsh-theme"
mv "$HOME/.zshrc" "$HOME/.zshrc.backup"
mv "$HOME/.zprofile" "$HOME/.zprofile.backup"
ln -s "${src_dir}/zsh_aliases" "${dst_zsh_dir}/aliases"
ln -s "${src_dir}/zsh_paths" "${dst_zsh_dir}/paths"
ln -s "${src_dir}/zsh_profile" "$HOME/.zprofile"
ln -s "${src_dir}/zsh_rc" "$HOME/.zshrc"
