KAK_DIR="$HOME"/.config/kak
PLUGIN_DIR=$KAK_DIR/plugins
AUTO_DIR=$KAK_DIR/autoload
PLUG_DIR=$PLUGIN_DIR/plug.kak

if [ ! -d "$KAK_DIR" ]; then mkdir -p "$KAK_DIR"; fi
if [ ! -d "$PLUGIN_DIR" ]; then mkdir -p "$PLUGIN_DIR"; fi
if [ ! -d "$AUTO_DIR" ]; then mkdir -p "$AUTO_DIR"; fi

cp -R "$ZSH"/kakoune/config/ "$KAK_DIR"

if [ ! -d "$PLUG_DIR" ]
then
  mkdir -p
  git clone https://github.com/andreyorst/plug.kak.git "$PLUG_DIR"
fi

if [ ! -h "$AUTO_DIR"/default ]
then
  ln -s "$(brew --prefix kakoune)"/share/autoload "$AUTO_DIR"/default
fi
