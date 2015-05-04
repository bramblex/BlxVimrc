""""""""""""""""""""""""""""""""""""""""
" BlxVimrc
"
" auth:     brambles
" email:    qjnight@gmail.com
" date:     2015-2-18


let g:require_base_module = resolve(expand('<sfile>:p'))
exec 'source ' . resolve(fnamemodify(g:require_base_module, ':h'). '/require.vimrc')

let g:config = Require('config')
let g:utils = Require('utils')

call Require('modules')

let g:test = Require('lib/test')
if $TEST == 'true'
    Require('test')
end

" set for NeoVim
set ttimeoutlen=0
