set number	" Show line numbers
set linebreak	" Break lines at word (requires Wrap lines)
set showbreak=+++	" Wrap-broken line prefix
set textwidth=100	" Line wrap (number of cols)
set showmatch	" Highlight matching brace
set visualbell	" Use visual bell (no beeping)
set cmdheight=2
set encoding=utf-8
set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally
 
set autoindent	" Auto-indent new lines
set expandtab	" Use spaces instead of tabs
set shiftwidth=4	" Number of auto-indent spaces
set smartindent	" Enable smart-indent
set smarttab	" Enable smart-tabs
set softtabstop=4	" Number of spaces per Tab

set ruler	" Show row and column ruler infomation
 
set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour
set splitbelow
set splitright

nnoremap <leader>n :NERDTreeToggle
nnoremap <leader>q :Ack

colorscheme PaperColor

""" Customize colors - pmenu
func! s:my_colors_setup() abort
    " this is an example
    hi Pmenu guibg=#d7e5dc gui=NONE
    hi PmenuSel guibg=#b7c7b7 gui=NONE
    hi PmenuSbar guibg=#bcbcbc
    hi PmenuThumb guibg=#585858
endfunc

augroup colorscheme_coc_setup | au!
    au ColorScheme * call s:my_colors_setup()
augroup END

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

let g:coc_global_extensions = ['coc-elixir', 'coc-diagnostic']
let g:rainbow_active = 1

au ColorScheme * hi Normal ctermbg=none guibg=none
au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red

call plug#begin('~/.config/nvim/plugged')
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'itchyny/lightline.vim'
  Plug 'junegunn/fzf',                   { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'luochen1990/rainbow'
  Plug 'mileszs/ack.vim'
  Plug 'rafi/awesome-vim-colorschemes'
  Plug 'scrooloose/nerdtree',            { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }
  Plug 'sheerun/vim-polyglot'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-sensible'
  Plug 'vim-test/vim-test'
  Plug 'vim-test/vim-test'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'luochen1990/rainbow'
  Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}
call plug#end()

" ack.vim --- {{{

" Use ripgrep for searching ⚡️
" Options include:
" --vimgrep -> Needed to parse the rg response properly for ack.vim
" --type-not sql -> Avoid huge sql file dumps as it slows down the search
" --smart-case -> Search case insensitive if all lowercase pattern, Search case sensitively otherwise
let g:ackprg = 'rg --vimgrep --type-not sql --smart-case'

" Auto close the Quickfix list after pressing '<enter>' on a list item
let g:ack_autoclose = 1

" Any empty ack search will search for the work the cursor is on
let g:ack_use_cword_for_empty_search = 1

" Don't jump to first match
cnoreabbrev Ack Ack!

" Maps <leader>/ so we're ready to type the search keyword
nnoremap <Leader>/ :Ack!<Space>
" }}}

" Navigate quickfix list with ease
" nnoemap <silent> [q :cprevious<CR>
" nnoremap <silent> ]q :cnext<CR>r

" vim-test
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
