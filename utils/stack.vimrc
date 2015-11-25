
function Module.Define()
    " Interface
    "
    function s:stack_push(item)
        call add(self.__stack__, item)
    endfunction

    function s:stack_pop()
        call remove(self.__stack__, -1)
    endfunction

    function s:stack_top()
        return self.__stack__[-1]
    endfunction
    
    function self.create()
        let l:object = {}
        let l:object['__stack__'] = []
        let l:object['push'] = function('s:stack_push')
        let l:object['pop'] = function('s:stack_pop')
        let l:object['top'] = function('s:stack_top')

        return l:object
    endfunction

    function self.copy(stack)
        let l:object = self.create()
        let l:object['__stack__'] = copy(stack['__stack__'])
        return l:object
    endfunction

endfunction

" Vim
" vim: set filetype=vim
" Emacs
" -*- mode: vim; -*-
