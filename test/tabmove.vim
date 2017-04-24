let s:suite = themis#suite('Test for window resize after tabmove.')
let s:assert = themis#helper('assert')

function! s:suite.before_each()
  call BeforeEach()
endfunction

function! s:suite.vnew_bel5new_topnew_tabmove_quit()
  tabnew
  vnew
  below 5 new
  let old_state = State()
  top new
  -tabmove
  quit
  let new_state = State()
  call s:assert.equals(old_state, new_state)
endfunction

function! s:suite.vnew_5new_topnew_tabmove_quit()
  tabnew
  vnew
  5 new
  let old_state = State()
  top new
  -tabmove
  quit
  let new_state = State()
  call s:assert.equals(old_state, new_state)
endfunction

function! s:suite.belvnew_bel5new_topnew_tabmove_quit()
  tabnew
  below vnew
  below 5 new
  let old_state = State()
  top new
  -tabmove
  quit
  let new_state = State()
  call s:assert.equals(old_state, new_state)
endfunction

function! s:suite.belvnew_5new_topnew_tabmove_quit()
  tabnew
  below vnew
  5 new
  let old_state = State()
  top new
  -tabmove
  quit
  let new_state = State()
  call s:assert.equals(old_state, new_state)
endfunction

function! s:suite.belvnew_bel5new_5new_topnew_tabmove_quit()
  tabnew
  below vnew
  bel 5 new
  wincmd k
  5 new
  let old_state = State()
  top new
  -tabmove
  quit
  let new_state = State()
  call s:assert.equals(old_state, new_state)
endfunction

function! s:suite.vnew_bel5new_botnew_tabmove_quit()
  tabnew
  vnew
  below 5 new
  let old_state = State()
  bot new
  -tabmove
  quit
  let new_state = State()
  call s:assert.equals(old_state, new_state)
endfunction

function! s:suite.vnew_5new_botnew_tabmove_quit()
  tabnew
  vnew
  5 new
  let old_state = State()
  bot new
  -tabmove
  quit
  let new_state = State()
  call s:assert.equals(old_state, new_state)
endfunction

function! s:suite.belvnew_bel5new_botnew_tabmove_quit()
  tabnew
  below vnew
  below 5 new
  let old_state = State()
  bot new
  -tabmove
  quit
  let new_state = State()
  call s:assert.equals(old_state, new_state)
endfunction

function! s:suite.belvnew_5new_botnew_tabmove_quit()
  tabnew
  below vnew
  5 new
  let old_state = State()
  bot new
  -tabmove
  quit
  let new_state = State()
  call s:assert.equals(old_state, new_state)
endfunction

function! s:suite.vnew_bel5new_topnew_tabnew_quit_tabmove_quit()
  tabnew
  vnew
  below 5 new
  let old_state = State()
  top new
  tabnew
  quit
  -tabmove
  quit
  let new_state = State()
  call s:assert.equals(old_state, new_state)
endfunction

function! s:suite.vnew_5new_topnew_tabnew_quit_tabmove_quit()
  tabnew
  vnew
  5 new
  let old_state = State()
  top new
  tabnew
  quit
  -tabmove
  quit
  let new_state = State()
  call s:assert.equals(old_state, new_state)
endfunction

function! s:suite.belvnew_bel5new_topnew_tabnew_quit_tabmove_quit()
  tabnew
  below vnew
  below 5 new
  let old_state = State()
  top new
  tabnew
  quit
  -tabmove
  quit
  let new_state = State()
  call s:assert.equals(old_state, new_state)
endfunction

function! s:suite.belvnew_5new_topnew_tabnew_quit_tabmove_quit()
  tabnew
  below vnew
  5 new
  let old_state = State()
  top new
  tabnew
  quit
  -tabmove
  quit
  let new_state = State()
  call s:assert.equals(old_state, new_state)
endfunction

function! s:suite.vnew_bel5new_botnew_tabnew_quit_tabmove_quit()
  tabnew
  vnew
  below 5 new
  let old_state = State()
  bot new
  tabnew
  quit
  -tabmove
  quit
  let new_state = State()
  call s:assert.equals(old_state, new_state)
endfunction

function! s:suite.vnew_5new_botnew_tabnew_quit_tabmove_quit()
  tabnew
  vnew
  5 new
  let old_state = State()
  bot new
  tabnew
  quit
  -tabmove
  quit
  let new_state = State()
  call s:assert.equals(old_state, new_state)
endfunction

function! s:suite.belvnew_bel5new_botnew_tabnew_quit_tabmove_quit()
  tabnew
  below vnew
  below 5 new
  let old_state = State()
  bot new
  tabnew
  quit
  -tabmove
  quit
  let new_state = State()
  call s:assert.equals(old_state, new_state)
endfunction

function! s:suite.belvnew_5new_botnew_tabnew_tabclose_tabmove_tabonly_quit()
  tabnew
  below vnew
  5 new
  let old_state = State()
  bot new
  tabnew
  vnew
  tabclose
  -tabmove
  tabonly
  quit
  tabnew
  tabnext
  let new_state = State()
  call s:assert.equals(old_state, new_state)
endfunction
