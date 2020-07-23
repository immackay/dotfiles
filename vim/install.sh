VUNDLE_DIR="$HOME/.vim/bundle/Vundle.vim"

if [ ! -d "$VUNDLE_DIR" ]
then
  mkdir -p "$VUNDLE_DIR"
  git clone https://github.com/VundleVim/Vundle.vim.git "$VUNDLE_DIR"
fi
