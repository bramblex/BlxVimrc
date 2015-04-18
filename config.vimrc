""""""""""""""""""""""""""""""""""""""""
"   configuration 
" 
let s:config = {}

" Path for Dict
let s:config['dict_path'] = '/Users/brambles/Local/usr/bin/dict-nocolor'

function! s:Get(key)
    return s:config[a:key]
endfunction

call Module(s:config)
            \('Get', function('s:Get'))
