" Unbind the cursor keys in insert, normal and visual modes.
"for prefix in ['i', 'n', 'v']
"  for key in ['<C-[>', '<Up>', '<Down>', '<Left>', '<Right>']
"    exe prefix . "noremap " . key . " <Nop>"
"  endfor
"endfor

" Remap escape to ctrl-c.
inoremap <C-c> <Esc><Esc>

" Toggle nerd tree
map <Leader>d :NERDTreeToggle<CR>

" Application Bindings
map <leader>s :w<CR>

" Tab Bindings
nmap <c-t>n :tabnew<CR>
nmap <c-t>x :tabclose<CR>

" Unite keybindings
nmap <c-x>b :Buffers<CR>
nmap <c-x>f :FZF<CR>
nmap <c-x><c-f> :cd ~/
nmap <c-x>a :Ag<space>

" Clear / search
nmap <Leader>/ :nohlsearch<CR>

" Center search result when searching
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" Backspace swap window with latest buffer
nnoremap <BS> <C-^>

" Fugitive Bindings
nnoremap <Leader>gb :.Gbrowse<CR>

" Tabularize Bindings
map <Leader>a :Tabularize /

" Terminal mode bindings
tnoremap <esc> <C-\><C-n>
tnoremap <C-o> <C-\><C-n>:q<CR>
nnoremap <C-s> :split<CR><C-w>j :term<CR>

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
