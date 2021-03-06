" Set standard starting window size
if &diff
  set lines=40 columns=160
else
  " NERDTree == 20 + 80 for code
  set lines=40 columns=100
endif

if has("gui_gtk2")
  " runtime mswin.vim
  set guifont=Monospace\ 10
  " set guioptions=egmrLT

elseif has("gui_macvim")
  set guifont=Menlo:h12
  " set guioptions=egmrLt
  set transparency=0
  au FocusLost * set transp=5
  au FocusGained * set transp=0

  " Fullscreen takes up entire screen
  set fuoptions=maxhorz,maxvert

  " cmd+return for fullscreen
  macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-CR>

  " cmd+shift+f for Ack
  map <D-F> :Ack<space>

  " cmd+/ to toggle comments
  map <D-/> <plug>NERDCommenterToggle<CR>
  imap <D-/> <Esc><plug>NERDCommenterToggle<CR>i

  " cmd+d to toggle NERDTree
  map <D-d> :execute 'NERDTreeToggle ' . getcwd()<CR>
  imap <D-d> <Esc>:execute 'NERDTreeToggle ' . getcwd()<CR>i

  " cmd-[/] to increase/decrease indentation
  vmap <D-]> >gv
  vmap <D-[> <gv
  map <D-]> >>
  map <D-[> <<

  " Map Command-# to switch tabs
  map  <D-0> 0gt
  imap <D-0> <Esc>0gt
  map  <D-1> 1gt
  imap <D-1> <Esc>1gt
  map  <D-2> 2gt
  imap <D-2> <Esc>2gt
  map  <D-3> 3gt
  imap <D-3> <Esc>3gt
  map  <D-4> 4gt
  imap <D-4> <Esc>4gt
  map  <D-5> 5gt
  imap <D-5> <Esc>5gt
  map  <D-6> 6gt
  imap <D-6> <Esc>6gt
  map  <D-7> 7gt
  imap <D-7> <Esc>7gt
  map  <D-8> 8gt
  imap <D-8> <Esc>8gt
  map  <D-9> 9gt
  imap <D-9> <Esc>9gt

  " Command-Option-ArrowKey to switch viewports
  map <D-M-Up> <C-w>k
  imap <D-M-Up> <Esc> <C-w>k
  map <D-M-Down> <C-w>j
  imap <D-M-Down> <Esc> <C-w>j
  map <D-M-Right> <C-w>l
  imap <D-M-Right> <Esc> <C-w>l
  map <D-M-Left> <C-w>h
  imap <D-M-Left> <C-w>h
elseif has("gui_win32")
  set guifont=Consolas:h11,Lucida\ Console:h12
endif

" Adjust viewports to the same size
map <Leader>= <C-w>=
imap <Leader>= <Esc> <C-w>=

" Turn off toolbar
set guioptions-=T
map <silent> <C-F1> :call ToggleGuiOption("T")<CR>

" Project tree
autocmd VimEnter * call s:CdIfDirectory(expand("<amatch>"))
autocmd FocusGained * call s:UpdateNERDTree()
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

" If the parameter is a directory, cd into it
function s:CdIfDirectory(directory)
  let explicitDirectory = isdirectory(a:directory)
  let directory = explicitDirectory || empty(a:directory)

  if explicitDirectory
    exe "cd " . fnameescape(a:directory)
  endif

  " Allows reading from stdin
  " ex: git diff | mvim -R -
  if strlen(a:directory) == 0 
    return
  endif

  if directory
    NERDTree
    wincmd p
    bd
  endif

  if explicitDirectory
    wincmd p
  endif
endfunction

" NERDTree utility function
function s:UpdateNERDTree(...)
  let stay = 0

  if(exists("a:1"))
    let stay = a:1
  end

  if exists("t:NERDTreeBufName")
    let nr = bufwinnr(t:NERDTreeBufName)
    if nr != -1
      exe nr . "wincmd w"
      exe substitute(mapcheck("R"), "<CR>", "", "")
      if !stay
        wincmd p
      end
    endif
  endif
endfunction


" Show fold previews
if has("ballooneval")
  set balloonexpr=FoldBalloon()
  set ballooneval

  " Disable ftplugin/ruby.vim balloon ri eval
  autocmd FileType ruby set balloonexpr=FoldBalloon()
endif

"
" FUNCTIONS
"

function ToggleGuiOption(option)
    " If a:option is already set in guioptions, then we want to remove it
    if match(&guioptions, "\\C" . a:option) > -1
	exec "set guioptions-=" . a:option
    else
	exec "set guioptions+=" . a:option
    endif
endfunction

function! FoldBalloon()
  let foldStart = foldclosed(v:beval_lnum)
  let foldEnd = foldclosedend(v:beval_lnum)
  let lines = []

  " Detect if in a fold
  if foldStart > 0
    let numLines = foldEnd - foldStart + 1
    if (numLines > 31)
      let lines = getline(foldStart, foldStart + 14)
      let lines += [ '...' ]
      let lines += getline(foldEnd - 14, foldEnd)
    else
      let lines = getline(foldStart, foldEnd)
    endif
  endif

  return join(lines, has("balloon_multiline") ? "\n" : " ")
endfunction

