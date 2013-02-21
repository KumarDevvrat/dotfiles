" Initial hacked on vimrc from here: http://amix.dk/vim/vimrc.html

"""""""""""""""""""""""""""""
" => Pathogen
"""""""""""""""""""""""""""""
silent! call pathogen#helptags()
call pathogen#infect()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Enable mouse support in terminal
set mouse=a

" Enable filetype plugin
filetype plugin on
filetype indent on

" Set syntax highlighting
syntax on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Fast editing of the .vimrc
map <leader>g :e! ~/.vimrc<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the curors - when moving vertical..
set so=7

set wildmenu "Turn on WiLd menu

set nocul " Don't Highlight the current line

set ruler "Always show current position

set cmdheight=2 "The commandbar height

" Set backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase "Ignore case when searching
set smartcase

set hidden " Very important otherwise buffers irritate.

set hlsearch "Highlight search things

set incsearch "Make search act like search in modern browsers
set nolazyredraw "Don't redraw while executing macros

set magic "Set magic on, for regular expressions

set showmatch "Show matching bracets when text indicator is over them
set mat=2 "How many tenths of a second to blink

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set gfn=Courier\ 10\ Pitch\ 11
set shell=/bin/zsh
set gfn=Droid\ Sans\ Mono\ 9
" set gfn=Mensch\ 11
" set gfn=Envy\ Code\ R\ 11

if has("gui_running")
  set guioptions-=T
  set t_Co=256
  " let g:molokai_original=1
  " colorscheme molokai
  " colorscheme zenburn
  colorscheme github
  set nonu
else
  set t_Co=256
  let molokai_original=1
  " colorscheme molokai
  colorscheme zenburn
  set nonu
endif

set encoding=utf8
try
    lang en_US
catch
endtry

set ffs=unix,dos,mac "Default file types

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set undodir=~/.vim_runtime/undodir
set undofile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
autocmd FileType make setlocal noexpandtab
set shiftwidth=4
set tabstop=4
set smarttab

autocmd FileType c,cpp setlocal ts=8
autocmd FileType c,cpp setlocal sw=8

set lbr

set ai "Auto indent
set si "Smart indet
set wrap "Wrap lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map space to / (search) and c-space to ? (backgwards search)
map <space> /
map <C-space> ?
map <silent> <leader><cr> :noh<cr>
map <leader>q :q<cr>

" Smart way to move btw. window
let g:C_Ctrl_j = 'off'
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Use the arrows to something usefull
map <right> :bn<cr>
map <left> :bp<cr>" Use the arrows to something usefull

" Close the current buffer
map <leader>fd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,300 bd!<cr>

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>

command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" Specify the behavior when switching between buffers 
try
  set switchbuf=usetab
  set stal=2
catch
endtry

""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
" Always hide the statusline
set laststatus=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Remap VIM 0
map 0 ^

" Trigger Omni-completion
imap <C-f> <C-x><C-o>

" Delete the whole line in insert mode
imap <C-e> <C-o>dd<Esc>

"Delete trailing white space, useful for Python ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

set guitablabel=%t

""""""""""""""""""""""""""""""
" => Snipmate
""""""""""""""""""""""""""""""
let g:snips_author = 'Kumar Devvrat <kumardevvrat@gmail.com>'

""""""""""""""""""""""""""""""
" => FuzzyFinder
""""""""""""""""""""""""""""""
map <leader>ff :FufFile<cr>
map <leader>fr :FufBookmarkDir<cr>
map <leader>fe :FufChangeList<cr>

""""""""""""""""""""""""""""""
" => MRU
""""""""""""""""""""""""""""""
map <leader>e :MRU<Cr>

""""""""""""""""""""""""""""""
" => Completions
""""""""""""""""""""""""""""""
" au FileType python set omnifunc=pythoncomplete#Complete
let g:ropevim_vim_completion=1
let g:ropevim_extended_complete=1
au FileType c set omnifunc=ccomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabContextDefaultCompletionType = "<C-n>"
set completeopt=menuone,longest

let python_highlight_all=1

" automatically close autocompletition window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Session
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:session_autosave="no"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Word like formatting in Vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" modify selected text using combining diacritics
command! -range -nargs=0 Overline        call s:CombineSelection(<line1>, <line2>, '0305')
command! -range -nargs=0 Underline       call s:CombineSelection(<line1>, <line2>, '0332')
command! -range -nargs=0 DoubleUnderline call s:CombineSelection(<line1>, <line2>, '0333')
command! -range -nargs=0 Strikethrough   call s:CombineSelection(<line1>, <line2>, '0336')

function! s:CombineSelection(line1, line2, cp)
  execute 'let char = "\u'.a:cp.'"'
  execute a:line1.','.a:line2.'s/\%V[^[:cntrl:]]/&'.char.'/ge'
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tagbar 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tagbar_left = 1
nnoremap <silent> <F8> :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Display line numbers to the left
set number

" Show normal mode commands
set showcmd

inoremap jk <Esc>`^
inoremap kj <Esc>`^

nmap ; :
nmap <CR> o<Esc>

let g:Powerline_symbols='compatible'
let g:SuperTabDefaultCompletionType = "context"

call pathogen#infect()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Code Formatting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" inoremap { {}<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap " ""<left>
inoremap ' ''<left>

" Have to change this sometime for formatting. 
" so far !indent -kr % works well for C 
" inoremap == <space>==<space>
" inoremap != <space>!=<space>
" inoremap = <space>=<right><space>
inoremap , ,<space>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType c set tags+=~/.vim/systags 

let g:clang_complete_auto = 1
let g:clang_library_path = "/usr/lib/"
let g:clang_use_library = 1
let g:clang_auto_select = 1
