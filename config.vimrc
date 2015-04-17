""""""""""""""""""""""""""""""""""""""""
"   configuration 
" 
let s:config = {}

" Base Path
let s:config['base_path'] = fnamemodify(resolve(expand('<sfile>:p')), ':h')

" Path for Dict
let s:config['dict_path'] = '/Users/brambles/Local/usr/bin/dict-nocolor'

" Add Path
call PathAppend(s:config['base_path'] . '/modules')
call PathAppend(s:config['base_path'] . '/utils')

function! s:Get(key)
    return s:config[a:key]
endfunction
exec Export('s:Get')
