let s:suite = themis#suite('Test for window focus.')
let s:assert = themis#helper('assert')

function! s:suite.before_each()
  call BeforeEach()
endfunction

function! s:suite.belvnew_topnew_quit()
  below vnew
  let old_state = State()
  top new
  quit
  let new_state = State()
  call s:assert.equals(old_state, new_state)
endfunction

function! s:suite.vnew_belvnew_topnew_quit()
  vnew
  below vnew
  let old_state = State()
  top new
  quit
  let new_state = State()
  call s:assert.equals(old_state, new_state)
endfunction

function! s:suite.vnew_belvnew_topnew_botnew_quit()
  vnew
  below vnew
  let old_state = State()
  top new
  bot new
  quit
  quit
  let new_state = State()
  call s:assert.equals(old_state, new_state)
endfunction

function! s:suite.vnew_belvnew_5split_topnew_botnew_quit()
  vnew
  below vnew
  5 split
  let old_state = State()
  top new
  bot new
  quit
  quit
  let new_state = State()
  call s:assert.equals(old_state, new_state)
endfunction

function! s:suite.belnew_topvnew_quit()
  below new
  let old_state = State()
  top vnew
  quit
  let new_state = State()
  call s:assert.equals(old_state, new_state)
endfunction

function! s:suite.new_belnew_topvnew_quit()
  new
  below new
  let old_state = State()
  top vnew
  quit
  let new_state = State()
  call s:assert.equals(old_state, new_state)
endfunction

function! s:suite.new_belnew_botnew_quit()
  new
  below new
  let old_state = State()
  bot new
  quit
  let new_state = State()
  call s:assert.equals(old_state, new_state)
endfunction

function! s:suite.new_belnew_20vsplit_botvnew_quit()
  new
  below new
  20 vsplit
  let old_state = State()
  bot vnew
  quit
  let new_state = State()
  call s:assert.equals(old_state, new_state)
endfunction
