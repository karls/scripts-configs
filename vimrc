set nocompatible

if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
  set fileencoding=utf8
endif


call pathogen#infect()



set autoindent            " automatic indentation
set hlsearch              " highlight search
set incsearch             " incremental search
set ignorecase            " ignore case
set ruler                 " ruler to show current location

"set showmatch            " show matching braces
set shiftwidth=2
set tabstop=2             " tab size = 2 spaces
"set expandtab

set relativenumber        " show line numbers
"set nu        " show line numbers

syntax on                 " show syntax higlight
"instead of set mouse=a, we do set mouse=v, a recent change

set mouse=a

"set guifont=Terminus\ 8
set list
"set listchars=tab:⌞\ ,trail:·
set listchars=tab:∟\ ,trail:·
"colorscheme default
colorscheme Tomorrow-Night-Bright
"colorscheme jellybeans
"set background=dark
"set cursorline            " show line highlight

""Fix the stupid auto-indentation deletion
inoremap <CR> <CR><Space><BS>
nnoremap o o<Space><BS>
nnoremap O O<Space><BS>

"Highlight Long lines (>80chrs):
:let w:m1=matchadd('Search', '\%<81v.\%>77v', -1)
:let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)

set nobackup
set noswapfile
set nowritebackup

"set tw=80                " auto-wrap long lines

nmap <F3> <C-R>=strftime("%d/%m/%Y")<CR><Esc>
imap <F3> <C-R>=strftime("%d/%m/%Y")<CR>

filetype plugin indent on

set ofu=syntaxcomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete

set statusline=%<\ %n:%f\ %y%{fugitive#statusline()}%m%r%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
set laststatus=2
