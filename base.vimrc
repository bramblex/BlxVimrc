
function Module.Define()
    let g:utils = Require('utils')

    call Require('rc')
    if has('nvim')
        call Require('neo')
    endif

endfunction
