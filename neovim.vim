set nocompatible

" Plugins
call plug#begin('~/.config/nvim/bundle')

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'chr4/nginx.vim'
Plug 'rust-lang/rust.vim'
Plug 'ron-rs/ron.vim'
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
Plug 'rhysd/vim-crystal'
Plug 'rlue/vim-fold-rspec'
Plug 'tpope/vim-rails'
Plug 'justinj/vim-pico8-syntax'
Plug 'lluchs/vim-wren'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'JuliaEditorSupport/julia-vim'

call plug#end()

" rust-lang/rust.vim
let g:autofmt_autosave = 1

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


" Neomake
call neomake#configure#automake('nrwi', 500)
let g:neomake_javascript_enabled_makers = ['eslint']

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
nnoremap <C-W>z <C-W>\|<C-W>_
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

set hidden

command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
