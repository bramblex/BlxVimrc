""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Require Module for VimScript
"
"   Auth:       Brambles
"   Email:      qjnight@gmail.com
"   Respone:    https://github.com/bramblex/BlxVimrc.git
"   Date:       Fri Apr 17
"
let s:module_subfix = '.vimrc'
let s:package_mainfile = 'base' . s:module_subfix

let s:paths = []
let s:modules = {}
let s:caches = {}

let s:current_module_stack = []

function s:Log(type, message)
    echo g:__CurrentModulePath__() . ':'
    if a:type == 'warning'
        echohl WarningMsg | echo 'WARNING: ' . a:message | echohl None
    elseif a:type == 'error'
        echohl ErrorMsg | echo 'ERROR: ' . a:message | echohl None
    elseif a:type == 'debug'
        echohl Normal | echo 'DEBUG: ' . a:message | echohl None
    else
        throw 'Unkow Log Type'
    endif
endfunction

function s:ModulePathPush(path)
    call add(s:current_module_stack, a:path)
    return a:path
endfunction

function s:ModulePathPop()
    return remove(s:current_module_stack, -1)
endfunction

function g:__CurrentModulePath__()
    return s:current_module_stack[-1]
endfunction

function g:__CurrentModuleDir__()
    return fnamemodify(g:__CurrentModulePath__(), ':h')
endfunction

function g:__CurrentModuleName__()
    return fnamemodify(g:__CurrentModulePath__(), ':t')[ 0: -len(s:module_subfix)-1 ]
endfunction

function PathAppend(path)
    let path = substitute(a:path, '^\s*\(.\{-}\)\s*$', '\1', '')

    if path =~ '^\/.*'
        let path = path
    elseif path =~ '^\~\/.*'
        let path = simplify($HOME . '/' . path[2:])
    else
        let path = simplify(g:__CurrentModuleDir__() . '/' . path)
    end

    if !isdirectory(path) 
        call s:Log('error', path .' is not a directory!')
        return function('PathAppend')
    end

    if len(s:paths) > 0 && index(s:paths, path) < 0
        return function('PathAppend')
    end

    call insert(s:paths, path)
    return function('PathAppend')
endfunction

let g:__module_tmp__ = {}
let s:preload_list = []

function s:LoadModule(module_path)
    let preload_index = index(s:preload_list, a:module_path)
    if  preload_index >= 0
        let require_circle = add(s:preload_list[eval(preload_index):], a:module_path)
        call s:Log('warning', 'Circle Require ' . join(require_circle, ' -> '))
        return g:__module_tmp__[a:module_path]
    else
        call add(s:preload_list, a:module_path)
    endif

    if !has_key(g:__module_tmp__, a:module_path)
        let g:__module_tmp__[a:module_path] = {}
        call s:ModulePathPush(a:module_path)
        exec 'source ' . a:module_path
        call s:ModulePathPop()
        let g:__module_tmp__[a:module_path]['__module__'] = a:module_path
        let s:modules[a:module_path] = remove(g:__module_tmp__, a:module_path)
        call add(s:preload_list, a:module_path)

        call remove(s:preload_list, a:module_path)
        return s:modules[a:module_path]
    endif

    call remove(s:preload_list, a:module_path)
endfunction

function s:LoadPackage(package_path)
    let package_base = simplify(a:package_path . '/' . s:package_mainfile )
    if filereadable(package_base)
        return s:LoadModule(package_base)
    else
        call s:Log('error', 'Cannot load package base file ' . package_base)
    end
endfunction


function s:Cache(module_name, module)
    let c_d = g:__CurrentModuleDir__()
    if !has_key(s:caches, c_d)
        let s:caches[c_d] = {}
    end
    let s:caches[c_d][a:module_name] = a:module
    return a:module
endfunction

function s:SearchCache(module_name)
    let c_d = g:__CurrentModuleDir__()
    if has_key(s:caches, c_d) && has_key(s:caches[c_d], a:module_name)
        return s:caches[c_d][a:module_name]
    end
    return 0
endfunction

function Require(module_name)

    let module_name = substitute(a:module_name, '^\s*\(.\{-}\)\s*$', '\1', '')

    if module_name !~ '^[_a-zA-z\/\.\*]*$'
        call s:Log('error', 'Module name error ' . module_name)
        return 0
    endif

    let cache_module = s:SearchCache(module_name)
    if !empty(cache_module)
        return cache_module
    endif

    let c_d = g:__CurrentModuleDir__()
    if module_name =~ '^\.\.\/' || module_name =~ '^\.\/'
        let paths = [c_d]
    elseif module_name =~ '^\.$'
        let paths = [c_d] 
        let module_name = g:__CurrentModuleName__()
    elseif module_name =~ '^\/'
        let paths = [fnamemodify(module_name, ':h')]
        let module_name = fnamemodify(module_name, ':t')
    elseif module_name =~ '^\*$'
        return s:RequireAll(g:__CurrentModuleDir__())
    else
        let paths = insert(copy(s:paths), c_d)
    endif

    for path in paths

        let module_path = simplify(path . '/' . module_name . s:module_subfix)
        let package_path = simplify(path . '/' . module_name)

        if has_key(s:modules, module_path)
            return s:Cache(module_name, s:modules[module_path])
        endif

        if isdirectory(package_path)
            return s:Cache(module_name, s:LoadPackage(package_path))
        end

        if filereadable(module_path)
            return s:Cache(module_name, s:LoadModule(module_path))
        endif

    endfor

    call s:Log('error', 'Can not find module ' . module_name)
    return 0
endfunction

function s:RequireAll(path)
    let result = {}
    for m in split(globpath(a:path, '*'), '\n')

        if m == g:__CurrentModulePath__()
            continue
        endif

        if m =~ '.*\'.s:module_subfix.'$' && filereadable(m) && !isdirectory(m)
            let m_name = fnamemodify(m, ':t')[ 0: -len(s:module_subfix)-1 ]
            let result[m_name] = Require(m_name)
        elseif isdirectory(m)
            if filereadable(m . s:package_mainfile) 
                        \&& !isdirectory(m . s:package_mainfile)
                let p_name = fnamemodify(m, ':t')
                let result[p_name] = Require(p_name)
            endif
        endif

    endfor
    return result
endfunction

function Exports(key, value)
    let g:__module_tmp__[g:__CurrentModulePath__()][a:key] = a:value
    return function('Exports')
endfunction

function Module(value)
    if type(a:value) != type({})
        call s:Log('error', 'Module should be dict type')
        return 0
    endif

    for item in items(a:value)
        let g:__module_tmp__[g:__CurrentModulePath__()][item[0]] = item[1]
    endfor

    return function('Exports')
endfunction

function Self()
    silent return Require('.')
endfunction

" Append base module
if !exists('g:require_base_module')
    let g:require_base_module = resolve(expand('<sfile>:p'))
end
if !exists('g:require_enable_warring')
    let g:require_enable_warring = 1
end
call s:ModulePathPush(g:require_base_module)

" Set file type to vim
function g:_init_module_file_type_()
    set filetype=vim
    syn keyword vimFuncName contained Require Exports Module PathAppend Self
endfunction
autocmd BufReadPost vimrc,.vimrc,*.vimrc,*.vim call g:_init_module_file_type_()
exec 'autocmd BufReadPost *' . s:module_subfix . ' call g:_init_module_file_type_()'

" Vim
" vim: set filetype=vim
"
" Emacs
" -*- mode: vim; -*-
