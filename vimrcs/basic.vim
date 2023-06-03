"""""""""""""""""""""""""""""""""""""""""""
" => vundle
"""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --no-bash' }
Plug 'junegunn/fzf.vim'

Plug 'majutsushi/tagbar'

Plug 'bling/vim-airline'
Plug 'luochen1990/rainbow'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'rking/ag.vim'
Plug 'raimondi/delimitmate'
Plug 'bronson/vim-trailing-whitespace'
Plug 'junegunn/vim-easy-align'
Plug 'chiel92/vim-autoformat'

Plug 'nordtheme/vim'

let g:rainbow_active = 1
let g:airline_powerline_fonts = 1

call plug#end()
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""
" => misc
"""""""""""""""""""""""""""""""""""""""""""

" set font according to system
set gfn=Fira\ Mono\ 14,IBM\ Plex\ Mono\ 14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11

" set relative number
set relativenumber

" make source code looks more colorfull, it will call <filetype on>
syntax on

" list number at the left side
set number

" highlight current-selected line
set cursorline
hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkgreen guifg=white

" highlight key words to be searched
set hlsearch

" highlight instantly
set incsearch

" set ctags path, it's default, in case modify it
set tags=./tags,tags

" incase can't delete in INSERT modee
set backspace=indent,eol,start

" set tab as 2 space, `:retab` to work on current buffer
set tabstop=2 softtabstop=0 expandtab shiftwidth=2

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source ./.vimrc

" leader is comma
let mapleader=","

" turn off search highlight, instead of `:nohlsearch`
nnoremap <leader><space> :nohlsearch<CR>

" fast saving
nmap <leader>w :w!<cr>

" 80th-column if you write code
if (exists('+colorcolumn'))
  set colorcolumn=80
  highlight ColorColumn ctermbg=9
endif

" colorscheme
colorscheme nord

"""""""""""""""""""""""""""""""""""""""""""
" => fzf
"""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.fzf

nmap <leader>f :GFiles<CR>
nmap <silent><C-P> :History<CR>
nmap <leader>d :Rg <space>
nmap <leader>rg :Rg  <C-R><C-W><CR>

"""""""""""""""""""""""""""""""""""""""""""
" => tagbar
"""""""""""""""""""""""""""""""""""""""""""
autocmd VimEnter * nested :TagbarOpen
set updatetime=200
autocmd VimEnter * nested :call tagbar#autoopen(1)
autocmd BufEnter * nested :call tagbar#autoopen(0)
nmap <F8> :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""
" => ctags
"""""""""""""""""""""""""""""""""""""""""""
" do `ctags -R *` to generate `tags`
map <silent> <F4> :!ctags -R<CR>    " press F4 to re-build ctags

"""""""""""""""""""""""""""""""""""""""""""
" => cscope
"""""""""""""""""""""""""""""""""""""""""""
" do `cscope -Rbkq` to generate `cscope.out`
if filereadable("cscope.out")
  "cs add cscope.out
endif

"""""""""""""""""""""""""""""""""""""""""""
" => EasyAlign
"""""""""""""""""""""""""""""""""""""""""""
vnoremap <silent> <Enter> :EasyAlign<cr>

"""""""""""""""""""""""""""""""""""""""""""
" => vim-fugitive
""""""""""""""""""""""""""""""""""""""""""
nmap <leader>gs :G<CR>
nmap <leader>gd :G diff<CR>
nmap <leader>gl :G log<CR>
