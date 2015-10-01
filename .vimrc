set nocompatible                    " be iMproved, required
filetype off                        " required
let $PATH = $HOME.'/.vim/bin:'.$PATH

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'craigemery/vim-autotag'
Plugin 'shawncplus/phpcomplete.vim'

call vundle#end()                   " required
filetype plugin indent on           " required

" Colors & Fonts
syntax enable
set background=light
set t_Co=256
colorscheme macvim
set guifont=Perfect\ DOS\ VGA\ 437\ Win:h16
set noantialias

" General editor settings
set encoding=utf-8                  " set encoding to utf-8
set backspace=indent,eol,start
syntax on
set noswapfile
set nowrap
set number
set exrc                            " allow project specific vimrc
let mapleader = ","

" Disable keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Invisibles
if v:version >= 74
    set listchars=tab:»\ ,space:·   " show invisibles
endif
set list


" Trailing whitespace
match Error /\s\+$/                 " match trailing whitespace
if has("autocmd")
    fun! <SID>StripTrailingWhitespaces()
        let l = line(".")
        let c = col(".")
        %s/\s\+$//e
        call cursor(l, c)
    endfun
    autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
endif

" Tab formatting
set ts=4 sts=4 sw=4 expandtab       " set tabs to 4 spaces by default
if has("autocmd")
    "override tabs for certain filetypes
    "autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
endif

" Tagbar
nmap <F8> :TagbarToggle<CR>

" PHPQA
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_php_phpcs_args="--report=csv --standard=PHPCS"

" NERDTree
map <Leader>t :NERDTreeToggle<CR>
let g:NERDTreeDirArrows = 0
let g:NERDTreeDirArrowExpandable = '»'
let g:NERDTreeDirArrowCollapsible = '«'


