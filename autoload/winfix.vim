" =============================================================================
" Filename: autoload/winfix.vim
" Author: itchyny
" License: MIT License
" Last Change: 2018/12/29 01:41:25.
" =============================================================================

let s:save_cpo = &cpo
set cpo&vim

function! winfix#enter() abort
  if get(g:, 'winfix_enable', 1)
    call winfix#push()
    if !get(s:, 'move')
      if get(g:, 'winfix_tabfocus', 1)
        call winfix#tabfocus()
      endif
      if get(g:, 'winfix_resize', 1)
        call winfix#resize()
      endif
      if get(g:, 'winfix_winfocus', 1)
        call winfix#winfocus()
      endif
      if get(s:, 'move')
        doautocmd WinEnter
      endif
      let s:move = 0
    endif
  endif
endfunction

let s:id = 0
function! winfix#id() abort
  let s:id += 1
  return s:id
endfunction

function! winfix#state() abort
  if !has_key(t:, 'winfix_tabid')
    let t:winfix_tabid = winfix#id()
  endif
  return { 'bufnrs': join(map(range(1, winnr('$')), 'winbufnr(v:val)'), '_'),
        \  'width':  join(map(range(1, winnr('$')), 'winwidth(v:val)'), '_'),
        \  'height': join(map(range(1, winnr('$')), 'winheight(v:val)'), '_'),
        \  'lines': &lines, 'columns': &columns, 'cmdheight': &cmdheight,
        \  'showtabline': &showtabline,
        \  'tabline': &showtabline > 1 || (&showtabline > 0 && tabpagenr('$') > 1),
        \  'winnr': winnr(), 'wincnt': winnr('$'), 'winrestcmd': winrestcmd(),
        \  'tabid': t:winfix_tabid, 'tabcnt': tabpagenr('$') }
endfunction

let s:stack = []
let s:stack_bufnrs = {}
function! winfix#push() abort
  let s:state = winfix#state()
  if len(s:stack) > 0 && get(s:, 'move')
    call remove(s:stack, -1)
  endif
  if len(s:stack) ==# 0 || s:stack[-1] !=# s:state
    call add(s:stack, s:state)
  endif
  if !has_key(s:stack_bufnrs, s:state.bufnrs)
    let s:stack_bufnrs[s:state.bufnrs] = []
  endif
  call add(s:stack_bufnrs[s:state.bufnrs], s:state)
endfunction

function! winfix#resize() abort
  if winnr('$') < 2 || len(s:stack) < 2
        \           || s:stack[-2].tabid !=# s:state.tabid
        \           || s:stack[-2].wincnt <= s:state.wincnt
    return
  endif
  let stack = s:stack_bufnrs[s:state.bufnrs] " for performance
  let i = len(stack) - 2
  while i >= 0
    if stack[i].bufnrs ==# s:state.bufnrs
          \ && (stack[i].width ==# s:state.width
          \ ||  stack[i].height ==# s:state.height)
      if stack[i].winrestcmd !=# s:state.winrestcmd
        silent! noautocmd execute stack[i].winrestcmd
      endif
      if stack[i].lines ==# s:state.lines
            \ && (stack[i].tabline !=# s:state.tabline
            \ ||  stack[i].cmdheight !=# s:state.cmdheight)
        let &lines = s:state.lines
        let &cmdheight = s:state.cmdheight
        let &showtabline = s:state.showtabline
      endif
      break
    endif
    let i -= 1
  endwhile
endfunction

function! winfix#winfocus() abort
  if len(s:stack) < 2 || s:stack[-2].tabid !=# s:state.tabid
        \             || s:stack[-2].wincnt <= s:state.wincnt
    return
  endif
  let i = len(s:stack) - 2
  while i >= 0 && (s:stack[i].tabid !=# s:state.tabid
        \      ||  s:stack[i].wincnt > s:state.wincnt)
    let i -= 1
  endwhile
  if i >= 0 && s:stack[i].bufnrs ==# s:state.bufnrs
    if winnr('$') > 1 && winnr() !=# s:stack[i].winnr
      silent! noautocmd execute s:stack[i].winnr 'wincmd w'
      let s:move = 1
    endif
    call winfix#push()
  endif
endfunction

function! winfix#tabfocus() abort
  if len(s:stack) < 2 || s:stack[-2].tabcnt <= s:state.tabcnt
        \             || s:stack[-2].tabid ==# s:state.tabid
    return
  endif
  let tabnrs = {}
  for i in range(1, tabpagenr('$'))
    if gettabvar(i, 'winfix_tabid') !=# ''
      let tabnrs[gettabvar(i, 'winfix_tabid')] = i
    endif
  endfor
  let i = len(s:stack) - 2
  while i >= 0 && !has_key(tabnrs, s:stack[i].tabid)
    let i -= 1
  endwhile
  if i >= 0
    if tabpagenr('$') > 1 && has_key(tabnrs, s:stack[i].tabid)
      silent! noautocmd execute 'tabnext' tabnrs[s:stack[i].tabid]
      let s:move = 1
    endif
  endif
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
