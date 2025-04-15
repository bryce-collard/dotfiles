set nocompatible
filetype off

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'godlygeek/tabular'
Plugin 'preservim/vim-markdown'

call vundle#end()
filetype plugin indent on

let g:vim_markdown_conceal=2

set number
set hlsearch
set conceallevel=2
set backspace=indent,eol,start

filetype plugin on
filetype indent on

syntax on
