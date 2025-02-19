#---------------------
# Install Dependencies
#---------------------
# Fonts
brew install --cask font-terminess-ttf-nerd-font

# Main 
brew install --cask ghostty
#---------------------
# Link
#---------------------
echo "Linking ..." 

src_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo $src_dir
dst_dir="${HOME}/Library/Application Support/com.mitchellh.ghostty"

echo $dst_dir
mkdir -p "${dst_dir}"
ln -s "${src_dir}/config" "${dst_dir}/config"
