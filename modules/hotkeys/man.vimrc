
command! -nargs=1 Man call utils.man.Man(<f-args>)
nnoremap <leader>m :Man 

vnoremap <leader>m :call utils.man.ManBySelected()<cr>
