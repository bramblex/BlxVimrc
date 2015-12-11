function Module.Define()

    call Require('default') 

    call Require('head') 

    call Require('bundle') 
    call Require('hotkeys') 
    call Require('themes') 
    call Require('type') 

    call Require('tail') 

    if has('nvim')
        call Require('neo')
    endif
endfunction
