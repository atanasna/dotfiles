#---------------------
# Install
#---------------------
if command -v brew &> /dev/null; then
  HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask font-terminess-ttf-nerd-font
  HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask ghostty
fi

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
ln -s "${src_dir}/shaders" "${dst_dir}/shaders"

