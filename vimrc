""""""""""""""""""""""""""""""""""""""""
" BlxVimrc
" auth:     brambles
" email:    qjnight@gmail.com
" date:     2015-2-18
"
" desc:
"
"   这个文件不需要动，这里仅仅就是一个模
"   块加载器而已啦！如果需要动的话可以自
"   己写一个模块啥的。
"
"   模块定义的方法：
"       1.在modules目录下新建一个<my_module>.vimrc 的文件。
"
"       2.声明一个需要注册的函数。
"           function MyModule()
"               " 随便干点啥
"           endfunction
"
"       3.最后注册函数。
"           Define(模块名, 依赖的模块列表, 要注册的函数)
"           call Define('MyModule', ['Base', 'Bundle'], function('MyModule'))

let s:modules_define = {}
let s:modules_require = {}
let s:base = fnamemodify(resolve(expand('<sfile>:p')), ':h')

" 声明模块定义函数 Define
function g:Define(name, require, define)
    if has_key(s:modules_define, a:name)
        echo 'Module Cannot Redefine!'
        return
    endif

    if a:name == ''
        echo 'Module Cannot Define By An Empty Name!'
        return
    endif

    let s:modules_require[a:name]=a:require
    let s:modules_define[a:name]=a:define
endfunction

" 声明模块加载的函数　Load
function g:Load(module_name)
    if !has_key(s:modules_define, a:module_name)
        echo 'Module not define:' . a:module_name
        return
    endif

    let l:Module = s:modules_define[a:module_name]
    call l:Module()
endfunction

" 加载modules目录下所有模块的定义
for i in split(globpath(s:base.'/modules','*.vimrc'))
    exec 'source' . i
    unlet i
endfor

" 把模塊進行拓撲排序
function s:TopSort(require_dict)

    " 弹出0入度的节点
    function PopNode(require_list)

        let l:module = ''

        " 找到一个入度为0的节点
        for i in range(0, len(a:require_list) - 1)

            let m = a:require_list[i]
            if empty(m[1])
                let l:module = m[0]
                call remove(a:require_list, i)
                break
            endif

        endfor

        " 找不到入度为0的节点时直接返回，进行错误处理
        if l:module == ''
            return l:module
        endif

        " 将所有依赖它的节点依赖删除
        for i in range(0, len(a:require_list) - 1)

            let m = a:require_list[i]
            let r = index(m[1], l:module)
            if r >= 0
                call remove(m[1], r)
            endif

        endfor

        " 彈出找到的節點
        return l:module
    endfunction

    let l:require_list = items(deepcopy(a:require_dict))
    let l:sorted_list = []

    "
    " 從require_list中彈出入度爲0的節點，直到全部節點彈出。
    "
    " 若require_list不爲空且找不到入度爲0的幾點，
    " 則節點中存在不能處理的依賴(比如循環依賴，或者依賴不存在的模塊)
    "
    while !empty(l:require_list)
        let l:module = PopNode(l:require_list)
        if l:module == ''
            echo 'Load Error:'
            echo join(l:require_list, "\n")
            break
        endif
        call add(l:sorted_list, l:module)
    endwhile

    return l:sorted_list
endfunction

" 加载所有模块
let s:modules_load = s:TopSort(s:modules_require)
for module in s:modules_load
    call g:Load(module)
endfor

" End
""""""""""""""""""""""""""""""""""""""""
