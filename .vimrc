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
if has("mouse") | set mouse=nc | endif    "鼠标设置
"autocmd InsertLeave * se nocul  " 用浅色高亮当前行
autocmd InsertEnter * se cul    " 用浅色高亮当前行

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
set nowrap               " 禁止折行
set backspace=2          " 使用回车键正常处理indent,eol,start等
set sidescroll=10        " 设置向右滚动字符数
set nofoldenable         " 禁用折叠代码
set scrolloff=7          " 代码最后保留7行，否则滚动
set colorcolumn=81     " au FileType c,cpp,python,vim set textwidth=181
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
"Remove backspace
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 移除 Windows 文件结尾的 `^M`
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <leader>M :%s/<C-V><C-M>//ge<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctags and cscope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tags=./tags;
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
        let cscope_file=findfile("cscope.out", ".;")
        let cscope_pre=matchstr(cscope_file, ".*/")
        if !empty(cscope_file) && filereadable(cscope_file)
            silent! execute "cs add" cscope_file cscope_pre
	    endif
    endif
    set csverb
endif
nmap <C-c>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-c>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-c>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-c>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-c>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-c>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-c>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-c>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自定义函数
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>c :call FindHeader()<CR>
function! FindHeader()
    let targetfile = ""
    let targetpath = expand("%:h")
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
    if targetfiles == ""
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
	endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件列表
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"开始使用Vundle的必须配置
"set rtp+=~/.vim/bundle/Vundle.vim/
"call vundle#rc()

call plug#begin('~/.vim/plugged')
call pathogen#infect('~/.vim/plugged/{}')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'gmarik/vundle'
"Plug 'Lokaltog/vim-powerline'
"set laststatus=2
"let g:Powline_symbols='fancy'

Plug 'vim-scripts/taglist.vim'
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
"END Taglist


Plug 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>
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
" END Nerdtree


Plug 'vim-scripts/winmanager'
"Plug 'VundleVim/Vundle.vim'
Plug 'mbriggs/mark.vim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'


"文本对齐
Plug 'godlygeek/tabular'
Plug 'jacquesbh/vim-showmarks'
let showmarks_enable = 1
let g:showmarks_marks = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
"let showmarks_ignore_type = "hqm"
"let showmarks_hlline_lower = 1
"let showmarks_hlline_upper = 1
" END showmarks

Plug 'Yggdroot/indentLine'

"python补全
Plug 'rkulla/pydiction'
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'
let g:pydiction_menu_height = 3
"END

Plug 'flazz/vim-colorschemes'
silent! colorscheme devbox-dark-256

"注释代码
Plug 'tomtom/tcomment_vim'

Plug 'dense-analysis/ale'
"ale
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
"END ale

"替换双引号
Plug 'tpope/vim-surround'
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
" END Surround

Plug 'ervandew/supertab'
let g:SuperTabDefaultCompletionType="context"
let g:SuperTabRetainCompletionType=2
"END  ctrl+p

"Syntax
Plug 'justinmk/vim-syntax-extra'
Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'hdima/python-syntax'
let python_highlight_all = 1
"END python syntax

Plug 'Raimondi/delimitMate'
" For Python docstring.
au FileType python let b:delimitMate_nesting_quotes = ['"']

"代码补全
Plug 'SirVer/ultisnips'
" 代码片段补全
Plug 'honza/vim-snippets'
"END


"标记修改
"Plug 'chrisbra/changesPlug'
"let g:changes_autocmd=1
"let g:changes_use_icons = 1
" let g:changes_respect_SignColumn = 1
"let g:changes_sign_text_utf8 = 1
" END changes

"Taglist 增强
Plug 'majutsushi/tagbar'
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

"if/end/endif/endfunction补全
Plug 'tpope/vim-endwise'

"补全函数时在命令栏显示函数签名
Plug 'Shougo/echodoc.vim'
set cmdheight=2
let g:echodoc_enable_at_startup = 1
"END echodoc

"强化f和F键
Plug 'rhysd/clever-f.vim'

"
Plug 'terryma/vim-smooth-scroll'
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" airline
let g:airline_theme="onedark"
let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" tabular
nnoremap <leader>l :Tab /\|<cr>
nnoremap <leader>= :Tab /=<cr>

" YCM
" 如果不指定python解释器路径，ycm会自己搜索一个合适的(与编译ycm时使用的python版本匹配)
" let g:ycm_server_python_interpreter = '/usr/bin/python2.7'
let g:ycm_auto_trigger = 0  " 打开/关闭自动触发补全 ctrl space 手动触发补全
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
 
let g:ycm_key_invoke_completion = '<c-y>'
set completeopt=menu,menuone
" 使用 Ctrl+y 主动触发语义补全
noremap <c-y> <NOP>
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

"" buffer
nnoremap <leader>bda :bufdo bd<cr>
nnoremap <leader>bn :bnext<cr>
nnoremap <leader>bp :bprevious<cr>

"" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'

if version >= 800
    "Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }

    Plug 'ludovicchabant/vim-gutentags'
    "Plug 'skywind3000/gutentags_plus'
    "let g:gutentags_trace = 1

    let g:gutentags_plus_switch = 0

    let $GTAGSLABEL = 'native-pygments'
    let $GTAGSCONF = '/usr/local/share/gtags/gtags.conf'

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
    let s:vim_tags = expand('~/.cache/tags')
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

    ""预览 quickfix 窗口 ctrl-w z 关闭
    "Plug 'skywind3000/vim-preview'
    ""P 预览 大p关闭
    "autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
    "autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>
    "noremap <Leader>u :PreviewScroll -1<cr> " 往上滚动预览窗口
    "noremap <leader>d :PreviewScroll +1<cr> "  往下滚动预览窗口
    "END.....gtags
    "Plug 'Shougo/deoplete.nvim'
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
    "END deoplete
endif
call plug#end()
