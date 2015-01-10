" =============================================================================
" Filename: plugin/winfix.vim
" Author: itchyny
" License: MIT License
" Last Change: 2015/01/10 14:35:27.
" =============================================================================

if exists('g:loaded_winfix') || v:version < 700
  finish
endif
let g:loaded_winfix = 1

let s:save_cpo = &cpo
set cpo&vim

augroup winfix
  autocmd!
  autocmd TabEnter,WinEnter,BufEnter * call winfix#enter()
augroup END

let &cpo = s:save_cpo
unlet s:save_cpo
