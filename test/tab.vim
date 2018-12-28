let s:suite = themis#suite('Test for tab focus.')
let s:assert = themis#helper('assert')
if !(v:version > 703 || v:version == 703 && has('patch551'))
  finish
endif

function! s:suite.before_each()
  call BeforeEach()
endfunction

function! s:suite.tabnew_tabprevious_tabnew_quit()
  tabnew
  tabprevious
  let old_state = State()
  tabnew
  quit
  let new_state = State()
  call s:assert.equals(old_state, new_state)
endfunction

function! s:suite.tabnew_tabnew_tabprevious_tabnew_quit()
  tabnew
  tabnew
  tabprevious
  let old_state = State()
  tabnew
  quit
  let new_state = State()
  call s:assert.equals(old_state, new_state)
endfunction

function! s:suite.tabnew_tabnew_tabfirst_tabnew_quit()
  tabnew
  tabnew
  tabfirst
  let old_state = State()
  tabnew
  quit
  let new_state = State()
  call s:assert.equals(old_state, new_state)
endfunction

function! s:suite.tabnew_tabnew_tabfirst_tabnew_tabclose()
  tabnew
  tabnew
  tabfirst
  let old_state = State()
  tabnew
  below vnew
  vnew
  new
  below vnew
  top new
  below new
  tabfirst
  tabnext
  tabclose
  let new_state = State()
  call s:assert.equals(old_state, new_state)
endfunction

function! s:suite.topnew_tabclose_quit()
  tabnew
  tabnew
  tabfirst
  let old_tabpagenr = tabpagenr()
  tabnew
  below vnew
  below 5 new
  let old_winnr = winnr()
  top new
  3tabclose
  quit
  let new_winnr = winnr()
  tabclose
  let new_tabpagenr = tabpagenr()
  call s:assert.equals(old_tabpagenr, new_tabpagenr)
  call s:assert.equals(old_winnr, new_winnr)
endfunction

function! s:suite.tabnew_tabclose_tabclose()
  tabnew
  tabnew
  tabfirst
  tabnew
  call s:assert.equals(2, tabpagenr())
  tabclose
  call s:assert.equals(1, tabpagenr())
  tabclose
  call s:assert.equals(2, tabpagenr())
endfunction

function! s:suite.tabnext_tabclose_tabclose()
  tabnew
  tabnew
  tabfirst
  tabnext
  call s:assert.equals(2, tabpagenr())
  tabclose
  call s:assert.equals(1, tabpagenr())
  tabclose
  call s:assert.equals(1, tabpagenr())
endfunction

function! s:suite.tabnew_tabclose_tabnew_tabclose()
  tabnew
  tabnew
  tabfirst
  call s:assert.equals(1, tabpagenr())
  tabnew
  call s:assert.equals(2, tabpagenr())
  tabnew
  call s:assert.equals(3, tabpagenr())
  tabclose
  call s:assert.equals(2, tabpagenr())
  tabclose
  call s:assert.equals(1, tabpagenr())
endfunction
