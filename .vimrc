"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 通用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","      " 定义<leader>键
set nocompatible         " 设置不兼容原始vi模式
filetype on              " 设置开启文件类型侦测
filetype plugin on       " 设置加载对应文件类型的插件
set noeb                 " 关闭错误的提示
syntax enable            " 开启语法高亮功能
syntax on                " 自动语法高亮
set t_Co=256             " 开启256色支持
set cmdheight=2          " 设置命令行的高度
set showcmd              " select模式下显示选中的行数
set ruler                " 总是显示光标位置
set laststatus=2         " 总是显示状态栏
set number               " 开启行号显示
set cursorline           " 高亮显示当前行
"set whichwrap+=<,>,h,l   " 设置光标键跨行
set ttimeoutlen=0        " 设置<ESC>键响应时间
"set virtualedit=block,onemore   " 允许光标出现在最后一个字符的后面

set magic                " 使用正则表达式设置
"if has("mouse") | set mouse=nc | endif    "鼠标设置
"autocmd InsertLeave * se nocul  " 用浅色高亮当前行
autocmd InsertEnter * se cul    " 用浅色高亮当前行

autocmd BufWritePost $MYVIMRC source $MYVIMRC  " vimrc自动加载

set t_BE= t_EE=           " vim 禁用bracketed paste 模式

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码缩进和排版
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent           " 设置自动缩进
set cindent              " 设置使用C/C++语言的自动缩进方式
set cinoptions=g0,:0,N-s,(0    " 设置C/C++语言的具体缩进方式
set smartindent          " 智能的选择对其方式
filetype indent on       " 自适应不同语言的智能缩进
set expandtab            " 将制表符扩展为空格
set tabstop=4            " 设置编辑时制表符占用空格数
set shiftwidth=4         " 设置格式化时制表符占用空格数
set softtabstop=4        " 设置4个空格为制表符
set smarttab             " 在行和段开始处使用制表符
"set nowrap               " 禁止折行
set backspace=2          " 使用回车键正常处理indent,eol,start等
set sidescroll=10        " 设置向右滚动字符数
set nofoldenable         " 禁用折叠代码
set scrolloff=7          " 代码最后保留7行，否则滚动
set colorcolumn=81       " au FileType c,cpp,python,vim set textwidth=181
hi ColorColumn guibg=#2d2d2d ctermbg=246
set formatoptions+=mM    " 在断行、合并(join)行时，针对多字节字符（比如中文）的优化处理

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码补全
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu             " vim自身命名行模式智能补全
set completeopt-=preview " 补全时不显示窗口，只显示补全列表
set wildmode=list:longest "设置补全方式

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜索设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch            " 高亮显示搜索结果
set incsearch           " 开启实时搜索功能
"set ignorecase          " 搜索时大小写不敏感

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 缓存设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup            " 设置不备份
set noswapfile          " 禁止生成临时文件
set autoread            " 文件在vim之外修改过，自动重新读入
set autowrite           " 设置自动保存
set confirm             " 在处理未保存或只读文件的时候，弹出确认
set history=1000        " 设置历史记录条数

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编码设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set langmenu=zh_CN.UTF-8
set helplang=cn
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030     " 检测文件编码时，优先考虑 UTF-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文件设置       vim打开文件时的自动匹配
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Low priority filename suffixes for filename completion {{{
set suffixes-=.h        " Don't give .h low priority
set suffixes+=.aux
set suffixes+=.log
set wildignore+=*.dvi
set suffixes+=.bak
set suffixes+=~
set suffixes+=.swp
set suffixes+=.o
set suffixes+=.class

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 记住光标位置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Resize Split When the window is resized"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

au VimResized * :wincmd =

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Remove backspace
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 移除 Windows 文件结尾的 `^M`
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <leader>M :%s/<C-V><C-M>//ge<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 粘贴复制
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set pastetoggle=<Leader>v    "设置粘贴模式
nnoremap <silent> <C-c> :call SetCopyType() <CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctags and cscope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tags=./tags;,tags
"map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"map <C-F12> :!ctags -R .<CR>

"cscope
if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=1
    "set cst
    set nocst
    set nocsverb
    " 显示路径 0: 表示整个路径都会被显示 1 文件名
    set cspc=0
    " add any database in current directory
    if filereadable("cscope.out")
         cs add cscope.out
    " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
         cs add $CSCOPE_DB
    else
        let g:cstags_update = 1
        let cscope_file=findfile("cscope.out", ".;")
        let cscope_pre=matchstr(cscope_file, ".*/")
        if !empty(cscope_file) && filereadable(cscope_file)
            silent! execute "cs add" cscope_file cscope_pre
	    endif
    endif
    set csverb
endif

nmap <Leader>c :cs <CR>
nmap <Leader>cs :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>cg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>cc :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>ct :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>ce :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>cf :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <Leader>ci :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <Leader>cd :cs find d <C-R>=expand("<cword>")<CR><CR>

nmap <Leader>cu :UpdateCstags<CR>
nmap <Leader>cn :CreateCstags<CR>
nmap <Leader>cp :DeleteCstags<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 查找C头文件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>h :call FindHeader()<CR>
function! FindHeader()
    let targetfile = ""
    let targetpath = expand("%:p:h")
    let targetname = expand("%:t:r")
    let postfix = expand("%:e")
    if postfix == "h" || postfix == "hpp"
        let targetfile = targetname.'.c -o -name '.targetname.'.cc  -o -name '.targetname.'.cpp'
    elseif postfix ==# "c" || postfix ==# "cc" || postfix ==# "cpp"
        let targetfile = targetname.".h"
    else
        return
    endif
    let targetfiles = system('find '.targetpath.' -type f -name '.targetfile)
    if targetfiles == "" && match(targetpath, 'src') != -1
        let targetpath = split(targetpath,'src')[0]
        let targetfiles = system('find '.targetpath.' -type f -name '.targetfile)
    endif

    let file_list=split(targetfiles,'\n')
    let files_len = len(file_list)
    if files_len > 1
        let first_str = "   "
        let second_str = "     "
        let input_list = ["C header file ".targetname.".*:",first_str.'#'.second_str.'filename']
        let index = 1
        while index <= files_len
           let input_list += [first_str.index.second_str.file_list[index-1]]
           let index = index + 1
        endwhile
        let g:num_=inputlist(input_list)
        if g:num_ > files_len || g:num_ < 1
            return
        endif
    elseif files_len == 1
        let g:num_ = 1
    else
        return
    endif

    silent exe ":e ".file_list[g:num_ -1]
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 切换Vim背景配色
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <F12> :call ChangeColorScheme()<cr>
function! ChangeColorScheme()
	if !g:colors_name
    	let g:colors = ["devbox-dark-256", "wombat256mod", "bubblegum-256-dark",
\   	 "calmar256-dark", "tigrana-256-dark", "desert256v2"]

    	let len_colors = len(g:colors)
    	let index_c = index(g:colors, g:colors_name)

    	let cls_index = (index_c+1)%len_colors
    	echo  g:colors[cls_index]
    	silent! execute "colorscheme ".g:colors[cls_index]
        let g:colors_name = g:colors[cls_index]
	endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自动插入头文件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile *.sh,*.py,*.h,*.hpp,*.c,*.cc,*.cpp exec ":call SetFileTitle()"
"自动定位到文件末尾
autocmd BufNewFile * normal G

func! SetFileTitle()
    let l:ext = expand("%:e")
    if l:ext == 'sh'
        call setline(1,"#!/usr/bin/sh")
        call setline(2,"")
    elseif l:ext == 'py'
        call setline(1, "\#!/usr/bin/env python")
        call setline(2, "\# coding=utf-8")
        call setline(3,"")
    elseif l:ext == 'h' || l:ext == 'hpp'
        let l:hfilename = toupper(expand("%:t:r"))."_H"
        call setline( 1, "#ifndef ".hfilename)
        call setline( 2, "#define ".hfilename)
        call setline( 3, "")
        call setline( 4, "   ...   ")
        call setline( 5, "#endif // ".hfilename)
    elseif l:ext == 'c'
        call setline( 1, "#include \<stdio.h\>")
        call setline( 2, "")
        call setline( 3, "int main(int argc, char *argv[]) {")
        call setline( 4, "    return 0;")
        call setline( 5, "}")
    elseif l:ext == 'cpp' || l:ext == 'cc'
        call setline( 1, "#include \<iostream\>")
        call setline( 2, "")
        call setline( 3, "using namespace std;")
        call setline( 4, "")
        call setline( 5, "int main(int argc, char *argv[]) {")
        call setline( 6, "    return 0;")
        call setline( 7, "}")
    endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自定义buffer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType * exec "call SetBufferMapper()"
func! SetBufferMapper()
    let c = 0
    while c < 9
        let c = c+1
        execute "nmap  <leader>b".c." <Plug>AirlineSelectTab".c
    endwhile

    let c = 0
    while c <= 9
        execute "noremap  <leader>bb".c." :b 1".c."<cr>"
        let c = c+1
    endwhile
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""         
" 自定义copy_type                                                               
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""         
let g:copy_type=0                                                               
autocmd vimenter * exec ":call SetCopyType()"                                   
func! SetCopyType()                                                             
    if g:copy_type == 1                                                         
        set nonumber                                                            
        IndentLinesDisable                                                      
        set mouse=                                                              
        set colorcolumn=
        let g:copy_type=0                                                       
    else                                                                        
        set number                                                              
        IndentLinesEnable                                                       
        if has("mouse") | set mouse=nc | endif    "鼠标设置                     
        set colorcolumn=81
        let g:copy_type=1                                                       
    endif                                                                       
                                                                                
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件列表
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"开始使用Vundle的必须配置
"set rtp+=~/.vim/bundle/Vundle.vim/
"call vundle#rc()
let g:vimdir = expand('~/.vim')  " 定义Vim配置目录
call plug#begin(g:vimdir.'/plugged')
call pathogen#infect(g:vimdir.'/plugged/{}')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

if !exists("g:gitee")
    let g:gitee = 0
endif

if g:gitee == 0
    Plug 'flazz/vim-colorschemes'
    Plug 'dense-analysis/ale'
    "代码补全
    Plug 'SirVer/ultisnips'

else
    Plug 'https://gitee.com/Icey9/ale.git'
    Plug 'https://gitee.com/Icey9/vim-colorschemes.git'

    "代码补全
    Plug 'https://gitee.com/Icey9/ultisnips.git'

endif

Plug 'vim-scripts/taglist.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/winmanager'
Plug 'mbriggs/mark.vim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

"文本对齐
Plug 'godlygeek/tabular'
Plug 'jacquesbh/vim-showmarks'
Plug 'Yggdroot/indentLine'

"python补全
Plug 'rkulla/pydiction'

"注释代码
Plug 'tomtom/tcomment_vim'

"替换双引号
Plug 'tpope/vim-surround'

"ctrl+p
Plug 'ervandew/supertab'

"Syntax
Plug 'justinmk/vim-syntax-extra'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'hdima/python-syntax'

Plug 'Raimondi/delimitMate'
" 代码片段补全
Plug 'honza/vim-snippets'
"Taglist 增强
Plug 'majutsushi/tagbar'
"if/end/endif/endfunction补全
Plug 'tpope/vim-endwise'
Plug 'Shougo/echodoc.vim'
"强化f和F键
Plug 'rhysd/clever-f.vim'
Plug 'terryma/vim-smooth-scroll'
" 查找文件
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

Plug 'liuchengxu/vim-which-key'

if version >= 800
    if exists("g:ycm") && g:ycm == 1
        if g:gitee == 0
            Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }
        else
            Plug 'https://gitee.com/Icey9/YouCompleteMe.git', { 'do': './install.py' }
        endif
    endi
    Plug 'ludovicchabant/vim-gutentags'
    "Plug 'Shougo/deoplete.nvim'
endif
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
"" nerdtree
""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>
nmap <Leader>N :NERDTreeFind<CR>
""当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
""打开vim时如果没有文件自动打开NERDTree
"autocmd vimenter * if !argc()|NERDTree|endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
"let NERDTreeShowLineNumbers=1
"过滤文件不显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp','\.out','\.pyo','\.so','cscope\.','tags']
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
" }}}


""""""""""""""""""""""""""""""
"" vim-showmarks
""""""""""""""""""""""""""""""
let showmarks_enable = 1
let g:showmarks_marks = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
"let showmarks_ignore_type = "hqm"
"let showmarks_hlline_lower = 1
"let showmarks_hlline_upper = 1


""""""""""""""""""""""""""""""
"" pydiction python补全
""""""""""""""""""""""""""""""
let g:pydiction_location = g:vimdir.'/bundle/pydiction/complete-dict'
let g:pydiction_menu_height = 3


""""""""""""""""""""""""""""""
"" taglist
""""""""""""""""""""""""""""""
"let Tlist_Use_Left_Window = 1
let Tlist_Use_Right_Window=1
let Tlist_File_Fold_Auto_Close = 1
"let Tlist_Sort_Type ='name'
let Tlist_Exit_OnlyWindow = 1
let Tlist_Ctags_Cmd ='/usr/bin/ctags' "将taglist与ctags关联
let Tlist_WinWidth = 42
let Tlist_GainFocus_On_ToggleOpen = 1
nmap <silent>tl :TlistToggle<cr>
"let Tlist_Show_Menu=1


""""""""""""""""""""""""""""""
"" vim-surround  替换双引号
""""""""""""""""""""""""""""""
vmap " S"
vmap ' S'
vmap ` S`
vmap [ S[
vmap ( S(
vmap { S{
vmap } S}
vmap ] S]
vmap ) S)
vmap > S>


""""""""""""""""""""""""""""""
"" supertab ctrl+p
""""""""""""""""""""""""""""""
let g:SuperTabDefaultCompletionType="context"
let g:SuperTabRetainCompletionType=2


""""""""""""""""""""""""""""""
"" python-syntax
""""""""""""""""""""""""""""""
let python_highlight_all = 1


""""""""""""""""""""""""""""""
"" delimitMate
""""""""""""""""""""""""""""""
" For Python docstring.
au FileType python let b:delimitMate_nesting_quotes = ['"']


""""""""""""""""""""""""""""""
"" tagbar  Taglist 增强
""""""""""""""""""""""""""""""
nmap <silent>tb :TagbarToggle<CR>
" 启动时自动focus
let g:tagbar_autofocus = 1

" for ruby, delete if you do not need
let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }

let g:tagbar_map_togglepause = 'T'


""""""""""""""""""""""""""""""
"" echodoc
""""""""""""""""""""""""""""""
"补全函数时在命令栏显示函数签名
set cmdheight=2
let g:echodoc_enable_at_startup = 1


""""""""""""""""""""""""""""""
"" vim-smooth-scroll
""""""""""""""""""""""""""""""
" 平滑移动
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>


""""""""""""""""""""""""""""""
""" ale
""""""""""""""""""""""""""""""
"始终开启标志列
let g:ale_sign_column_always = 0
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
nmap <Leader>s :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>

"修改Locaton List窗口高度
let g:ale_list_window_size = 5
"文件内容发生变化时不进行检查
let g:ale_lint_on_text_changed = 'never'
"打开文件时不进行检查
let g:ale_lint_on_enter = 0
"使用clang对c和c++进行语法检查，对python使用pylint进行语法检查
let g:ale_linters = {
\   'c++': ['clang'],
\   'c': ['clang'],
\   'python': ['pylint'],
\}

let g:airline_section_error = '%{exists("ALEGetStatusLine") ? ALEGetStatusLine() : ""}'
"设置状态栏显示的内容
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}\ %{ALEGetStatusLine()}
"ale END

""""""""""""""""""""""""""""""
""" colorscheme
""""""""""""""""""""""""""""""
silent! colorscheme devbox-dark-256

""""""""""""""""""""""""""""""
" airline
""""""""""""""""""""""""""""""
let g:airline_theme="onedark"
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = ''

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'short_path'


let g:airline#extensions#tabline#buffer_idx_mode = 1
"let g:airline#extensions#tabline#buffer_nr_show = 1
"let g:airline#extensions#tabline#buffer_nr_format = '%s:'

let g:airline#extensions#ale#enabled=1

""""""""""""""""""""""""""""""
"" tabular
""""""""""""""""""""""""""""""
nnoremap <leader>l :Tab /\|<cr>
nnoremap <leader>= :Tab /=<cr>

""""""""""""""""""""""""""""""
"" YCM
""""""""""""""""""""""""""""""
" 如果不指定python解释器路径，ycm会自己搜索一个合适的(与编译ycm时使用的python版本匹配)
" let g:ycm_server_python_interpreter = '/usr/bin/python2.7'
let g:ycm_auto_trigger = 0  " 打开/关闭自动触发补全 ctrl space 手动触发补全
let g:ycm_global_ycm_extra_conf=expand(g:vimdir.'/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py')
let g:ycm_show_diagnostics_ui = 0    "关闭语法校验
let g:ycm_min_num_of_chars_for_completion = 5
let g:ycm_confirm_extra_conf = 0
let g:ycm_error_symbol = '✗'
let g:ycm_warning_symbol = '✹'
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_semantic_triggers =  {
            \   'c' : ['->', '.','re![_a-zA-z0-9]'],
            \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
            \             're!\[.*\]\s'],
            \   'ocaml' : ['.', '#'],
            \   'cpp,objcpp' : ['->', '.', '::','re![_a-zA-Z0-9]'],
            \   'perl' : ['->'],
            \   'php' : ['->', '::'],
            \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
            \   'ruby' : ['.', '::'],
            \   'lua' : ['.', ':'],
            \   'erlang' : [':'],
            \ }
nnoremap <leader>u :YcmCompleter GoToDeclaration<cr>
" 已经使用cpp-mode插件提供的转到函数实现的功能
" nnoremap <leader>i :YcmCompleter GoToDefinition<cr>
nnoremap <leader>o :YcmCompleter GoToInclude<cr>
nnoremap <leader>ff :YcmCompleter FixIt<cr>
"nmap <F5> :YcmDiags<cr>

highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black

set completeopt=menu,menuone
" 修改补全列表配色
let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua,javascript': ['re!\w{2}'],
            \ }

let g:ycm_filetype_whitelist = {
            \ "c":1,
            \ "cpp":1,
            \ "go":1,
            \ "python":1,
            \ "sh":1,
            \ "zsh":1,
            \ }

let g:ycm_filetype_blacklist = {
        \ 'markdown' : 1,
        \ 'text' : 1,
        \ 'pandoc' : 1,
        \ 'infolog' : 1,
        \}

""""""""""""""""""""""""""""""
"" buffer
""""""""""""""""""""""""""""""
nnoremap <leader>bn :bnext<cr>
nnoremap <leader>bf :bprevious<cr>
nnoremap <leader>bd :bdelete<cr>
nnoremap <leader>bld :.+,$bdelete<cr>
"nnoremap <2-RightMouse> :bdelete<cr>
nnoremap <MiddleMouse> :bdelete<cr>

""""""""""""""""""""""""""""""
"" vim-cpp-enhanced-highlight
""""""""""""""""""""""""""""""
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_posix_standard = 1

""""""""""""""""""""""""""""""
"vim-nerdtree-syntax-highlight settings
""""""""""""""""""""""""""""""
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ' '
let g:DevIconsDefaultFolderOpenSymbol = ' '
let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = ' '
"Highlight full name (not only icons). You need to add this if you don't have vim-devicons and want highlight.
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

"Highlight full name (not only icons). You need to add this if you don't have vim-devicons and want highlight.
let g:NERDTreeHighlightFolders = 1

"highlights the folder name
let g:NERDTreeHighlightFoldersFullName = 1

"you can add these colors to your .vimrc to help customizing
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:Turquoise = "40E0D0"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = "FE405F"
let s:git_orange = "F54D27"
let s:gray = "808A87"

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['o'] = s:gray " sets the color of o files to blue
let g:NERDTreeExtensionHighlightColor['h'] = s:blue " sets the color of h files to blue
let g:NERDTreeExtensionHighlightColor['c'] = s:green " sets the color of c files to blue
let g:NERDTreeExtensionHighlightColor['cpp'] = s:green " sets the color of cpp files to blue
let g:NERDTreeExtensionHighlightColor['c++'] = s:green " sets the color of c++ files to blue


""""""""""""""""""""""""""""""
"vim-gutentags 自动创建tags
""""""""""""""""""""""""""""""
let g:gutentags_plus_switch = 0

"let $GTAGSLABEL = 'native-pygments'
"let $GTAGSCONF = '/usr/local/share/gtags/gtags.conf'

" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

"" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
    let g:gutentags_modules += ['ctags']
endif
if executable('gtags_cscope') && executable('gtags')
    let g:gutentags_modules += ['gtags_cscope']
endif

set tags+=tags

" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand(g:vimdir.'/tags')
let g:gutentags_cache_dir = s:vim_tags
" 检测 ~/.cache/tags 不存在就新建 "
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行
"let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁用 gutentags 自动加载 gtags 数据库的行为
" 避免多个项目数据库相互干扰
" 使用plus插件解决问题
let g:gutentags_auto_add_gtags_cscope = 0


""""""""""""""""""""
"" vim-snippets settings
""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

""""""""""""""""""""
"" LeaderF settings
""""""""""""""""""""""
let g:Lf_CommandMap = {'<C-K>': ['<Up>'], '<C-J>': ['<Down>'], '<Up>': ['<C-Left>'], '<Down>': ['<C-Right>']}
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand(g:vimdir.'/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}
let g:Lf_WildIgnore = {
        \ 'dir': ['.svn','.git','.hg'],
        \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]',
        \ '*.tags','cscope.*','*.rst']
        \}

let g:Lf_MruWildIgnore = {
        \ 'dir': ['.svn','.git','.hg','.vim'],
        \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]',
        \ '*.tags','cscope.*','*.txt','*.vim*','*.conf','*.cfg','*.rst']
        \}

let g:Lf_ShortcutB = '<Leader>B'
let g:Lf_NoChdir = 0

"文件搜索
nnoremap <silent> <Leader>ff :Leaderf file --cword<CR>
"历史打开过的文件
nnoremap <silent> <Leader>fm :Leaderf mru<CR>
"Buffer
nnoremap <silent> <Leader>fb :Leaderf buffer --cword<CR>
"函数搜索（仅当前文件里）
nnoremap <silent> <Leader>fc :Leaderf function --cword<CR>
"模糊搜索，很强大的功能，迅速秒搜
nnoremap <silent> <Leader>fr :Leaderf rg --cword -g '!*.{tags,log,bak,rst,txt,md,conf}' -g '!{cscope}.*' -g '!{tags}' <CR>

""""""""""""""""""""""""""""""
"" vim-which-key 
""""""""""""""""""""""""""""""
"nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader>d :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader>d :<c-u>WhichKeyVisual '<Space>'<CR>

let g:which_key_map = {
      \'name' : '+Command' ,
      \"n":['<C-n>', '<ctrl+n> 打开/关闭资源管理'],
      \"N":[':NERDTreeFind<CR>', '<,+N> 当前文件列表'],
      \'F':['<F5>', '<,+F5> 清除文件多余空白字符'],
      \'tb':[':Tagbar', '<tb/tl> tagbar/taglist函数列表'],
      \'M':[':%s/<C-V><C-M>//ge<CR>', '<,+M> 清除^M特殊字符'],
      \'m':['<ESC>', '<,+m> 高亮字符'],
      \'h':[':call FindHeader()<CR>', '<,+h> 查找C头文件'],
      \'|':[':Tab /\|<cr>', '<,+|> 按|对齐'],
      \'=':[':Tab /=<cr>', '<,+=> 按=对齐'],
      \'/':['', '<c+//> 多行注释'],
      \'c':[':call SetCopyType()', '<Ctrl+c> 拷贝模式'],
      \'v':[':set paste', '<,+v> 粘贴模式'],
      \'b':['<ESC>', '<,+b[0-9]> 跳转0-9标签页'],
      \'bb':['<ESC>', '<,+bb[0-9]> 跳转10-19标签页'],
      \'bld':[':.+,$bdelete<cr>', '<,+bld> 删除当前标签后所有标签'],
      \'bd':[':bdelete', '<,+bd> 删除当前标签'],
      \'O':[':bdelete', '<MiddleMouse> 删除当前标签'],
      \'c-6':['<ESC>', '<ctrl+6> 切换上一次打开标签'],
      \'S':[':call ChangeColorScheme()', '<F12> 切换主题'],
      \'tab':['<ESC>', '<ctrl+tab> 代码片段补全'],
      \'p':['<ESC>', '<ctrl+p> 代码缓存补全'],
      \'space':['<ESC>', '<ctrl+space> 代码YCM补全'],
      \'cs':['<ESC>', '<c+s+"'."'> 替换双引号为单引号"],
      \'ds':['<ESC>', '<d+s+"> 删除单引号'],
      \'q':['<ESC>', '退出'],
      \}

let g:which_key_map['f'] = {
      \'name' : '+Leader F' ,
      \'f':[':Leaderf file', '<,+ff> 查找文件'],
      \'m':[':Leaderf mru', '<,+fm> 查找最近打开文件'],
      \'b':[':Leaderf buffer', '<,+fb> buffer内查找'],
      \'c':[':Leaderf function', '<,+ff> 查找函数'],
      \'r':[":Leaderf rg -g '!*.{tags,log,bak,rst,txt,md,conf}' -g '!{cscope}.*' -g '!{tags}'", '<,+fr> rg 全局查找'],
      \'<ctrl+left>':['', '向上查找历史'],
      \'<ctrl+right>':['', '向下查找历史'],
      \'q':['<ESC>', '退出'],
      \}

let g:which_key_map['C'] = {
      \'name' : '+Cscope Tags' ,
      \'u':[':UpdateCstags', '<,+c+u> 更新cscope tags'],
      \'n':[':CreateCstags', '<,+c+n> 创建cscope tags'],
      \'p':[':DeleteCstags', '<,+c+p> 删除cscope tags'],
      \'I':[':cscope', '<,+c+[i]> cscope快捷键以及参数'],
      \'q':['<ESC>', '退出'],
      \}

""""""""""""""""""""""""""""""
"" deoplete 补全
""""""""""""""""""""""""""""""
" 自启动
"let g:deoplete#enable_at_startup = 1
"" smart case不解释
"let g:deoplete#enable_smart_case = 1
"
"" 用户输入至少两个字符时再开始提示补全
"call deoplete#custom#source('LanguageClient',
"            \ 'min_pattern_length',
"            \ 2)
"
"" 字符串中不补全
"call deoplete#custom#source('_',
"            \ 'disabled_syntaxes', ['String']
"            \ )
"
"" 补全结束或离开插入模式时，关闭预览窗口
"autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
"
"" 为每个语言定义completion source
"" 是的vim script和zsh script都有，这就是deoplete
"call deoplete#custom#option('sources', {
"            \ 'cpp': ['LanguageClient'],
"            \ 'c': ['LanguageClient'],
"            \ 'vim': ['vim'],
"            \ 'zsh': ['zsh']
"            \})
"
"" 忽略一些没意思的completion source。
"let g:deoplete#ignore_sources = {}
"let g:deoplete#ignore_sources._ = ['buffer', 'around']

