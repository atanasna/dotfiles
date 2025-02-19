#---------------------
# Install
#---------------------
# Basic
HOMEBREW_NO_AUTO_UPDATE=1 brew install wget fd fzf ripgrep

# LSPs
HOMEBREW_NO_AUTO_UPDATE=1 brew install \
prettier yamllint jsonlint `# yaml & json` \
tflint `# terraform` \
solargraph `# ruby` \
black pylint `# python`
npm install -g intelephense

# Main
HOMEBREW_NO_AUTO_UPDATE=1 brew nvim 
#---------------------
# Link
#---------------------
echo "Linking..." 

src_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
dst_dir="${HOME}/.config"

mkdir -p "${dst_dir}"
ln -s "${src_dir}/config" "${dst_dir}/nvim"
