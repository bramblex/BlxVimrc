
" Default
"au BufEnter * :call utils.RefreshFileType(&filetype)
au FileType * :call utils.SetTabWidth(4)

" ruby on rails
au FileType ruby,eruby,coffee,yaml :call utils.SetTabWidth(2)

" html or js
au FileType javascript,html :call utils.SetTabWidth(2)

" netrw
"au BufEnter * :call file.RangerInsteadNertw()
