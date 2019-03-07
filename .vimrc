set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


Plugin 'VundleVim/Vundle.vim'

"Tree structure in vim
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Valloric/YouCompleteMe'
Plugin 'bfrg/vim-cpp-modern'
Plugin 'wellle/visual-split.vim'
Plugin 'kana/vim-operator-user'
Plugin 'rhysd/vim-clang-format'
Plugin 'morhetz/gruvbox'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-repeat'

Plugin 'ervandew/supertab'
"Latex plugin
Plugin 'lervag/vimtex' 
Plugin 'junegunn/goyo.vim'
Plugin 'w0rp/ale'
" Debugger
Plugin 'vim-scripts/Conque-GDB'
Plugin 'godlygeek/tabular'
" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Always load this last
Plugin 'ryanoasis/vim-devicons'


call vundle#end()
filetype plugin indent on

let mapleader=","
let maplocalleader = ","

colorscheme gruvbox
set background=dark


set noswapfile
set nobackup
set nowb


set incsearch
set hlsearch
set ignorecase
set smartcase


syntax enable

map <C-n> :NERDTreeToggle<CR>"
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore = ['\.pyc$']

let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
let g:airline_powerline_fonts = 1
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 11
set encoding=utf-8
set mouse=a
"set tabstop=4
set number

map <leader>b ysiw
map <C-x> :ClangFormat
nmap <F3> :YcmCompleter GoTo <CR>
nmap <F2> :YcmCompleter GetDoc  <CR>

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <F9> :nohl<CR><F9>\


nnoremap <silent> <F12> :Goyo<CR>


set wmh=0
" Remap changing windows
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-H> <C-W>h<C-W>_
map <C-L> <C-W>l<C-W>_



"set shiftwidth=4
"set softtabstop=4
"set expandtab

" Python check snytax and run
autocmd BufRead *.py set tabstop=4
autocmd BufRead *.py set nowrap
autocmd BufRead *.py set go+=b
autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
autocmd BufRead *.py nmap <F5> :!python %<CR>

" Command for auto formating of c and c++ code (google styleguide) using astyle
fun! FormatCpp() "{{{
	if executable( "astyle" )
		echo "Formating File" expand('%')
		!astyle --style=google -n %
	endif
endfunction "}}}

autocmd FileType c,cpp command! GoogleFormat call FormatCpp()

let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_fold_enabled = 1

let g:tex_flavor = "latex"
let g:tex_fast = "cmMprs"
let g:tex_conceal = ""
let g:tex_fold_enabled = 0
let g:tex_comment_nospell = 1

autocmd FileType tex nmap <buffer> <C-T> :!latexmk -pdf %<CR>

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

let g:vimtex_latexmk_continuous = 1
let g:vimtex_latexmk_callback_hooks = ['SingleShotWithCallback']
function! SingleShotWithCallback(status)
	silent call vimtex#latexmk#stop()
endfunction 
