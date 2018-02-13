
" PLUGGED STUFF
call plug#begin('~/.nvim/plugged')

Plug 'Raimondi/delimitMate'                   " Bracket completion
Plug 'airblade/vim-gitgutter'                 " See git status in the gutter
Plug 'Shougo/unite.vim'                       " Grep replacement simmilar to fuzzyfinder, ctrl+p or ku
  Plug 'Shougo/vimproc.vim', { 'do': 'make' } " Unite uses this for searching asynchronously
Plug 'scrooloose/nerdtree'                    " Nice directory view
Plug 'tpope/vim-surround'                     " Surrounding text with stuff
Plug 'gorkunov/smartpairs.vim'                " Select pairs of things (eg. vi', vi<)
Plug 'suan/vim-instant-markdown'              " Realtime markdown editing
Plug 'tpope/vim-fugitive'                     " Github shit
Plug 'godlygeek/tabular'                      " Align text
Plug 'vim-scripts/repeat.vim'                 " Repeat plugin commands (not just native) using .
Plug 'vim-scripts/AdvancedSorters'            " Sort functions/paragraphs/visual blocks/etc
  Plug 'vim-scripts/ingo-library'             " AdvancedSorters requires it
Plug 'majutsushi/tagbar'                      " Visual representation of classes
Plug 'SirVer/ultisnips'                       " Snippets
  Plug 'honza/vim-snippets'                   " Snippets are separated from the engine.
Plug 'vimwiki/vimwiki'                        " VimWiki
Plug 'tpope/vim-vinegar'                      " Additions to netrw
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'                       " Fuzzy search
Plug 'benekastah/neomake'                     " Syntax checking
                                              " Plug 'Shougo/deoplete.nvim'
Plug 'Valloric/YouCompleteMe'                 " Tab completion engine
  Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'ternjs/tern_for_vim'                    " Javascript code analysis
Plug 'tpope/vim-commentary'                   " Comment stuff
Plug 'metakirby5/codi.vim'                    " Interactive scratchpad
Plug 'itchyny/calendar.vim'                   " Calendar

" Plug 'terryma/vim-multiple-cursors'           " Multiple cursors

" Plug 'jistr/vim-nerdtree-tabs'                         " Keep one nerdtree over all tabs
" Plug 'scrooloose/syntastic'                            " Syntax Checking for vim

" For looks
Plug 'itchyny/lightline.vim'

" Language Support
Plug 'vim-ruby/vim-ruby',          { 'for': 'rb' }
Plug 'cakebaker/scss-syntax.vim',  { 'for': 'scss' }
Plug 'JulesWang/css.vim',          { 'for': 'css' }
Plug 'kchmck/vim-coffee-script',   { 'for': 'coffee' }
Plug 'tpope/vim-haml',             { 'for': 'haml' }
Plug 'pangloss/vim-javascript',    { 'for': 'js' }
Plug 'fatih/vim-go',               { 'for': 'go' }
Plug 'vim-scripts/lua.vim',        { 'for': 'lua' }
Plug 'digitaltoad/vim-pug',        { 'for': 'pug' }
  Plug 'vim-scripts/vim-misc'
Plug 'leafgarland/typescript-vim'
" Plug 'lambdatoast/elm.vim'
Plug 'ElmCast/elm-vim'

" From vimcolors.com
Plug 'jonathanfilip/vim-lucius'

call plug#end()
