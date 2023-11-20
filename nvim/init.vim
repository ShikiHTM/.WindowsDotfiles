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

" telescope keyMap
nnoremap <silent>ff <cmd>Telescope find_files<CR>

" nerdTree
nnoremap <silent> <F5> :NERDTreeToggle<CR>

" Floaterm
nnoremap <silent>tt :FloatermNew<CR>
nnoremap <silent><C-t> :FloatermToggle<CR>

"disable autoComment in newline
autocmd FileType * setlocal formatoptions-=cro

for setting_file in split(glob(stdpath('config').'/settings/*.vim'))
	execute 'source' setting_file
endfor
