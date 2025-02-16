#---------------------
# Install Dependencies
#---------------------
# Basic
HOMEBREW_NO_AUTO_UPDATE=1 brew install wget lazygit fd fzf ripgrep

# LSPs
HOMEBREW_NO_AUTO_UPDATE=1 brew install \
prettier yamllint jsonlint `# yaml & json` \
tflint `# terraform` \
solargraph `# ruby` \
black pylint `# python`
npm install -g intelephense

#---------------------
# Link
#---------------------
echo "Linking ..." 
main_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ln -s $main_dir/config $HOME/.config/nvim
