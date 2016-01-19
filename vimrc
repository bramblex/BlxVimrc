""""""""""""""""""""""""""""""""""""""""
" BlxVimrc
"
" auth:     brambles
" email:    qjnight@gmail.com
" date:     2015-2-18

let g:require_base_module = resolve(expand('<sfile>:p'))
exec 'source ' . resolve(fnamemodify(g:require_base_module, ':h'). '/require.vimrc')
call Require('./')

