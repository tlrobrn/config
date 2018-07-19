set nocompatible

" Plugins
call plug#begin('~/.config/nvim/bundle')

Plug 'rust-lang/rust.vim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'benmills/vimux'
Plug 'janko-m/vim-test'
Plug 'bling/vim-airline'
Plug 'cespare/vim-toml'
Plug 'flazz/vim-colorschemes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'pangloss/vim-javascript'
Plug 'vim-ruby/vim-ruby', { 'for': ['ruby', 'haml', 'eruby'] }
Plug 'neomake/neomake'
Plug 'rizzatti/dash.vim'
Plug 'slim-template/vim-slim'

call plug#end()

" rust-lang/rust.vim
let g:autofmt_autosave = 1

" LanguageClient-neovim
" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'javascript': ['javascript-typescript-stdio', '--strict'],
    \ 'javascript.jsx': ['javascript-typescript-stdio', '--strict'],
    \ }

let g:LanguageClient_autoStart = 1

" Customizations
set number " Line numbers
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

" Deoplete
let g:deoplete#enable_at_startup=1
let g:deoplete#sources#rust#racer_binary='/Users/taylor/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/Users/taylor/.rustup/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src'
let g:deoplete#sources#rust#show_duplicates=1

" Neomake
call neomake#configure#automake('nw', 750)

" Test
let test#strategy = 'vimux'
nnoremap <silent> <leader>rf :wa<CR>:TestNearest<CR>
nnoremap <silent> <leader>rb :wa<CR>:TestFile<CR>
nnoremap <silent> <leader>ra :wa<CR>:TestSuite<CR>
nnoremap <silent> <leader>rl :wa<CR>:TestLast<CR>

" Key bindings
inoremap <silent>jk <ESC>
noremap <silent> <LocalLeader>nt :NERDTreeToggle<CR>
noremap <silent> <LocalLeader>nf :NERDTreeFind<CR>
noremap <silent> <LocalLeader>ff :Files<CR>
noremap <silent> <LocalLeader>gf :GFiles<CR>
noremap <silent> <LocalLeader>be :Buffers<CR>
nnoremap <silent> H :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> R :call LanguageClient_textDocument_rename()<CR>
