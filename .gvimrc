set nocompatible					" ignore Vi compatibility
if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
    set fileencodings=utf-8,latin1
endif
set autoindent						" automatic indentation
set hlsearch							" highlight search
set incsearch							" incremental search
set ignorecase						" ignore case
set ruler									" ruler to show current location

"set showmatch							" show matching braces
set shiftwidth=2
set tabstop=2							" tab size = 4 spaces
set nu										" show line numbers
syntax on									" show syntax higlightk

colorscheme jellybeans
"colorscheme molokai
"colorscheme desert
set cursorline						" highlight current line
set background=dark

"set guifont=Terminus\ 8
set guifont=Monaco\ 7
"set guifont=Monospace\ 7

set list
set listchars=tab:•\ ,trail:· 
"set co=90
"set lines=101

"Fix the stupid auto-indentation deletion
inoremap <CR> <CR><Space><BS>
nnoremap o o<Space><BS>
nnoremap O O<Space><BS>

"Highlight Long lines (>80chrs):
let w:m1=matchadd('Search', '\%<81v.\%>77v', -1)
let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)

set nobackup
set noswapfile
set nowritebackup
set guioptions-=m
set guioptions-=T

"set tw=80									" auto-wrap long lines
