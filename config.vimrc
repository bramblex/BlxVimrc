""""""""""""""""""""""""""""""""""""""""
"   configuration 
" 
exec Info('vesrion', 'v0.1')

let s:config = {}

" Base Path
let s:config['base_path'] = fnamemodify(resolve(expand('<sfile>:p')), ':h')

" Path for Dict
let s:config['dict_path'] = '/Users/brambles/Local/usr/bin/dict-nocolor'

" Path To Path
call add(Path(), s:config['base_path'] . '/modules')
call add(Path(), s:config['base_path'] . '/utils')

function s:Get(key)
    return s:config[a:key]
endfunction
exec Public('s:Get')
