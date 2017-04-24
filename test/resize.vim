let s:suite = themis#suite('Test for window resize.')
let s:assert = themis#helper('assert')

function! s:suite.before_each()
  call BeforeEach()
endfunction

function! s:suite.vnew_bel5new_topnew_quit()
  vnew
  below 5 new
  let old_state = State()
  top new
  quit
  let new_state = State()
  call s:assert.equals(old_state, new_state)
endfunction

function! s:suite.vnew_5new_topnew_quit()
  vnew
  5 new
  let old_state = State()
  top new
  quit
  let new_state = State()
  call s:assert.equals(old_state, new_state)
endfunction

function! s:suite.belvnew_bel5new_topnew_quit()
  below vnew
  below 5 new
  let old_state = State()
  top new
  quit
  let new_state = State()
  call s:assert.equals(old_state, new_state)
endfunction

function! s:suite.belvnew_5new_topnew_quit()
  below vnew
  5 new
  let old_state = State()
  top new
  quit
  let new_state = State()
  call s:assert.equals(old_state, new_state)
endfunction

function! s:suite.belvnew_bel2new_2new_topnew_quit()
  below vnew
  bel 2 new
  wincmd k
  2 new
  let old_state = State()
  top new
  quit
  let new_state = State()
  call s:assert.equals(old_state, new_state)
endfunction

function! s:suite.vnew_bel5new_botnew_quit()
  vnew
  below 5 new
  let old_state = State()
  bot new
  quit
  let new_state = State()
  call s:assert.equals(old_state, new_state)
endfunction

function! s:suite.vnew_5new_botnew_quit()
  vnew
  5 new
  let old_state = State()
  bot new
  quit
  let new_state = State()
  call s:assert.equals(old_state, new_state)
endfunction

function! s:suite.belvnew_bel5new_botnew_quit()
  below vnew
  below 5 new
  let old_state = State()
  bot new
  quit
  let new_state = State()
  call s:assert.equals(old_state, new_state)
endfunction

function! s:suite.belvnew_5new_botnew_quit()
  below vnew
  5 new
  let old_state = State()
  bot new
  quit
  let new_state = State()
  call s:assert.equals(old_state, new_state)
endfunction

function! s:suite.vnew_bel5new_topnew_tabnew_quit_quit()
  vnew
  below 5 new
  let old_state = State()
  top new
  tabnew
  quit
  quit
  let new_state = State()
  call s:assert.equals(old_state, new_state)
endfunction

function! s:suite.vnew_5new_topnew_tabnew_quit_quit()
  vnew
  5 new
  let old_state = State()
  top new
  tabnew
  quit
  quit
  let new_state = State()
  call s:assert.equals(old_state, new_state)
endfunction

function! s:suite.belvnew_bel5new_topnew_tabnew_quit_quit()
  below vnew
  below 5 new
  let old_state = State()
  top new
  tabnew
  quit
  quit
  let new_state = State()
  call s:assert.equals(old_state, new_state)
endfunction

function! s:suite.belvnew_5new_topnew_tabnew_quit_quit()
  below vnew
  5 new
  let old_state = State()
  top new
  tabnew
  quit
  quit
  let new_state = State()
  call s:assert.equals(old_state, new_state)
endfunction

function! s:suite.vnew_bel5new_botnew_tabnew_quit_quit()
  vnew
  below 5 new
  let old_state = State()
  bot new
  tabnew
  quit
  quit
  let new_state = State()
  call s:assert.equals(old_state, new_state)
endfunction

function! s:suite.vnew_5new_botnew_tabnew_quit_quit()
  vnew
  5 new
  let old_state = State()
  bot new
  tabnew
  quit
  quit
  let new_state = State()
  call s:assert.equals(old_state, new_state)
endfunction

function! s:suite.belvnew_bel5new_botnew_tabnew_quit_quit()
  below vnew
  below 5 new
  let old_state = State()
  bot new
  tabnew
  quit
  quit
  let new_state = State()
  call s:assert.equals(old_state, new_state)
endfunction

function! s:suite.belvnew_5new_botnew_tabnew_tabclose_quit()
  below vnew
  5 new
  let old_state = State()
  bot new
  tabnew
  vnew
  tabclose
  quit
  let new_state = State()
  call s:assert.equals(old_state, new_state)
endfunction

function! s:suite.vnew_quit_vnew_quit_vnew()
  5 vnew
  quit
  vnew
  let old_state = State()
  quit
  vnew
  let new_state = State()
  call s:assert.equals(old_state.winrestcmd, new_state.winrestcmd)
endfunction

function! s:suite.new_quit_new_quit_new()
  5 new
  quit
  new
  let old_state = State()
  quit
  new
  let new_state = State()
  call s:assert.equals(old_state.winrestcmd, new_state.winrestcmd)
endfunction
