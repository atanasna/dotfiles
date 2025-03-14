#---------------------
# Install
#---------------------
# Tools 
HOMEBREW_NO_AUTO_UPDATE=1 brew install delta

# Main 
HOMEBREW_NO_AUTO_UPDATE=1 brew install lazygit
#---------------------
# Link
#---------------------
echo "Linking..."

src_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
dst_dir="${HOME}/Library/Application\ Support/jesseduffield/lazygit"

mkdir -p "${dst_dir}"
ln -s "${src_dir}/config.yml" "${dst_dir}/config.yml"
