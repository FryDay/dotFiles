call plug#begin("~/.vim/plugged")
    " Plugin Section
    Plug 'scrooloose/nerdtree'
    Plug 'ryanoasis/vim-devicons'
call plug#end()

"Config Section
filetype plugin indent on
syntax on
set background=dark
set clipboard=unnamedplus
set completeopt
set hidden
set inccommand=split
set mouse=a
set number
set splitbelow splitright
set tabstop=4
set title
set ttimeoutlen=0
set shiftwidth=4
set expandtab
set wildmenu

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>
