"设置TAB键为4个空格

set tabstop =4 
set helplang=cn  
"显示行号
set number 

"关闭vi兼容模式
set nocompatible 

"自动语法高亮
syntax on 

"自动检测文件类型
filetype on 

"检测文件类型插件
filetype plugin on 

"上下可视行数
set scrolloff=6 

"设置删除建可以一次删除4个空格
set softtabstop=4 

"搜索的时候忽略大小写
set ignorecase

"当有一个字母是大写的时候，大小写敏感 
set smartcase 

"设置配色方案
colorscheme desert 

"显示括号配对情况
set showmatch

" 选中状态下 Ctrl+c 复制
vnoremap <c-c> 

"if has("gui_running")
"    set guioptions-=m " 隐藏菜单栏
"    set guioptions-=T " 隐藏工具栏
"    set guioptions-=L " 隐藏左侧滚动条
"    set guioptions-=r " 隐藏右侧滚动条
"    set guioptions-=b " 隐藏底部滚动条
"    set showtabline=0 " 隐藏Tab栏
"endif

"设置启动窗口位置，前一个数字是X轴，后一个数字是Y轴
winpos 560 0 

"设置窗口大小，行和列
set lines=72 columns=96

"自动与上一行跟从缩进
set autoindent  

"用空格键来开关折叠
set foldenable
set foldmethod=indent
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

"set guifont=Courier\ News:h10 "设置字体方案
"set guifont=News:10 "设置字体方案
"set guifont=Courier\ 10 "设置字体方案
"set guifont=Monospace\ 12 "设置字体方案
"set guifont=Yahei\ Consolas\ Hybrid:h10"设置字体方案
"set guifont=Bitstream\ Vera\ Sans\ Mono\ 12"设置字体方案

"set modeline 

"pydiction 1.2 python auto complete
filetype plugin on
let g:pydiction_location = '~/.vim/plugin/complete-dict'
defalut g:pydiction_menu_height == 15
let g:pydiction_menu_height = 20

set mouse=a
filetype plugin indent on
set completeopt=longest,menu
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete

"set the taglist
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

"set winmanage
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>
map tt :FirstExplorerWindow<CR>
map bb :BottomExplorerWindow<CR>

"for python.vim
"set filetype=python
au BufNewFile,BufRead *.py,*.pyw setf python

"缩进
set autoindent " same level indent
set smartindent " next level indent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

"gvim 内部编码"
set encoding=utf-8

"设置当前编辑的文件的编码"
set fileencoding=utf-8

"解决consle输出乱码“
"language messages zh_CN. utf-8
"设置终端编码“
"let &termencoding=&encoding

"将TAB转成空格"
 set et

"删除tab的时候删除4个空格
set smarttab

"设置显示特殊字符"
"set ambiwidth=double

"设置C语言缩进方式
set cindent
set ruler
set incsearch

"括号补全 有点残缺
"inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap { {}<LEFT>

" 输入一个字符时，如果下一个字符也是括号，则删除它，避免出现重复字符
function! RemoveNextDoubleChar(char)
    let l:line = getline(".")
    let l:next_char = l:line[col(".")] " 取得当前光标后一个字符
 
    if a:char == l:next_char
        execute "normal! l"
    else
        execute "normal! i" . a:char . ""
    end
endfunction
inoremap ) <ESC>:call RemoveNextDoubleChar(')')<CR>a
inoremap ] <ESC>:call RemoveNextDoubleChar(']')<CR>a
inoremap } <ESC>:call RemoveNextDoubleChar('}')<CR>a

"set guifont=Courier\ 10\Pitch\10
if&term=~"xterm"
    gui
endif

"Toggle Menu and Toolbar
set guioptions-=m
set guioptions-=T
map <silent> <F2> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>

"关闭右侧的滚动条
set guioptions-=r

"map <F8> :NERDTree<CR>
map <F8> ::NERDTreeToggle<CR>

set autoread

"设置打开新标签和切换标签的快捷键
if has("gui_running") "|| s:useWildMenu
   nmap <C-TAB> :tabNext<CR>
   nmap <C-S-TAB> :tabnext<CR>
   imap <C-TAB> <ESC><ESC>:tabNext<CR>
   imap <C-S-TAB> <ESC><ESC>:tabnext<CR>
   nmap <C-n> :tabnew<CR>
   nmap <C-F4> :q<CR>
endif

"NERD Tree 
let NERDChristmasTree=1 
let NERDTreeAutoCenter=1 

"let NERDTreeBookmarksFile=$VIM.'\Data\NerdBookmarks.txt' 
let NERDTreeMouseMode=2 
let NERDTreeShowBookmarks=1 
let NERDTreeShowFiles=1 
let NERDTreeShowHidden=1 
let NERDTreeShowLineNumbers=1 
let NERDTreeWinPos='left' 
let NERDTreeWinSize=31 
