set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" alternatively, pass a path where Vundle should install plugins
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

" The following are examples of different formats supported.
" Keep Plugin commands between here and filetype plugin indent on.
" scripts on GitHub repos
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'endel/vim-github-colorscheme'
Plugin 'flazz/vim-colorschemes'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'tomasr/molokai'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomtom/tcomment_vim'
Plugin 'Valloric/YouCompleteMe'

" Haskell Plugins
Plugin 'Shougo/vimproc.vim'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'dag/vim2hs'
Plugin 'eagletmt/neco-ghc'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" scripts from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'mru.vim'

filetype plugin indent on     " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin commands are not allowed.
" Put your stuff after this line

source ~/.vim/vim-config
