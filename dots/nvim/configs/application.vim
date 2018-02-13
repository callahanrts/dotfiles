
" --------------------------------------------------
" Vim Application Settings"
" --------------------------------------------------
set nocompatible                    " Be iMproved
filetype off                        " required!
set number                          " Set line numbers
" Automatic in neovim
" syntax on                         " Turn on Syntax Highlighting
set autoread                        " Automatically reload changes if detected
set ruler                           " Location in status line
set laststatus=2                    " Always display the status line
set scrolloff=3                     " Keep 3 lines below and above the cursor
set noshowmode                      " Don't show default insert (handled by lightline)
set foldmethod=marker               " Use markers for folding
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1 " Enable different cursor shapes
set undofile                        " Maintain undo history between sessions
set undodir=~/.nvim/undodir         " Set directory for undo files
let mapleader=" "                   " Change leader key to space

if has('unix')
  set clipboard=unnamedplus           " Share clipboard with os x
else
  set clipboard=unnamed               " Share clipboard with os x
endif

" Automatically resize splits to equal sizes when vim is resized
autocmd VimResized * wincmd =

if !has('gui_running')
  set encoding=utf8 " This can't be set after start up
endif

" --------------------------------------------------
" Turn Off Noisy Shit
" --------------------------------------------------
set visualbell
set t_vb="
set re=1

" --------------------------------------------------
" Word Wrap Configs
" --------------------------------------------------
set nowrap                              " Enable "visual" wrapping (nowrap turns off text wrapping)
" set textwidth=0 wrapmargin=0          " Turn off physical line wrapping (ie: automatic insertion of newlines)

" --------------------------------------------------
" Whitespace Settings
" --------------------------------------------------
set tabstop=2                         " Number of visual spaces per tab
set shiftwidth=2                      "
set softtabstop=2                     " Number of spaces in tab when editing
set expandtab                         " Convert all tabs to spaces
set list listchars=tab:\ \ ,trail:·   " Show trailing whitespace
set fileformats+=dos                  " Stop EOLs from complicating diffs
autocmd BufWritePre * :%s/\s\+$//e    " Remove trailing whitespace on save

" --------------------------------------------------
" Searching
" --------------------------------------------------
set hlsearch                          " Highlight all matching search pattern
set incsearch                         " Show results as you're typing
set ignorecase
set smartcase

" --------------------------------------------------
" Set filetype for odd file extensions
" --------------------------------------------------
au BufRead,BufNewFile *.coffee    set filetype=coffee " associate *.js.coffee with coffee filetype
au BufNewFile,BufReadPost *.jade  set filetype=jade
au BufNewFile,BufReadPost *.styl  set filetype=stylus
au BufRead,BufNewFile *.go set filetype=go
autocmd FileType go setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd BufRead,BufNewFile *.es6 *.es setfiletype javascript

" -----------------------------------------------------
" Change backup directory so git doesn't get cluttered
" -----------------------------------------------------
silent !mkdir ~/.nvim/backup > /dev/null 2>&1
set backupdir=~/.nvim/backup

