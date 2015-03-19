
" Ruby on Rails 快捷键设定
let file = Require('file')
nnoremap <leader><leader>r :!rails 

nnoremap <leader><leader>rg :!rails generate 
nnoremap <leader><leader>rgc :!rails generate controller 
nnoremap <leader><leader>rgm :!rails generate model 

nnoremap <leader><leader>rgd :!rails generate migrate 
nnoremap <leader><leader>rdm :!rake  db:migrate 

nnoremap <leader><leader>rt :!rspec 
nnoremap <leader><leader>rt :exec '!rspec ' . file.CurrentFile()
