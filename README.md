# packaddManage.vim

This is a simple plugin manager for Vim8 and Neovim.

## Requirements

- Vim 8.0 or above or Neovim

- `git` command

## installation for Vim

**UNIX and Linux**

```

$ curl https://raw.githubusercontent.com/kazukazuinaina/packaddManage.vim/master/bin/install.sh > install.sh

$ sh install.sh

```

**Windows**

coming soon...

## Usage

Edit your .vimrc like this

**Example**

```

packadd packaddManage.vim

call packaddManage#init()

" Quick load 
StartPlug 'kazukazuinaina/Weather.vim'

StartPlug 'vim-jp/vimdoc-ja'

" Lazy load
OptPlug 'mattn/vim-starwars'

```

# **TODO**

- [ ] Compatible with Windows

- [ ] Enable to specify plugin loading timing

- [ ] Added plug-in update function

- [ ] Add plug-in deletion function
