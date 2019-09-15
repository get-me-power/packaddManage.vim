INSTALL_DIR="$HOME/.vim/pack/packaddManage/start/packaddManage.vim"
echo "sss"
# make plugin dir and fetch dein
if ! [ -e "$INSTALL_DIR" ]; then
  echo "Begin Install..."
  mkdir -p "$INSTALL_DIR"
  git clone https://github.com/kazukazuinaina/packaddManage.vim "$INSTALL_DIR"
  echo "Done."
  echo ""
fi
