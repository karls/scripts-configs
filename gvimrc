" Override or further specify some .vimrc settings

"colorscheme jellybeans
syntax on
set background=dark
set relativenumber
"let g:solarized_termtrans=1
"let g:solarized_termcolors=256
"let g:solarized_contrast="high"
"let g:solarized_visibility="high"
colorscheme jellybeans
"colorscheme vilight
set cursorline						" highlight current line
set guifont=Monaco\ 7
set listchars=tab:⌞\ ,trail:·
set mouse=a
"set listchars=tab:∟\ ,trail:·
"set listchars=tab:•\ ,trail:·

" Lose the GUI stuff -- toolbars etc, make tabs not use GTK
set guioptions-=m
set guioptions-=T
set guioptions-=e
