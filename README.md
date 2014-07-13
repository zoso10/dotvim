# Installation
```shell
git clone https://github.com/zoso10/dotvim.git ~/.vim
```

# Setup
Create symlinks to the rc file in the directory
```shell
ln -s ~/.vim/vimrc ~/.vimrc
```
Init and update the submodules
```shell
git submodule update --init
```
---
Also make sure that the terminal is set to 256 colors.
---
If you want the special characters that is used by Airline make sure you use a patched Powerline font. There are a few patched fonts [here](https://github.com/Lokaltog/powerline-fonts)
