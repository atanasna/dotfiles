#---------------------
# Install
#---------------------
# Main 
HOMEBREW_NO_AUTO_UPDATE=1 brew install tmux

mkdir -p "${HOME}/.tmux/plugins"
if [[ ! -d "${HOME}/.tmux/plugins/tpm/.git" ]]; then
  git clone https://github.com/tmux-plugins/tpm "${HOME}/.tmux/plugins/tpm"
fi

#---------------------
# Link
#---------------------
echo "Linking..."

src_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
dst_dir="${HOME}"

mkdir -p "${dst_dir}"
ln -sfn "${src_dir}/tmux.conf" "${dst_dir}/.tmux.conf"

# Install TPM plugins declared in tmux.conf, including Catppuccin.
"${HOME}/.tmux/plugins/tpm/bin/install_plugins"
