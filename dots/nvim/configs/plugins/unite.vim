
" --------------------------------------------------
" Unite config
" --------------------------------------------------

" Fuzzy search stuff
" Matches too much shit
" call unite#filters#matcher_default#use(['matcher_fuzzy'])

let g:unite_source_rec_async_command='ag --nogroup --hidden -g ""'

" Exclude some directories from unite
let g:unite_source_grep_default_opts = "-iRHn"
  \ . " --exclude='*.svn*'"
  \ . " --exclude='*.svn*'"
  \ . " --exclude='*.log*'"
  \ . " --exclude='*tmp*'"
  \ . " --exclude-dir='**/tmp'"
  \ . " --exclude-dir='CVS'"
  \ . " --exclude-dir='.svn'"
  \ . " --exclude-dir='.git'"
  \ . " --exclude-dir='node_modules'"
