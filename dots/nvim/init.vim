" ==============================================================================================
" VIMRC Configurations
" ==============================================================================================

" Set application settings for neovim
source ~/.config/nvim/configs/application.vim

" Packages that should be managed by neovim Plugged
source ~/.config/nvim/configs/packages.vim

" Source all package configurations
for f in split(glob('~/.config/nvim/configs/plugins/*.vim'), '\n')
  exe 'source' f
endfor

" Include functions
" source ~/.config/nvim/configs/functions.vim

" Include keybindings
source ~/.config/nvim/configs/keybindings.vim

" Include neovim gui settings
source ~/.config/nvim/configs/gui.vim

