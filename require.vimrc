""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Require Module for VimScript
"
"   Auth:       Brambles
"   Email:      qjnight@gmail.com
"   Respone:    https://github.com/bramblex/BlxVimrc.git
"   Date:       Wed Jun 17 2015
"
"=================== Configure ==============================
let s:conf = {}
let s:conf.module_subfix = '.vimrc'
let s:conf.package_mainfile = 'base' . s:conf.module_subfix

"=============== Path =====================================
let s:path = {}
let s:path.separator = '/'

function s:path.trip(str)
    return  substitute(a:str, '^\s*\(.\{-}\)\s*$', '\1', '')
endfunction

function s:path.join(...)
    return simplify(join(a:000, self.separator))
endfunction

function s:path.file_name(path)
    let path = self.trip(a:path)
    if path[-1] == self.separator
        let path = path[0: -2]
    endif
    return join(split(fnamemodify(path, ':t'), '.')[0: -2], '')
endfunction

function s:path.absolute(path)
    return resolve(a:path)
endfunction

function s:path.expand(base, path)
endfunction

"================= Module Context  ==========================
let s:context = {}
let s:context.__content__ = []

function s:context.push(path)

    let c = {}
    let c.path = a:path
    let c.real_path = s:path.absolute(a:path)
    let c.dirname = fnamemodify(a:path, ':h')

    call add(self.__content__, c)
    let g:Module = self.__content__[-1]
endfunction

function s:context.pop()
    call remove(self.__content__, -1)
    let g:Module = self.__content__[-1]
endfunction

if !exists('g:require_base_module')
    let g:require_base_module = expand('<sfile>:p')
end
call s:context.push(g:require_base_module)

"================= Load & Excute & Stroe module ============
let s:Modules = {}
function s:LoadModule(module_path, force)
    "===================
    call s:context.push(a:module_path)

    if has_key(s:Modules, g:Module.real_path) && !a:force
        return s:Modules[g:Module.real_path]
    endif

    let s:Modules[g:Module.real_path] = {}
    let l:module = s:Modules[g:Module.real_path]

    exec 'source ' . a:module_path
    if has_key(g:Module, 'Define')

        if has('patch1584')
            let l:Define = function(g:Module.Define)
            let l:module.Define = l:Define
            call l:module.Define()
        else
            let l:Define = g:Module.Define
            let l:module.Define = l:Define
            call l:module.Define()
            if l:module.Define == l:Define
                call remove(l:module, 'Define')
            endif
        endif

    endif

    call s:context.pop()
    "===================

    return l:module
endfunction

"================ Require Interface ========================
function Require(module_name)
    let module_path = s:path.absolute(
                \s:path.join(g:Module.dirname, s:path.trip(a:module_name)))

    if isdirectory(module_path)
        let package_mainfile = s:path.join(module_path, s:conf.package_mainfile)
        if filereadable(package_mainfile)
            return s:LoadModule(package_mainfile, 0)
        endif
    endif

    let module_file_path = module_path . s:conf.module_subfix
    if filereadable(module_file_path)
        return s:LoadModule(module_file_path, 0)
    endif

    echoerr 'BLXE002: Can not find module or package: ' . a:module_name
                \ . ' in ' . g:Module.path
endfunction

" Vim
" vim: set filetype=vim
"
" Emacs
" -*- mode: vim; -*-
