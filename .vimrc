".vimrc settings for somak

"auto reloading of vimrc file
autocmd! bufwritepost .vimrc source %

"Better copy paste from clipboard
set pastetoggle=<F2>
set clipboard=unnamed

"Mouse and backspace
set mouse=a "on OSX use Alt + click
set bs=2 "backspace behaves as usual
set hidden "hide buffer header when abandoned
set encoding=utf-8
set path+=** "provides tab complete for filenames
set wildmenu

"remap leader key
let mapleader = ","

" easy moving between tabs (buffers)
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>
map <Leader>c <esc>:bd<CR>

" easy moving around in the window
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l
map <c-g> <c-w>w

" NERDTree specific mappings
map <F3> :NERDTreeToggle<CR>

" assign sort function to a key
vnoremap <Leader>s :sort<CR>

" code block indentation
vnoremap < <gv 
vnoremap > >gv

" Show whitespace
" Must be inserted BEFORE the colorscheme statement
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Color scheme
set t_Co=256
color vividchalk 

" enable syntax highlighting
filetype off
filetype plugin indent on
syntax on

" Showing line numbers and lengths
set number "show line numbers
set tw=79 "sets max width to 80 column
set wrap " word wrap at file load
set linebreak " does a soft wrap line break
set nolist
set fo-=t "prevents wrapping during typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

" History and undo levels
set history=700
set undolevels=700

"Python indent settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Pathogen initialization
call pathogen#infect()

"-------------------------------
" Python IDE features
" -----------------------------
"
let python_highlight_all=1

"  vim-airline settings
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='cool'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" vim simplyfold plugin
"autocmd BufWinEnter *py setlocal foldexpr=SimpylFold(v:num) foldmethod=expr
"autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<
nnoremap <space> za
let g:SimpylFold_docstring_preview=1

"autocomplete customization
"ycm installation instructions
"git clone https://github.com/Valloric/YouCompleteMe.git to ~/.vim/bundle
"git submodule update --init --recursive inside YouCompleteMe directory
"if CMake is missing install it using apt-get
"run ./install.py
let g:ycm_autoclose_preview_window_after_completion=1

" Syntastic configurations
set statusline+=%#Warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq = 1

