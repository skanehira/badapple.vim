" badapple
" Version: 0.0.1
" Author: skanehira
" License: MIT

if exists('g:loaded_badapple')
    finish
endif

let g:loaded_badapple = 1

let s:save_cpo = &cpo
set cpo&vim

command! BadApple call badapple#play()

let &cpo = s:save_cpo
unlet s:save_cpo

" vim:set et:
