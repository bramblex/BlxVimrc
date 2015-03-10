""""""""""""""""""""""""""""""""""""""""
" 各種配置
" 
exec Info('vesrion', 'v0.1')

let s:config = {}

" 主要配置
let s:config['base_path'] = fnamemodify(resolve(expand('<sfile>:p')), ':h')

" 找库的路径
call add(Path(), s:config['base_path'] . '/modules')
call add(Path(), s:config['base_path'] . '/utils')

function s:Get(key)
    return s:config[a:key]
endfunction
exec Public('s:Get')
