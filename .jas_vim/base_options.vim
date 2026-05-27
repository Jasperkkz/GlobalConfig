" 基础设置，可用于IDE

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自定义组合键（不涉及到插件）,Keyboard map
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 定义<leader>键
let mapleader = " "
let g:mapleader = " "

" col函数返回当前所在的行数
" noremap <expr>s col(".")==1?"$":"0"

" 缩进的时候不在退出可选模式
vnoremap < <gv
vnoremap > >gv

" 映射常用的编辑文件方式，分别对应覆盖当前打开，水平打开，垂直打开，tab打开
" noremap <leader>ew :e %%
" noremap <leader>es :sp %%
" noremap <leader>ev :vsp %%
" noremap <leader>et :tabe %%

" 映射水平滚轮移动，更快些
noremap zl zL
noremap zh zH

" tab new和tab close操作
noremap <leader>tn :tabnew<CR>
noremap <leader>tc :tabclose<CR>

" split
noremap <leader>ss :split<CR>
noremap <leader>sv :vsplit<CR>

" 能够一键清理掉代码行尾的空格
nnoremap <leader>w :%s/\s\+$//<cr>:let @/=''<CR>

" 路径换行符替换
vnoremap <leader>pd :s/\//\\\\/g<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if g:jas_scene != 'vsvim'
    " 不适用vi的键盘模式，而是Vim自己的
    set nocompatible

    " 对于正则表达式，打开magic
    set magic

    " 在处理未保存或只读文件的时候，弹出确认
    set confirm

    " 分割出来的窗口位于当前窗口下边/右边
    set splitbelow
    set splitright
endif

" 选择模式的区间
set selection=inclusive
set selectmode=mouse,key

" b：允许使用 b 命令（向后跳到单词的开头）在行首时穿越到上一行。
" s：允许使用 s 命令（删除当前字符并进入插入模式）在行首时穿越到上一行。
" h：允许使用 h 命令（向左移动一个字符）在行首时穿越到上一行。
" l：允许使用 l 命令（向右移动一个字符）在行末时穿越到下一行。
" <：允许使用 < 命令（缩进）在行首时穿越到上一行。
" >：允许使用 > 命令（增加缩进）在行末时穿越到下一行。
" [：允许使用 [ 命令（向上移动到前一个段落）在行首时穿越到上一行。
" ]：允许使用 ] 命令（向下移动到下一个段落）在行末时穿越到下一行。
set whichwrap=b,s,h,l,<,>,[,]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 查找和匹配
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 开启实时搜索
set incsearch
" 设置被搜索到字符串高亮显示
set hlsearch
" 查找时忽略大小写
set ignorecase
" 如果搜索的pattern中含有大写字母，则大小写敏感
set smartcase

" 高亮显示匹配的括号
" set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
" set matchtime=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 折叠
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if g:jas_scene != 'vsvim'
    " 允许折叠
    set foldenable

    " 折叠方法
    " manual    手工折叠
    " indent    使用缩进表示折叠
    " expr      使用表达式定义折叠
    " syntax    使用语法定义折叠
    " diff      对没有更改的文本进行折叠
    " marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}

    " 用语法高亮来定义折叠
    set fdm=syntax

    " 启动vim时不要自动折叠代码
    set foldlevel=100
    " 不自动折行
    " set nowrap
    " 设置折叠栏的宽度
    " set foldcolumn=5

    "设置键盘映射，通过空格设置折叠
    "nnoremap <space> @=((foldclosed(line('.')<0)?'zc':'zo'))<CR>
endif