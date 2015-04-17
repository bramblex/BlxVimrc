""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Require Module for VimScript
"
"   Auth:       Brambles
"   Email:      qjnight@gmail.com
"   Respone:    http://https://github.com/bramblex/BlxVimrc.git
"   Date:       Fri Apr 17
"

let s:paths = []
let s:modules = {}

let s:current_module_stack = []

function! s:ModulePathPush(path)
    call add(s:current_module_stack, a:path)
    return a:path
endfunction

function! s:ModulePathPop()
    return remove(s:current_module_stack, -1)
endfunction

function! g:__CurrentMmodulePath__()
    return s:current_module_stack[-1]
endfunction

function! g:__CurrentMmoduleDir__()
    return resolve(fnamemodify(s:current_module_stack[-1], ':h'))
endfunction

function! PathAppend(path)
    let path = substitute(a:path, '^\s*\(.\{-}\)\s*$', '\1', '')

    if path =~ '^\/.*'
        let path = path
    elseif path =~ '^\~\/.*'
        let path = resolve($HOME . path[2:])
    else
        let path = resolve(g:__CurrentMmoduleDir__() . '/' . path)
    end

    if !isdirectory(path)
        echo g:__CurrentMmodulePath__() . ':'
        echo 'Path Error: '. paths .' is not a directory!'
        return s:paths
    end

    call insert(s:paths, path)
    return s:paths
endfunction
command! -nargs=1 PathAppend call g:PathAppend(<f-args>)

let g:__module_tmp__ = {}
let s:preload_list = []

function! Require(module_name)

    let module_name = substitute(a:module_name, '^\s*\(.\{-}\)\s*$', '\1', '')

    if module_name !~ '^[_a-zA-Z][_a-zA-z\/\.]*$'
        echo g:__CurrentMmodulePath__() . ':'
        echo 'Error module name: ' . module_name
        return 0
    endif

    for path in insert(copy(s:paths), g:__CurrentMmoduleDir__())

        " @TODO to 
        let module_path = resolve(path . '/' . module_name . '.vimrc')

        if has_key(s:modules, module_path)
            return s:modules[module_path]
        endif

        if filereadable(module_path)

            let preload_index = index(s:preload_list, module_path)
            if  preload_index >= 0
                let require_circle = add(s:preload_list[eval(preload_index):], module_path)
                echo g:__CurrentMmodulePath__() . ':'
                echo  'Warning! Circle Require: ' . join(require_circle, ' -> ')
                return g:__module_tmp__[module_path]
            else
                call add(s:preload_list, module_path)
            endif

            if !has_key(g:__module_tmp__, module_path)
                let g:__module_tmp__[module_path] = {}
                call s:ModulePathPush(module_path)
                exec 'source ' . module_path
                call s:ModulePathPop()
                let s:modules[module_path] = remove(g:__module_tmp__, module_path)
                call add(s:preload_list, module_path)

                call remove(s:preload_list, module_path)
                return s:modules[module_path]
            endif

            call remove(s:preload_list, module_path)
        endif
    endfor

        echo g:__CurrentMmodulePath__() . ':'
    echo 'Can not find module: ' . module_name
    return 0
endfunction
command! -nargs=1 Require call g:Require(<f-args>)

function! Export(...)
    let template = 
                \"let g:__module_tmp__[g:__CurrentMmodulePath__()]['%s'] = function('%s')"
    let result_list = []
    for func in a:000
        call add(result_list, printf(template, split(func, ':')[-1], func))
    endfor
    return join(result_list, "\n")
endfunction

call s:ModulePathPush(resolve(expand('<sfile>:p')))
PathAppend ./
