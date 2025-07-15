
" 加载基本配置
source ~/.jas_vim/mswin.vim
source ~/.jas_vim/base_options.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 在windows版本中vim的退格键模式默认与vi兼容，与我们的使用习惯不太符合，下边这条可以改过来，解决删除键不生效
set backspace=indent,eol,start
" 换行方式在不同的平台下不同
set fileformats=unix,dos

" 根据操作系统设置默认换行符
if has("win32") || has("win64")
    " Windows 系统默认使用 CRLF
    set fileformat=dos
    set fileformats=dos,unix
else
    " Linux/Unix 系统默认使用 LF
    set fileformat=unix
    set fileformats=unix,dos
endif

" 自动切换当前目录为当前文件所在的目录
set autochdir

" 不用<Alt>键组合来操作菜单
set winaltkeys=no

" 鼠标可用
set mouse=a

" 开启256色支持
set t_Co=256
" 开启语法高亮功能
syntax enable
" 自动语法高亮
syntax on

" 显示行号
set number

" 设置开启文件类型侦测
filetype on
" 加载对应文件类型插件
filetype plugin on

" Vim 的标签行用于显示当前打开的标签页（tab）
set showtabline=2

" 启用文本换行
set wrap
"当 wrap 被启用时，linebreak 选项确保文本在单词的边界处换行，而不是在单词中间
set linebreak
" wrap的时候一行内容过长，防止出现显示@
set display+=lastline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UI设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 主题
"colorscheme Tomorrow-Night

" 设置配色
color desert
" 设置背景色
set background=dark

highlight Comment ctermfg=green

" 关闭错误信息响铃，但是，按键Esc之类的会哔哔
set noerrorbells
" 使用可视响铃代替呼叫，遇错会闪屏，但是，按键Esc之类的会闪屏
set visualbell
" 置空错误铃声的终端代码。t_vb 选项控制 Vim 如何闪屏（在 Unix 和 Windows 系统上，适用于终端和图形界面 Vim）。如果该选项为空，Vim 不会闪屏。
set t_vb=

" Gvim中得配置这个才能不闪烁
au GUIEnter * set vb t_vb=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 状态信息设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('statusline')
    " 启动显示状态行(1),总是显示状态行(2)
    set laststatus=2

    " 左下角显示当前模式
    set showmode
    " 右下角显示当前的行号列号
    set ruler

    " 在状态栏显示正在输入的命令
    set showcmd
    " 设置命令行高度
    set cmdheight=1

    " 下面的状态栏展示信息比较多，，可以如上所示进行集合性配置，如果懒得一一理解，可直接复制进配置文件，因为所有配置对于提升你编程效率都有帮助。
    set statusline=%F%m%r%h%w%=(%Y/%{&ff}:%{&fenc!=''?&fenc:&enc})\ (line\ %l\/%L,\ col\ %c)

    " 当然如果你不嫌麻烦，也可以以下面所示形式单独配置（注意去掉前面”号）
    "set statusline+=%{&ff}  "显示文件格式类型
    "set statusline+=%h  "帮助文件标识
    "set statusline+=%m  "可编辑文件标识
    "set statusline+=%r  "只读文件标识
    "set statusline+=%y  "文件类型
    "set statusline+=%c  "光标所在列数
    "set statusline+=%l/%L  "光标所在行数/总行数
    "set statusline+=\ %P  "光标所在位置占总文件百分比
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 光标设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 光标不要闪烁太快
set gcr=a:blinkoff400
set gcr=a:blinkon400
" 突出显示当前行
set cursorline
" 突出显示当前列
" set cursorcolumn

" 浅色显示当前行
" autocmd InsertLeave * se cul
"用浅色高亮当前行
" autocmd InsertEnter * se cul

" 自定义光标样式
highlight CursorLine cterm=NONE ctermbg=black ctermfg=brown guibg=NONE guifg=NONE
" highlight CursorColumn cterm=NONE ctermbg=black ctermfg=brown guibg=NONE guifg=NONE

" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=5

" 允许光标出现在最后一个字符的后面
"set virtualedit=block,onemore

" 控制 Vim 等待组合键的时间，适用于所有模式
" set timeoutlen=1000
" 控制终端输入的超时时间，主要用于处理终端中的组合键。
" set ttimeoutlen=100

let &t_SI = "\<Esc>[5 q"
let &t_SR = "\<Esc>[3 q"
let &t_EI = "\<Esc>[1 q"

"SI = INSERT mode
"SR = REPLACE mode
"EI = NORMAL mode (ELSE)
"  1 -> blinking block
"  2 -> solid block 
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab缩进与排版
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab键的宽度[等同的空格个数]
set tabstop=4
" 每一次缩进时，制表符占用的空格数
set shiftwidth=4

" 在行头插入Tab时，根据shiftwidth的大小，而不是tabstop
set smarttab
" 缩进时，取整shiftwidth
set shiftround

" 用空格代替制表符[需要输入真正的Tab键时，在插入模式下使用 Ctrl+v+tab 或者用 ctrl+q+tab]
set expandtab

" 按退格键时可以一次删掉 4 个空格
set softtabstop=4

" 自动缩进,简单与上一行保持一致
"set autoindent
" C风格
"set cindent
" 智能模式
set smartindent

" 显示tab和空格
set list
"将tab显示为可见字符
set listchars=tab:>-,trail:·
" set listchars=space:·,tab:>-,trail:-
" 设定行首tab为灰色
highlight LeaderTab guifg=#666666
" 匹配行首tab
match LeaderTab /^\t/

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 补全
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim自身命令行模式智能补全，输入命令点击Tab键时，会展示所有候选命令
set wildmenu
" Command <Tab> completion, list matches, then longest common part, then all.
set wildmode=list:longest,full 
" 补全时不显示窗口，只显示补全列表
set completeopt-=preview

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 备份设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文件在vim之外修改过，自动重新载入
" set autoread
"自动保存
set autowrite
" 历史记录数
set history=1024
" 禁止生成临时文件， 备份文件 filename~
set nobackup
" 禁止生成临时文件，交换文件 .filename.swap
set noswapfile
" 不生成undo备份 .filename.un~
set noundofile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编码设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 将界面语言设定为中文
set langmenu=zh_CN.UTF-8
let $LANG = 'en_US.UTF-8'

" 设置中文帮助
set helplang=cn

" 编码方式
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030

" vim提示信息乱码的解决
" language messages zh_CN.utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GVIM菜单及设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"启动时隐去援助提示
set shortmess=atI

if has('gui_running')
	" 取消工具栏
	set guioptions-=T
    " 取消菜单栏
	set guioptions-=m
    " 如果窗口垂直分隔，将在编辑器左侧放置滚动条
	"set guioptions-=L
    " 取消垂直滚动条
	"set guioptions-=r
    " 取消水平滚动条
	"set guioptions-=b
	" 使用内置 tab 样式而不是 gui
	set guioptions-=e
	" 设置字体
	set guifont=黑体:h14
	" 窗口大小
	winpos 1000 500
	set lines=50 columns=148
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自定义组合键（不涉及到插件）,Keyboard map，这些同时在IDE中不会用到
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F3> :if &hlsearch \| set nohlsearch \| else \| set hlsearch \| endif<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 基本常用函数，与插件无关
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 平台判断
silent function! OSX()
    return has('macunix')
endfunction
silent function! LINUX()
    return has('unix') && !has('macunix') && !has('win32unix')
endfunction
silent function! WINDOWS()
    return  (has('win32') || has('win64'))
endfunction

"  < 判断是终端还是 Gvim >
silent function! GUI()
    return has("gui_running")
endfunction

if !WINDOWS()
    set shell=/bin/sh
endif
" On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
" across (heterogeneous) systems easier.
" if WINDOWS()
"     set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
" endif

" if filereadable(expand("~/.vimrc.bundles"))
"     source ~.vimrc.bundles
" endif

" 代码折叠自定义快捷键 <leader>zz
let g:FoldMethod = 0
map <leader>zz :call ToggleFold()<cr>
fun! ToggleFold()
    if g:FoldMethod == 0
        exe "normal! zM"
        let g:FoldMethod = 1
    else
        exe "normal! zR"
        let g:FoldMethod = 0
    endif
endfun

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 平台差异化配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <F1> :so $MYVIMRC<CR>