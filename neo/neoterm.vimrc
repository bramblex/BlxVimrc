
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

tnoremap <C-n> :bn<CR>
tnoremap <C-p> :bp<CR>
tnoremap <leader>d :bd!<CR>

noremap <leader>c :call g:OpenTerminal()<cr>
function g:OpenTerminal()
    echo winheight(0)
    if winheight(0) > 40
        below new
    endif
    exec "terminal " . $SHELL
endfunction
