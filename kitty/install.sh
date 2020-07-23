KITTY_DIR=$HOME/.config/kitty
KITTY_CONF=$KITTY_DIR/kitty.conf

if [ ! -d "$KITTY_DIR" ]
then
  mkdir -p "$KITTY_DIR"
fi

if [ ! -f "$KITTY_CONF" ]
then
  cp "$ZSH"/kitty/kitty.conf "$HOME"/.config/kitty/kitty.conf
fi
