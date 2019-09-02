#!/bin/sh
set -e

cd ~/.vim-setup

echo 'set runtimepath+=~/.vim-setup
source ~/.vim-setup/vimconfigs/0.1.vim
source ~/.vim-setup/vimconfigs/filetypes.vim
source ~/.vim-setup/vimconfigs/plugin_conf.vim' > ~/.vimrc

echo "(ﾉ◕ヮ◕)ﾉ*:･ﾟ✧ Success ✧ﾟ･: *ヽ(◕ヮ◕ヽ)"