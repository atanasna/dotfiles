#---------------------
# Plugin Dependencies
#---------------------
HOMEBREW_NO_AUTO_UPDATE=1 brew install wget lazygit fd fzf ripgrep

#---------------------
# LSP Dependencies
#---------------------
HOMEBREW_NO_AUTO_UPDATE=1 brew install \
prettier yamllint jsonlint `# yaml & json` \
tflint `# terraform` \
solargraph `# ruby` \
black pylint `# python`
npm install -g intelephense

#---------------------
# Link
#---------------------
ln -s $HOME/personal/repos/dotfiles/nvim/config $HOME/.config/nvim
