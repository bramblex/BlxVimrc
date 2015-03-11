
let dict = Require('dict') 

command! -nargs=1 Dict call dict.Dict(<f-args>)
nnoremap <leader>t :Dict 

vnoremap <leader>t :call dict.DictSelectedWord()<cr>



