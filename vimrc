""""""""""""""""""""""""""""""""""""""""
" BlxVimrc
"
" auth:     brambles
" email:    qjnight@gmail.com
" date:     2015-2-18
"

let base_path = fnamemodify(resolve(expand('<sfile>:p')), ':h')
exec 'source ' . resolve(base_path . '/require.vimrc')

let config = Require('config')
let utils = Require('utils')

Require modules
