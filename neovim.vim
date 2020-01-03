set nocompatible

" Plugins
call plug#begin('~/.config/nvim/bundle')

Plug 'rust-lang/rust.vim'
Plug 'ron-rs/ron.vim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'HerringtonDarkholme/yats.vim'
Plug 'benmills/vimux'
Plug 'janko-m/vim-test'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'cespare/vim-toml'
Plug 'flazz/vim-colorschemes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'elixir-editors/vim-elixir'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'kchmck/vim-coffee-script'
Plug 'vim-ruby/vim-ruby', { 'for': ['ruby', 'haml', 'eruby'] }
Plug 'neomake/neomake'
Plug 'benjie/local-npm-bin.vim'
Plug 'rizzatti/dash.vim'
Plug 'slim-template/vim-slim'
Plug 'RRethy/vim-illuminate'
Plug 'jacoborus/tender.vim'
Plug 'elmcast/elm-vim'
Plug 'pbogut/deoplete-elm'
Plug 'rhysd/vim-crystal'
Plug 'rlue/vim-fold-rspec'
Plug 'tpope/vim-rails'
Plug 'justinj/vim-pico8-syntax'

call plug#end()

" rust-lang/rust.vim
let g:autofmt_autosave = 1

" elm
let g:elm_format_autosave = 1

" LanguageClient-neovim
" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['typescript-language-server', '--stdio'],
    \ 'javascript.jsx': ['typescript-language-server', '--stdio'],
    \ 'elixir': ['elixir-ls'],
    \ 'lua': ['java', '-cp', '/Users/taylor/.config/nvim/EmmyLua-LS-all.jar', 'com.tang.vscode.MainKt'],
    \ 'ruby': ['/Users/taylor/.rbenv/shims/solargraph', 'stdio'],
    \ 'crystal': ['/Users/taylor/dev/thirdparty/scry/bin/scry'],
    \ }

let g:LanguageClient_autoStart = 1

" Hybrid Line numbers
set number
set relativenumber

" Theme
silent! colorscheme smyck
hi Folded cterm=none ctermbg=0 ctermfg=6 gui=none guibg=#8F8F8F guifg=#C4E858

set nowrap
set showmatch
set splitbelow
set splitright
au WinEnter * set cursorline
au WinLeave * set nocursorline nocursorcolumn
hi Comment cterm=italic
hi htmlArg cterm=italic
hi Type cterm=italic

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
let g:airline_theme='term'

" FZF
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_buffers_jump = 1

" Deoplete
let g:deoplete#enable_at_startup=1
let g:deoplete#sources#rust#racer_binary='/Users/taylor/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/Users/taylor/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src/'
let g:deoplete#sources#rust#show_duplicates=1

" Neomake
call neomake#configure#automake('nw', 500)

" Illuminate
let g:Illuminate_ftblacklist = ['nerdtree']

" Test
let test#strategy = 'vimux'
nnoremap <silent> <leader>rf :wa<CR>:TestNearest<CR>
nnoremap <silent> <leader>rb :wa<CR>:TestFile<CR>
nnoremap <silent> <leader>ra :wa<CR>:TestSuite<CR>
nnoremap <silent> <leader>rl :wa<CR>:TestLast<CR>

" Grep
function! GitGrepWord()
  cgetexpr system("git grep -n '" . expand("<cword>") . "'")
  cwin
  echo 'Number of matches: ' . len(getqflist())
endfunction
command! -nargs=0 GitGrepWord :call GitGrepWord()
nnoremap <silent> <Leader>gw :GitGrepWord<CR>

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
nnoremap <C-W>z <C-W>\|<C-W>_
