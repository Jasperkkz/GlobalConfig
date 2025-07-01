" Remap a few keys for Windows behavior
" source .JasVim/mswin.vim

let g:jas_scene = 'gvim'

source ~/.JasVim/options.vim

" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " 插件安装
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:neocomplcache_enable_at_startup = 1     "vim 启动时启用插件

" " call plug#begin( '~/vim-plug')
" " 这里装到Vim的安装目录下，方便移植
" call plug#begin( '$VIM/MyPlugin')
" Plug 'preservim/nerdcommenter'
" Plug 'scrooloose/nerdtree'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'junegunn/vim-easy-align'
" Plug 'universal-ctags/ctags'
" " vim-fugitive是vim编辑器中的Git包装器插件，它可以让我们在vim编辑器中完成git操作
" Plug 'tpope/vim-fugitive'
" Plug 'preservim/tagbar'
" Plug 'voldikss/vim-floaterm'
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'Yggdroot/LeaderF', {'do': ':LeaderfInstallCExtension'}
" "Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'ghifarit53/tokyonight-vim'
" call plug#end()
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" if has('multi_byte_ime')  
"  "未开启 IME 时光标背景色  
"  hi Cursor guifg=bg guibg=Orange gui=NONE  
"  "开启IME 时光标背景色  
"  hi CursorIM guifg=NONE guibg=Skyblue gui=NONE  
"  "关闭Vim的自动切换 IME 输入法(插入模式和检索模式)  
"  set iminsert=0 imsearch=0  
"  "插入模式输入法状态未被记录时，默认关闭IME  
"  "inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
" endif

" " 在系统启动时候启动neocomplcache
" "let g:neocomplcache_enable_at_startup = 1 

" " 提示的时候选择第一个
" "let g:neocomplcache_enable_auto_select = 1 

" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " 插件配置
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " 常规模式下输入 F2 调用插件
" nnoremap <F2> :NERDTreeToggle<CR>

" " 设置主题颜色
" let g:tokyonight_style = 'night'
" let g:tokyonight_enable_italic = 1

" "按 F2 打开关闭文件树窗口
" map <F2> :NERDTreeToggle<CR>          
" "按 F3 打开函数列表窗口
" map <F3> :TagbarToggle<CR>            
" "按 F4 打开浮动的终端窗口
" map <F4> :FloatermToggle<CR>          
" "在打开终端窗口的情况下，按 F4 关闭浮动的终端窗口
" tmap <F4> <C-\><C-n>:FloatermToggle<CR>  
" "按 F5 自动编译运行 C/C++ 文件，错误信息会进入 QuickFix 窗口
" map <F5> :!clear <CR> :set makeprg=g++ <Bar> make % -o %< <Bar> !./%< <CR> 

" let g:airline_powerline_fonts = 1
" let airline#extensions#tabline#enable = 1

" "下面几行配置为使用 gutentags 插件管理 ctags 文件
" let g:gutentags_modules = ['ctags']
" let g:gutentags_ctags_executable = '/usr/bin/etags'
" let g:gutentags_project_root = ['.git','.svn','.project','.root']
" let s:vim_tags = expand('~/.cache/tags')
" let g:gutentags_cache_dir = s:vim_tags
" if !isdirectory(s:vim_tags)
"     silent! call mkdir(s:vim_tags)
" endif
" let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
" let g:gutentags_ctags_extra_args += ['--kinds-C=+px']
" let g:gutentags_ctags_extra_args += ['--kinds-C++=+px']

" "下面几行配置为使用 LeaderF 插件管理 gtags 数据库
" let g:Lf_RootMarkers = ['.git', '.svn', '.project', '.root']
" let g:Lf_GtagsAutoGenerate = 1
" let g:Lf_GtagsAutoUpdate = 1
" let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2" }
" let g:Lf_WindowHeight = 0.3
" let g:Lf_HideHelp = 1
" let g:Lf_ShowRelativePath = 1

" "下面两行配置影响 coc.nvim 的体验
" set updatetime=300
" set signcolumn=yes

" let g:airline#extensions#tabline#enabled=1    " 开启 tab 栏
" let g:airline_theme='simple'

" " Use the internal diff if available.
" " Otherwise use the special 'diffexpr' for Windows.
" if &diffopt !~# 'internal'
"   set diffexpr=MyDiff()
" endif
" function MyDiff()
"   let opt = '-a --binary '
"   if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
"   if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
"   let arg1 = v:fname_in
"   if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
"   let arg1 = substitute(arg1, '!', '\!', 'g')
"   let arg2 = v:fname_new
"   if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
"   let arg2 = substitute(arg2, '!', '\!', 'g')
"   let arg3 = v:fname_out
"   if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
"   let arg3 = substitute(arg3, '!', '\!', 'g')
"   if $VIMRUNTIME =~ ' '
"     if &sh =~ '\<cmd'
"       if empty(&shellxquote)
"         let l:shxq_sav = ''
"         set shellxquote&
"       endif
"       let cmd = '"' . $VIMRUNTIME . '\diff"'
"     else
"       let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
"     endif
"   else
"     let cmd = $VIMRUNTIME . '\diff'
"   endif
"   let cmd = substitute(cmd, '!', '\!', 'g')
"   silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
"   if exists('l:shxq_sav')
"     let &shellxquote=l:shxq_sav
"   endif
" endfunction

