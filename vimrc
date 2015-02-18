
""""""""""""""""""""""""""""""""""""""""
" BlxVimrc
" auth:     brambles
" email:    qjnight@gmail.com
" date:     2015-2-18
"

let script_file = [ 'bundle', 'base', 'hotkeys', 'themes', ]
let base_path = fnamemodify(resolve(expand('<sfile>:p')), ':h')

for script in script_file
    let file_path = base_path . '/' . script . '.vimrc'
    exec 'source' . file_path
endfor

" End
""""""""""""""""""""""""""""""""""""""""
