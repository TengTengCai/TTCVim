" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
let g:python_host_prog = '/Users/tianjun/.pyenv/versions/2.7.15/bin/python'
let g:python3_host_prog = '/Users/tianjun/.pyenv/versions/3.7.2/bin/python'
set number
" 将tab设置为4个空格
set tabstop=4
set shiftwidth=4
set expandtab
set backspace=indent,eol,start
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'rhysd/vim-healthcheck' " 健康检查插件
Plug 'scrooloose/nerdtree' " 项目目录树
Plug 'Xuyuanp/nerdtree-git-plugin'  " 目录树git状态
Plug 'morhetz/gruvbox'  " vim主题
Plug 'vim-airline/vim-airline'  " 窗口底部状态栏
Plug 'vim-airline/vim-airline-themes' " 窗口底部状态栏主题
" Plug 'davidhalter/jedi-vim'  " Python代码自动补全
" 代码补全，如果出现buildin No is module ，请到YouCompleteMe 运行
" git submodule update --init --recursive
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --go-completer --clang-completer' }
Plug 'ervandew/supertab'  " 代码补全tab按钮
Plug 'tell-k/vim-autopep8'  " PEP8代码检测 autopep8是必须的包
Plug 'airblade/vim-gitgutter'  " 展示Git修改的不同之处
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }  " golang编写工具
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
" jedi-vim Python代码补全

" ==============================
" vim-autopep8配置
let g:autopep8_disable_show_diff=1  " 不用展示不同只处  
let g:autopep8_on_save = 0  " 每次保存自动格式化pep8

" ==============================
" ctags settings
set tags=$HOME/.ctags

" ==============================
" The Keyboard Map
let mapleader = " "

map <C-n> :NERDTreeToggle<CR>
nmap <C-s> :w <CR>
imap <C-s> <Esc> :w <CR>
nnoremap <leader>bn :bNext <CR>
nnoremap <leader>bp :bprevious <CR>


