" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
set number
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'scrooloose/nerdtree' " 项目目录树
Plug 'morhetz/gruvbox'  " vim主题
Plug 'vim-airline/vim-airline'  " 窗口底部状态栏
Plug 'vim-airline/vim-airline-themes' " 窗口底部状态栏主题
" Initialize plugin system
call plug#end()

" ==============================
" NERDTree Config
autocmd vimenter * NERDTree

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" vim 打开时自动打开 NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" NERDTree 唯一窗口关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" 展示的键头
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" ==============================
" gruvbox Theme settings
set t_Co=256  " 开启256色 
set bg=dark  " 设置背景为dark
colorscheme gruvbox  " 设置主题

" ==============================
" AirLine Settings 窗口底部状态栏设置
let g:airline#extensions#tabline#enabled = 1  " 一个窗口多个选项卡
let g:airline#extensions#tabline#left_sep = ' '  " 左边的间隔标志
let g:airline#extensions#tabline#left_alt_sep = '|'  " 左边的警示间隔标志
let g:airline#extensions#tabline#formatter = 'default'

let g:airline_theme='dark'
" ==============================
" The Keyboard Map

map <C-n> :NERDTreeToggle<CR>
nmap <C-s> :w <CR>
imap <C-s> <Esc> :w <CR>