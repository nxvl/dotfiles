set nocompatible
set laststatus=2
set encoding=utf-8
set t_Co=256
filetype off

" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" vim +BundleInstall +qall

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'nvie/vim-flake8'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-powerline'

filetype plugin indent on

setlocal comments-=:#
setlocal comments+=f:#
set background=dark
syntax on
"set mouse=a
set bg=dark tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set hlsearch
set textwidth=79
set colorcolumn=80
set smartindent
set copyindent
set incsearch
set wildignore=*.swp,*.bak,*.pyc,*.class
set autoindent
set noswapfile
set fileencodings=utf-8,ucs-bom,default,latin1
"set cursorline
"set cursorcolumn
set showcmd
set hlsearch
set incsearch
set backspace=indent,eol,start
set ruler
set number
set scrolloff=5 "provide some context when scrolling

highlight SpecialKey ctermbg=yellow ctermfg=black guibg=red guifg=black
highlight ColorColumn ctermbg=DarkGrey
highlight LineNr ctermfg=Grey ctermbg=DarkGrey
set list
set listchars=trail:.,tab:>-,nbsp:%,extends:>,precedes:<

"filetype plugin indent on

autocmd FileType python set omnifunc=pythoncomplete#Complete

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

au BufRead /tmp/mutt-* set tw=80
" Mail colours
"hi mailHeaderKey  links to Type
"hi mailSubject    links to String
hi mailHeader     ctermfg=brown
"hi mailEmail      links to Special
hi mailSignature  ctermfg=darkblue
hi mailQuoted1    ctermfg=darkgreen
hi mailQuoted2    ctermfg=darkcyan
hi mailQuoted3    ctermfg=darkgreen
hi mailQuoted4    ctermfg=darkcyan
hi mailQuoted5    ctermfg=darkgreen
hi mailQuoted6    ctermfg=darkcyan

"nnoremap <F5> :GundoToggle<CR>
