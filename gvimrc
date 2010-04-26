"colorscheme macdev
"set background=light

"colorscheme zenburn
"hi normal guibg=black
"set background=dark

colorscheme github
set background=light

" Set standard starting window size
set lines=24 columns=80

if has("gui_gtk2")
  " runtime mswin.vim
  set guifont=Monospace\ 10
  set guioptions-=T
  " set guioptions=egmrLT
elseif has("gui_macvim")
  " let macvim_hig_shift_movement = 1
  set guifont=Menlo:h12
  " set guioptions=egmrLt
  set guioptions-=T
  set transparency=0
  au FocusLost * set transp=5
  au FocusGained * set transp=0
elseif has("gui_win32")
  set guifont=Consolas:h12,Lucida\ Console:h12
endif

" Mappings
map <silent> <C-F1> :call ToggleGuiOption("T")<CR>

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

