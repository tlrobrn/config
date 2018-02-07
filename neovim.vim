set nocompatible

" Plugins
filetype off
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

Plugin 'Chiel92/vim-autoformat'
Plugin 'Shougo/deoplete.nvim'
Plugin 'benmills/vimux'
Plugin 'bling/vim-airline'
Plugin 'cespare/vim-toml'
Plugin 'chordpro.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'elixir-lang/vim-elixir'
Plugin 'flazz/vim-colorschemes'
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'lambdatoast/elm.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'sebastianmarkow/deoplete-rust'
Plugin 'slashmili/alchemist.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'xolox/vim-lua-ftplugin'
Plugin 'xolox/vim-misc'
Plugin 'w0rp/ale'

call vundle#end()
filetype plugin indent on

" Customizations
set hidden " Background buffers w/o saving
set number " Line numbers
syntax enable " Syntax highlighting
silent! colorscheme smyck
set nowrap
set showmatch
set splitbelow
set splitright
set cursorline

" Tab / Indentation
set backspace=indent,eol,start
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent
set cindent
set cinoptions=:s,ps,ts,cs
set cinwords=if,else,while,do,for,switch,case

" Search
set hlsearch
set ignorecase
set smartcase
set incsearch

" Airline
set laststatus=2
set ruler
set showcmd
let g:airline_powerline_fonts=1
let g:airline#extensions#ale#enabled = 1

" Rust
let g:rustfmt_autosave=1

" Deoplete
let g:deoplete#enable_at_atartup=1
let g:deoplete#sources#rust#racer_binary='/Users/tayobrien/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/Users/tayobrien/dev/thirdparty/rust/src'
let g:deoplete#sources#rust#show_duplicates=1

" Key bindings
inoremap <silent>jk <ESC>
noremap <silent> <LocalLeader>nt :NERDTreeToggle<CR>
noremap <silent> <LocalLeader>nf :NERDTreeFind<CR>
noremap <silent> <LocalLeader>ff :CtrlP<CR>
noremap <silent> <LocalLeader>be :CtrlPBuffer<CR>
noremap <silent> <LocalLeader>lo :!/Applications/love.app/Contents/MacOS/love .<CR>
