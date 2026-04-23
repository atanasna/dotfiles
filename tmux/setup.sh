#---------------------
# Install
#---------------------
# Tools 
# HOMEBREW_NO_AUTO_UPDATE=1 brew install delta

# Main 
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# HOMEBREW_NO_AUTO_UPDATE=1 brew install lazygit
#---------------------
# Link
#---------------------
echo "Linking..."

src_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
dst_dir="${HOME}"

mkdir -p "${dst_dir}"
ln -s "${src_dir}/tmux.conf" "${dst_dir}/.tmux.conf"
