# Personal vim configuration

*Vim 8.0* personal configuration optimized for Fedora 28.

Some plugins are installed as submodules and others just using Fedora binaries
packages. I found that method pretty easy and save a lot of time. Keep in mind
some plugins requires additional binaries, so Fedora and `dnf` are installing
those binaries for us.

Tested on the following Vim versions:

* 8.1.55
* 8.0

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

Install some plugins using Fedora packages:

```
$ sudo dnf install \
    vim-go \
    vim-golint \
    vim-jedi \
    vim-minimal \
    vim-powerline \
    vim-syntastic \
    vim-syntastic-puppet \
    vim-syntastic-python
```

Create *symlinks* on your *HOME* dir:

```
$ ln -s vim-fedora/.vim ~/.vim
$ ln -s vim-fedora/.vimrc ~/.vimrc
```

## How to install plugins using Vim 8

Just clone *git* plugin repo as a *git submodule*. Example:

```
$ git submodule add https://github.com/easymotion/vim-easymotion.git .vim/pack/plugins/start/vim-easymotion/
```
