""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Require Module for VimScript
"
"   Auth:       Brambles
"   Email:      qjnight@gmail.com
"   Respone:    http://https://github.com/bramblex/BlxVimrc.git
"   Date:       Mar 4 2015
"
"

let s:path = add([], fnamemodify(resolve(expand('<sfile>:p')), ':h'))
let s:Modules = {}

function! g:Path()
    return s:path
endfunction

function! g:Modules()
    return deepcopy(s:Modules)
endfunction

let g:module_load_tmp = {}
let s:pre_load_tmp = []

function! g:Require(module)
    let module = split(a:module, ' ')[0]

    if has_key(s:Modules, module)
        return s:Modules[module]
    endif

    if index(s:pre_load_tmp, module) >= 0
        echo 'Warning! Circle Require: ' . module
        return g:module_load_tmp[module]
    else
        call add(s:pre_load_tmp, module)
    endif

    for modules_path in s:path
        let m = modules_path.'/'.module.'.vimrc'
        if filereadable(m)
            if !has_key(g:module_load_tmp, module)
                let g:module_load_tmp[module] = {}
            endif
            let g:module_load_tmp[module]['__module__'] = {'path': m}
            exec 'source '.m
            let s:Modules[module] = g:module_load_tmp[module]
            call remove(g:module_load_tmp, module)
            call remove(s:pre_load_tmp, index(s:pre_load_tmp, module))
            return s:Modules[module]
        endif
    endfor

    if !has_key(s:Modules, module)
        echo 'Can not find module: ' . module
        call remove(s:pre_load_tmp, index(s:pre_load_tmp, module))
    endif

    return 0
endfunction
command! -nargs=1 Require call g:Require(<f-args>)

function! g:Public(...)
    let result_list = []
    let template = "let g:module_load_tmp[%s]['%s'] = function('%s')\n"
    for func in a:000
        call add(result_list, printf(template,
                    \"split(expand('<sfile>:t'), '\\.')[-2]",
                    \split(func, ':')[-1],
                    \func))
    endfor
    return join(result_list)
endfunction

function! g:Info(key, value)

    let template = "let g:module_load_tmp[%s]['__module__']['%s'] = ('%s')\n"
    return printf(template,
                    \"split(expand('<sfile>:t'), '\\.')[-2]",
                    \a:key,
                    \a:value)
endfunction
