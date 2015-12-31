
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1

tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

tnoremap <C-n> <C-\><C-n>:tabn<CR>
tnoremap <C-p> <C-\><C-n>:tabp<CR>
tnoremap <leader>d <C-\><C-n>:q!<CR>

noremap <leader>c :call g:OpenTerminal()<cr>
function g:OpenTerminal()
    if winheight(0) > 40
        below new
    else
        tabnew
    endif
    exec "terminal " . $SHELL
endfunction

"au TermOpen * :echo 'aaa'
"au TermClose * :echo 'aaa'
