#---------------------
# Install
#---------------------
if command -v brew &> /dev/null; then
  # Basic
  HOMEBREW_NO_AUTO_UPDATE=1 brew install wget fd fzf ripgrep lazygit

  # LSPs
  HOMEBREW_NO_AUTO_UPDATE=1 brew install \
  prettier \
  yamllint \
  jsonlint \
  terraform-linters/tap/tflint \
  solargraph \
  black pylint
  npm install -g intelephense

  # Main
  HOMEBREW_NO_AUTO_UPDATE=1 brew install neovim 
fi
#---------------------
# Link
#---------------------
echo "Linking..." 

src_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
dst_dir="${HOME}/.config"

mkdir -p "${dst_dir}"
ln -s "${src_dir}/config" "${dst_dir}/nvim"
