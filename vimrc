""""""""""""""""""""""""""""""""""""""""
" BlxVimrc
" auth:     brambles
" email:    qjnight@gmail.com
" date:     2015-2-18
"

let s:base_path = fnamemodify(resolve(expand('<sfile>:p')), ':h')
exec 'source ' . s:base_path . '/require.vimrc' 

let config = Require('config') 
Require base
