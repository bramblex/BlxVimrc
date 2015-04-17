
let man = Require('utils/man') 

command! -nargs=1 Man call man.Man(<f-args>)
nnoremap <leader>m :Man 

vnoremap <leader>m :call man.ManBySelected()<cr>
