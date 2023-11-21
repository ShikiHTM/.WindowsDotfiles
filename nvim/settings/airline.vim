" airline
let g:airline_section_y='%{&filetype}'
let g:airline_section_z='%p%%  %l:%L'
let g:airline_section_error = ''
let g:airline_theme='ayu'

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
