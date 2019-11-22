# MYAPP/.deliver/production_assets.zsh

# Feel free to change zsh to bash (or whatever your shell is)
# and eventual local commands for asset compiling

#!/usr/bin/env zsh

#source ~/.zshrc
nvm &>/dev/null
echo "enter in assets"
cd assets

echo "Run yarn install"
yarn install

echo "Remove old priv/static"
[ -d priv/static ] && rm -rf priv/static

echo "Compile assets"
yarn deploy

echo "exit in assets"
cd ..