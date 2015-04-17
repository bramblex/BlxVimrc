
command! -nargs=1 Dict call utils.dict.Dict(<f-args>)
nnoremap <leader>t :Dict 

vnoremap <leader>t :call utils.dict.DictSelectedWord()<cr>

command! -nargs=1 Say call utils.dict.Say(<f-args>)
vnoremap <leader>s :call utils.dict.SayBySelected()<cr>
