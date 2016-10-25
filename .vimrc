" Author : Benoît Bar - http://benoitbar.fr

" Cancel the compatibility with Vi. Essential if you want to enjoy the features of Vim
set nocompatible

" -- Vundle initialization
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'             " Let Vundle manage Vundle
Plugin 'vim-airline/vim-airline'          " Statusline
Plugin 'vim-airline/vim-airline-themes'   " Statusline themes
Plugin 'sjbach/lusty'                     " Lusty explorer
Plugin 'mileszs/ack.vim'                  " Ack grep
Plugin 'kien/ctrlp.vim'                   " CtrlP
Plugin 'scrooloose/syntastic'             " Syntax checking
Plugin 'tpope/vim-fugitive'               " Git integration

call vundle#end()

" -- Display
set title                 " Update the title of your window or your terminal
set number                " Display line numbers
set ruler                 " Display cursor position
set nowrap                " Do not wrap too long lines
set tabstop=2             " Make tabs as wide two spaces
set softtabstop=2         " A soft-tab of two spaces
set expandtab             " Hitting Tab in insert mode will produce the appropriate number of spaces
set scrolloff=3           " Display at least 3 lines around you cursor (for scrolling)
" Show invisible characters
set lcs=tab:▸\ ,trail:·,nbsp:_
set list

" -- Search
set ignorecase            " Ignore case when searching
set smartcase             " If there is an uppercase in your search term search case sensitive again
set incsearch             " Highlight search results when typing
set hlsearch              " Highlight search results

" -- Beep
set visualbell            " Prevent Vim from beeping
set noerrorbells          " Prevent Vim from beeping

" Backspace behaves as expected
set backspace=indent,eol,start

" No swap file
set noswapfile

" Disable backup files
set nobackup

" Hide buffer (file) instead of abandoning when switching to another buffer
set hidden

" Enable syntax highlighting
syntax enable

" Enable file specific behavior like syntax highlighting and indentation
filetype on
filetype plugin on
filetype indent on

" Change the font
set guifont=Hack\ 11
set antialias

let mapleader=","

" Go to right buffers
nmap <leader>n :bn<CR>

" Go to left buffer
nmap <leader>b :bp<CR>

" Save current buffer
nmap <C-s> :write<CR>

" Close current buffer
nmap <C-q> :bd<CR>

" -- airline
set laststatus=2                                  " Always display the statusline in all windows
set noshowmode                                    " Hide the default mode text (e.g. -- INSERT -- below the statusline)
let g:airline#extensions#tabline#enabled=1        " Always display the tabline, even if there is only one tab
let g:airline_powerline_fonts=1                   " Use powerline symbols
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

" -- ack-grep
let g:ackprg="ack -H --nocolor --nogroup --column"
nmap <leader>j mA:Ack<space>                            " Add a marker and search
nmap <leader>ja mA:Ack "<C-r>=expand("<cword>")<cr>"    " Add a marker and search word under cursor
nmap <leader>jA mA:Ack "<C-r>=expand("<cWORD>")<cr>"    " Add a marker and search word under cursor

" -- ctrlp
let g:ctrlp_map = "<leader>c"
set wildignore+=*/tmp/*,*/node_modules/*,*/dist/*,*.swp,*.zip,*.pyc,*.pyo

" -- syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint', 'flow']
let g:syntastic_javascript_flow_exe = 'flow'

" -- fugitive
set statusline+=%{fugitive#statusline()}

