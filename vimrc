" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
"不产生缓冲文件
set nobackup 
"设置配色方案
colorscheme contrasty 
"设置TAB键为4个空格
set tabstop =4 
"显示行号
set number 
"关闭vi兼容模式
set nocompatible 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif
"文件类型检测
filetype plugin indent on 
"上下可视行数
set scrolloff=6 
"设置删除建可以一次删除4个空格
set softtabstop=4 
"vim73设置退格键可用
set backspace=indent,eol,start
"搜索时高亮显示结果
set hls
"输入搜索命令时，显示目前输入的模式的匹配位置
set is
"搜索的时候忽略大小写
set ignorecase
"当有一个字母是大写的时候，大小写敏感 
set smartcase 
"使用:e命令的时候 可选项预览
set wildmenu
"显示括号配对情况
set showmatch
"自动与上一行跟从缩进
set autoindent  
"缩进使用空格
set expandtab
"鼠标捕捉
set mouse=a

"设置窗口大小，行和列
set lines=30 columns=108

"""""""""""""""""""""""""""""
" TagList setting
"""""""""""""""""""""""""""""
"Exuberant ctags程序的位置
let Tlist_Ctags_Cmd="/usr/local/bin/ctags"
let Tlist_Inc_Winwidth=0
"在右侧窗口打开
let Tlist_Use_Right_Window=1
"只显示当前文件的tag
let Tlist_File_Fold_Auto_Close=1
"如果Taglist是最后一个窗口则退出vim
let Tlist_Exit_OnlyWindow = 1


""""""""""""""""""""""""""""""
" BufExplore settings
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.

""""""""""""""""""""""""""""""
" winManager setting
""""""""""""""""""""""""""""""
"let g:winManagerWindowLayout = \""BufExplorer,FileExplorer|TagList"
let g:winManagerWindowLayout = "FileExplorer|TagList"
let g:winManagerWidth = 30
let g:defaultExplorer = 0
nmap wm :WMToggle<cr>
map tt :FirstExplorerWindow<CR>
map bb :BottomExplorerWindow<CR>

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

"设置C语言缩进方式
set cindent
set ruler
set incsearch



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

"map <F8> :NERDTree<CR>
map <F8> ::NERDTreeToggle<CR>

set autoread

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"设置打开新标签和切换标签的快捷键
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <C-l> :tabnext<CR>
nmap <C-n> :tabnew<CR>
nmap <C-F4> :q<CR>


""""""""""""""""""""""""""""""
"设置NERDTree
""""""""""""""""""""""""""""""
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

""""""""""""""""""""""""""""""
"设置ack
""""""""""""""""""""""""""""""
let g:ackprg="ack-grep -H --nocolor --nogroup --column"
