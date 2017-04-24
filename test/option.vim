let s:suite = themis#suite('Test for window height after changing global options.')
let s:assert = themis#helper('assert')

function! s:suite.before_each()
  call BeforeEach()
endfunction

function! Tabline() abort
  return &showtabline > 1 || (&showtabline > 0 && tabpagenr('$') > 1)
endfunction

function! TestShowTabline(old, new) abort
  let &showtabline = a:old
  tabnew
  below vnew
  below 5 new
  let old_height = winheight(2) + winheight(3) + Tabline() + &cmdheight
  top new
  let &showtabline = a:new
  quit
  let new_height = winheight(2) + winheight(3) + Tabline() + &cmdheight
  call s:assert.equals(old_height, new_height)
endfunction

function! s:suite.showtabline0_belvnew_belnew_topnew_showtabline0_quit()
  call TestShowTabline(0, 0)
endfunction

function! s:suite.showtabline0_belvnew_belnew_topnew_showtabline2_quit()
  call TestShowTabline(0, 2)
endfunction

function! s:suite.showtabline2_belvnew_belnew_topnew_showtabline0_quit()
  call TestShowTabline(2, 0)
endfunction

function! s:suite.showtabline2_belvnew_belnew_topnew_showtabline2_quit()
  call TestShowTabline(2, 2)
endfunction

function! TestCmdHeight(old, new) abort
  let &cmdheight = a:old
  tabnew
  below vnew
  below 5 new
  let old_height = winheight(2) + winheight(3) + Tabline() + &cmdheight
  top new
  let &cmdheight = a:new
  quit
  let new_height = winheight(2) + winheight(3) + Tabline() + &cmdheight
  call s:assert.equals(old_height, new_height)
endfunction

function! s:suite.cmdheight1_belvnew_belnew_topnew_cmdheight1_quit()
  call TestCmdHeight(1, 1)
endfunction

function! s:suite.cmdheight1_belvnew_belnew_topnew_cmdheight5_quit()
  call TestCmdHeight(1, 5)
endfunction

function! s:suite.cmdheight5_belvnew_belnew_topnew_cmdheight1_quit()
  call TestCmdHeight(5, 1)
endfunction

function! s:suite.cmdheight5_belvnew_belnew_topnew_cmdheight5_quit()
  call TestCmdHeight(5, 5)
endfunction

function! TestShowTablineCmdHeight(old_showtabline, old_cmdheight, new_showtabline, new_cmdheight) abort
  let &showtabline = a:old_showtabline
  let &cmdheight = a:old_cmdheight
  tabnew
  below vnew
  below 5 new
  let old_height = winheight(2) + winheight(3) + Tabline() + &cmdheight
  top new
  let &showtabline = a:new_showtabline
  let &cmdheight = a:new_cmdheight
  quit
  let new_height = winheight(2) + winheight(3) + Tabline() + &cmdheight
  call s:assert.equals(old_height, new_height)
endfunction

function! s:suite.showtabline0_cmdheight1_belvnew_belnew_topnew_showtabline2_cmdheight5_quit()
  call TestShowTablineCmdHeight(0, 1, 2, 5)
endfunction

function! s:suite.showtabline0_cmdheight5_belvnew_belnew_topnew_showtabline2_cmdheight1_quit()
  call TestShowTablineCmdHeight(0, 5, 2, 1)
endfunction

function! s:suite.showtabline2_cmdheight1_belvnew_belnew_topnew_showtabline0_cmdheight5_quit()
  call TestShowTablineCmdHeight(2, 1, 0, 5)
endfunction

function! s:suite.showtabline2_cmdheight5_belvnew_belnew_topnew_showtabline0_cmdheight1_quit()
  call TestShowTablineCmdHeight(2, 5, 0, 1)
endfunction
