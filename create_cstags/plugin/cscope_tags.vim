
if !exists("g:cstags_update ")
    let g:cstags_update = 1
endif

if !exists('g:cstags_name')
    let g:cstags_name = "cscope"
endif

if !exists('g:cstags_path')
    let g:cstags_path = expand('~/.vim/cscope_tags')
endif

if !exists('g:cstags_root_list')
    let g:cstags_root_list = []
endif

if !exists('g:cstags_filetype')
    let g:cstags_filetype = ["*.h","*.hpp","*.c","*.cc","*.cpp","*.py","*.sh"]
endif


function! UpdateCsTags()
    let l:localpath = getcwd() 

    for dir_name in reverse(split(l:localpath,'/')) 
        let l:cstags_basename = substitute(l:localpath ,"/","_","g") 
        let l:cstags_cache_path = g:cstags_path."/".l:cstags_basename."/".g:cstags_name

        let l:cstags_root = 0
        for dir_name in g:cstags_root_list
            if isdirectory(l:local_path.'/'.dir_name)
                let l:cstags_root = 1
                break
            endif
        endfor

        if l:cstags_root == 0 && filereadable(l:cstags_cache_path)
            silent! execute "cs reset" 
            silent! execute "cs add" l:cstags_cache_path
            break
        endif
        let l:localpath = fnamemodify(l:localpath,":h")

    endfor
endfunction

function! CreateCsTags()
    let l:localpath = getcwd() 
    let l:cstags_basename = substitute(l:localpath ,"/","_","g") 
    let l:cstags_cache_path = g:cstags_path.'/'.l:cstags_basename

    if mkdir(l:cstags_cache_path,"p","0700") == 1

        let l:file_filter = "-type f ! -path \"*/qa/*\""
        for file_type in g:cstags_filetype
            if !exists('l:find_cscope_files')
                let l:find_cscope_files = ' -name "'.file_type.'" '.l:file_filter
            else
                let l:find_cscope_files = l:find_cscope_files.' -o -name "'.file_type.'" '.l:file_filter
            endif
        endfor
        let l:cstags_cache_file = l:cstags_cache_path.'/'.g:cstags_name

        let l:find_cmd = 'find '.l:localpath.' '.l:find_cscope_files.' > '.l:cstags_cache_file.'.files'
        let l:cscope_cmd = 'cscope -bkq -f'.l:cstags_cache_file.' -i'.l:cstags_cache_file.'.files'
        let l:ctags_cmd = 'ctags -R -f '.l:cstags_cache_path.'/tags '.l:localpath

        let find_ret = system(l:find_cmd)
        if exists('*job_start')
            let jobs = job_start(l:cscope_cmd)
            let jobs = job_start(l:ctags_cmd)
        else
            let cscope_ret = system(l:cscope_cmd)
            let ctags_ret = system(l:ctags_cmd)
        endif
    endif
endfunction

function! ClearCsTags()
    let l:localpath = getcwd() 

    for dir_name in reverse(split(l:localpath,'/')) 
        let l:cstags_basename = substitute(l:localpath ,"/","_","g") 
        let l:cstags_cache_path = g:cstags_path."/".l:cstags_basename

        let l:cstags_root = 0
        for dir_name in g:cstags_root_list
            if isdirectory(l:local_path.'/'.dir_name)
                let l:cstags_root = 1
                break
            endif
        endfor

        if l:cstags_root == 0 && isdirectory(l:cstags_cache_path)
            let del_ret = delete(l:cstags_cache_path, "rf")
            break
        endif
        let l:localpath = fnamemodify(l:localpath,":h")

    endfor

endfunction


if g:cstags_update ==1
    execute "call UpdateCsTags()"
endif

command! UpdateCstags call UpdateCsTags()
command! CreateCstags call CreateCsTags()
command! DeleteCstags call ClearCsTags()
