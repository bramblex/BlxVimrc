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

function! g:PathAppend(path)
    let path = substitute(a:path, '^\s*\(.\{-}\)\s*$', '\1', '')

    if path =~ '^\/.*'
        let path = path
    elseif path =~ '^\~\/.*'
        let path = resolve($HOME . '/' . path[2:])
    else
        let path = resolve(g:__CurrentMmoduleDir__() . '/' . path)
    end

    if !isdirectory(path) 
        echo g:__CurrentMmodulePath__() . ':'
        echo 'Path Error: '. paths .' is not a directory!'
        return s:paths
    end

    if len(s:paths) > 0 && index(s:paths, path) < 0
        return s:paths
    end

    call insert(s:paths, path)
    return s:paths
endfunction
command! -nargs=1 PathAppend call g:PathAppend(<f-args>)

let g:__module_tmp__ = {}
let s:preload_list = []

function! s:LoadModule(module_path)
    let preload_index = index(s:preload_list, a:module_path)
    if  preload_index >= 0
        let require_circle = add(s:preload_list[eval(preload_index):], a:module_path)
        echo g:__CurrentMmodulePath__() . ':'
        echo  'Warning! Circle Require: ' . join(require_circle, ' -> ')
        return g:__module_tmp__[a:module_path]
    else
        call add(s:preload_list, a:module_path)
    endif

    if !has_key(g:__module_tmp__, a:module_path)
        let g:__module_tmp__[a:module_path] = {}
        let g:__module_tmp__[a:module_path]['__module__'] = a:module_path
        call s:ModulePathPush(a:module_path)
        exec 'source ' . a:module_path
        call s:ModulePathPop()
        let s:modules[a:module_path] = remove(g:__module_tmp__, a:module_path)
        call add(s:preload_list, a:module_path)

        call remove(s:preload_list, a:module_path)
        return s:modules[a:module_path]
    endif

    call remove(s:preload_list, a:module_path)
endfunction

function! s:LoadPackage(package_path)
    let package_base = resolve(a:package_path . '/base.vimrc' )
    if filereadable(package_base)
        return s:LoadModule(package_base)
    else
        echo g:__CurrentMmodulePath__() . ':'
        echo 'Cannot Load Package Base File: ' . package_base
    end
endfunction

function! g:Require(module_name)

    let module_name = substitute(a:module_name, '^\s*\(.\{-}\)\s*$', '\1', '')

    if module_name !~ '^[_a-zA-Z][_a-zA-z\/\.]*$'
        echo g:__CurrentMmodulePath__() . ':'
        echo 'Error module name: ' . module_name
        return 0
    endif

    for path in insert(copy(s:paths), g:__CurrentMmoduleDir__())

        " @TODO to 
        let module_path = resolve(path . '/' . module_name . '.vimrc')
        let package_path = resolve(path . '/' . module_name)

        if has_key(s:modules, module_path)
            return s:modules[module_path]
        endif

        if isdirectory(package_path)
            return s:LoadPackage(package_path)
        end

        if filereadable(module_path)
            return s:LoadModule(module_path)
        endif

    endfor

        echo g:__CurrentMmodulePath__() . ':'
    echo 'Can not find module: ' . module_name
    return 0
endfunction
command! -nargs=1 Require call g:Require(<f-args>)

function! g:Exports(key, value)
    let g:__module_tmp__[g:__CurrentMmodulePath__()][a:key] = a:value
    return function('g:Exports')
endfunction

" init
call s:ModulePathPush(resolve(expand('<sfile>:p')))
PathAppend ./

" Vim
" vim: set filetype=vim
"
" Emacs
" -*- mode: vim; -*-
