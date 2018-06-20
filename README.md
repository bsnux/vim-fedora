# Personal vim configuration

*Vim 8.0* personal configuration optimized for Fedora.

## Installation

Clone this repo. to your favorite location:

```
$ git clone https://github.com/bsnux/vim-fedora.git
```

Update submodules:

```
$ cd vim-fedora
$ git submodule init
$ git submodule update --init --recursive
```

Create *symlinks* on your *HOME* dir:

```
$ ln -s vim-fedora/.vim ~/.vim
$ ln -s vim-fedora/.vimrc ~/.vimrc
```

`YouCompleteme` plugins requires to run the following commands:

```
$ cd pack/plugins/start/YouCompleteMe
$ python install.py
```

## How to install plugins using Vim 8

Just clone *git* plugin repo as a *git submodule*. Example:

```
$ git submodule add https://github.com/easymotion/vim-easymotion.git .vim/pack/plugins/start/vim-easymotion/
```
