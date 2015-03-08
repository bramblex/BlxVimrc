""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  适用于 Vimscript 的模块系统
"
"   Auth:       Brambles
"   Email:      qjnight@gmail.com
"   Respone:    http://https://github.com/bramblex/BlxVimrc.git
"   Date:       Mar 4 2015
"
"

" 储存已加载的模块列表。
function! Get(value, default)
    if exists(a:value)
        exec 'return '.a:value
    else
        return a:default
    endif
endfunction

"  配置
let s:path = add([], fnamemodify(resolve(expand('<sfile>:p')), ':h'))
let s:Modules = {}


function! g:Path()
    return s:path
endfunction

function! g:Modules()
    return deepcopy(s:Modules)
endfunction

" 缓存变量
let g:Tmp = {}

" 模块加载函数
" 普通函数
let s:pre_load_tmp = []
function! g:Require(module)
    let module = split(a:module, ' ')[0]

    if has_key(s:Modules, module)
        return s:Modules[module]
    endif

    if index(s:pre_load_tmp, module) >= 0
        echo 'Bad Require: ' . module
        return 0
    else
        call add(s:pre_load_tmp, module)
    endif

    for modules_path in s:path
        let m = modules_path.'/'.module.'.vimrc'
        if filereadable(m)
            let g:Tmp[module] = {}
            let g:Tmp[module]['__module__'] = {'path': m}
            exec 'source '.m
            let s:Modules[module] = g:Tmp[module]
            call remove(g:Tmp, module)
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


" 模块中的 public 接口，定义模块中可以被访问的函数
" 元函数，用 exec 调用
function! g:Public(...)
    let result_list = []
    let template = "let g:Tmp[%s]['%s'] = function('%s')"
    for func in a:000
        call add(result_list, printf(template,
                    \"split(expand('<sfile>:t'), '\\.')[-2]",
                    \split(func, ':')[-1],
                    \func))
    endfor
    return join(result_list)
endfunction

function! g:Info(key, value)

    let template = "let g:Tmp[%s]['__module__']['%s'] = ('%s')"
    return printf(template,
                    \"split(expand('<sfile>:t'), '\\.')[-2]",
                    \a:key,
                    \a:value)
endfunction
