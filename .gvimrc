" Override or further specify some .vimrc settings

"colorscheme jellybeans
syntax on
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized
set cursorline						" highlight current line
set guifont=Monaco\ 7
set listchars=tab:•\ ,trail:·

" Lose the GUI stuff -- toolbars etc
set guioptions-=m
set guioptions-=T
