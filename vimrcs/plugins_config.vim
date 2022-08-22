    call plug#begin('~/.vim/plugged')

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " => vim-plug
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    Plug 'morhetz/gruvbox', 
    Plug 'vim-airline/vim-airline'
    Plug 'preservim/nerdtree' |
        \ Plug 'Xuyuanp/nerdtree-git-plugin' |
        \  Plug 'ryanoasis/vim-devicons'
    Plug 'luochen1990/rainbow'

    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --no-bash' }
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-commentary' 
    Plug 'tpope/vim-repeat' 
    Plug 'tpope/vim-surround' 
    Plug 'airblade/vim-gitgutter'
    Plug 'sheerun/vim-polyglot'
    Plug 'godlygeek/tabular'
    Plug 'Raimondi/delimitMate'

    " => Syntax plugins 
    Plug 'nvie/vim-flake8'
    Plug 'pangloss/vim-javascript'
    Plug 'plasticboy/vim-markdown'
    Plug 'maxmellon/vim-jsx-pretty'
    Plug 'Vimjas/vim-python-pep8-indent'
    Plug 'kergoth/vim-bitbake'
    Plug 'rhysd/vim-clang-format'
    Plug 'rust-lang/rust.vim'

    let g:rainbow_active = 1 
    let g:airline_powerline_fonts = 1
    let g:clang_format#code_style = 'Webkit'

    call plug#end()


    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " => fzf
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    set rtp+=~/.fzf

    nnoremap <expr><leader>f (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"
    nmap <silent><C-P> :History<CR>
    nmap <leader>d :Rg <space>


    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " => Vim grep
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
    set grepprg=/bin/grep\ -nH


    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " => Nerd Tree
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    let g:NERDTreeWinPos = "right"
    let NERDTreeShowHidden=0
    let NERDTreeIgnore = ['\.pyc$', '__pycache__']
    let g:NERDTreeWinSize=35
    map <leader>nn :NERDTreeToggle<cr>
    map <leader>nb :NERDTreeFromBookmark<Space>
    map <leader>nf :NERDTreeFind<cr>


    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " => surround.vim config
    " Annotate strings with gettext 
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    vmap Si S(i_<esc>f)
    au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>


    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " => Git gutter (Git diff)
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    let g:gitgutter_enabled=1


    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " => vim-fugitive
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    nmap <leader>gs :G<CR>
    nmap <leader>gd :G diff<CR>
    nmap <leader>gl :G log<CR>
    nmap <leader>gp :G grep \(<c-r>=expand("<cword>")<cr>\)<CR>


    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " => Gruvbox colorscheme 
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    colorscheme gruvbox
    set background=dark
    autocmd VimEnter * hi Normal ctermbg=none

