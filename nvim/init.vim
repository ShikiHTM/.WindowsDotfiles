call plug#begin()

Plug 'https://github.com/preservim/nerdtree' " File Manager
Plug 'https://github.com/sheerun/vim-polyglot' " Highlight
Plug 'nvim-lua/plenary.nvim'
Plug 'https://github.com/nvim-telescope/telescope.nvim' " File Finder
Plug 'https://github.com/BurntSushi/ripgrep'
Plug 'https://github.com/ryanoasis/vim-devicons' " Dev-Icons
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/vim-airline/vim-airline-themes'
Plug 'https://github.com/ayu-theme/ayu-vim' " Theme
Plug 'https://github.com/jiangmiao/auto-pairs' " Auto Bracket
Plug 'https://github.com/tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'release'} " Code intellisense
Plug 'https://github.com/yuezk/vim-js' " Javascript intellisense
Plug 'https://github.com/voldikss/vim-floaterm' " Terminal

call plug#end()

" General Configuration
set number
set mouse=a
set encoding=utf-8
set tabstop=4
set smarttab
set softtabstop=4
set autoindent
set shiftwidth=4
set nocompatible
set cursorline


" Theme config
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
let ayucolor="mirage"
colorscheme ayu
if(has("termguicolors"))
	set termguicolors
endif
syntax enable

" Enable copying to clipboard
if has('win32')
	set clipboard=unnamed
else
	set clipboard=unnamedplus
endif

" airline
let g:airline_section_b='%{strftime("%c")}'
let g:airline_section_y='%{&filetype}'
let g:airline_section_z='%p%%  %l:%L'
let g:airline_section_error = ''

let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#left_alt_sep = ' | '
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline#extensions#tabline#buffer_nr_show=1

let g:airline_dectect_spelllang=1
let g:airline_dectect_spell=1

" airline Keymap
nnoremap <silent> fc :bprevious<CR>
nnoremap <silent> f :bnext<CR>

" Airline Symbols
let g:airline_symbols = {}
let g:airline_powerline_fonts = 1

" telescope keyMap
nnoremap <silent>ff <cmd>Telescope find_files<CR>

" nerdTree
nnoremap <silent> <F5> :NERDTreeToggle<CR>

" AutoComplete keyMap
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <silent> <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

inoremap <silent><expr>Vinoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackSpace() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1] =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
	\ coc#pum#visible() ? coc#pum#next(1) :
	\ CheckBackSpace() ? "\<Tab>" :
	\ coc#refresh()

" Floaterm
nnoremap <silent>tt :FloatermNew<CR>
nnoremap <silent><C-t> :FloatermToggle<CR>

"disable autoComment in newline
autocmd FileType * setlocal formatoptions-=cro
