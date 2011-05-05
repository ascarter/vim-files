set nocompatible

" Initialize pathogen
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

syntax enable
filetype on
filetype plugin on
filetype indent on

" set nowrap
set number
set cursorline
set hlsearch
set incsearch
set ignorecase
set scs
set showtabline=1
set ruler

" Turn off blinking cursor
set guicursor+=n:blinkon0 

"set expandtab
"set softtabstop=2
set smarttab
set smartindent
set autoindent
set backspace=start,eol,indent whichwrap+=<,>,[,]

" Use system clipboard
" set clipboard=unnamed

autocmd FileType javascript set tabstop=4|set shiftwidth=4|set softtabstop=4|set expandtab
autocmd FileType ruby       set tabstop=2|set shiftwidth=2|set softtabstop=2|set expandtab
autocmd FileType rdoc       set tabstop=2|set shiftwidth=2|set softtabstop=2|set expandtab
autocmd FileType eruby      set tabstop=2|set shiftwidth=2|set softtabstop=2|set expandtab
autocmd FileType haml       set tabstop=2|set shiftwidth=2|set softtabstop=2|set expandtab
autocmd FileType sass       set tabstop=2|set shiftwidth=2|set softtabstop=2|set expandtab
autocmd FileType cucumber   set tabstop=2|set shiftwidth=2|set softtabstop=2|set expandtab

set foldenable
set foldmethod=syntax
set foldlevel=10

" Don't create extra files
"set nobackup
"set nowritebackup
"set noswapfile

" Status line
set laststatus=2
" set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
" set statusline=%<[%n]\ %f%(\#%{Tlist_Get_Tagname_By_Line()}%)\ %h%m%r\ %y%=%-14.(%l,%c%V%)\ %P
set statusline=%<[%n]\ %6.f%(\ %h%m%r%)%(\ %{fugitive#statusline()}%)%y%=%11.(%l,%c%V%)\ %P
"set titlestring=%([%n]\ %)%f%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)
set titlestring=%t%(\ -\ %{expand(\"%:~:.:h\")}%)%(\ [%n]%)%(\ %M%)%(\ %a%)
"set titlestring=%t%(\ -\ %{expand(\"%:~:.:h\")}%)%(\ %{fugitive#statusline()}%)%(\ [%n]%)%(\ %M%)%(\ %a%)

" Taglist
let Tlist_Process_File_Always=1
let Tlist_Show_Menu=1

if has("unix")
  " Invisible character symbols (match textmate)
  set listchars=tab:▸\ ,eol:¬
endif

" Mappings
let mapleader = "\\"
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>
map <leader>y :TlistToggle<CR>
map <leader>l :set list!<CR>

" Map Function key shortcuts
map <silent> <F3> :FufTag<CR>
map <silent> <S-F3> :FufFile<CR>
map <silent> <M-F3> :FufBuffer<CR>
map <silent> <F4> :TlistToggle<CR>
""map <silent> <F5> :RunMake?

map <silent> <C-F7> :set spell!<CR>
map <silent> <C-F10> :execute 'NERDTreeToggle ' . getcwd()<CR>

" Disable currently highlighted search term
" nmap <silent> <C-n> :nohlsearch<CR>

runtime ftplugin/man.vim

if has('gui_running')
  set background=light
else
  set background=dark
endif

colorscheme github
" colorscheme solarized

