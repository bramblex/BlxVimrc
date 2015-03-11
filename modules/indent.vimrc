
let utils = Require('utils') 

" Default
au FileType * call utils.SetTabWidth(4)

" ruby on rails
au FileType ruby,eruby :call utils.SetTabWidth(2)

" html or js
au FileType javascript,html :call utils.SetTabWidth(2)
