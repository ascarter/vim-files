set nocompatible

syntax enable
filetype on
filetype plugin on
filetype indent on

" set nowrap
set number
set cursorline
set hlsearch
set incsearch
set showtabline=1
set ruler

"set expandtab
"set softtabstop=2
set smarttab
set smartindent
set autoindent
set backspace=start,eol,indent whichwrap+=<,>,[,]

" Use system clipboard
" set clipboard=unnamed

autocmd FileType ruby  set tabstop=2|set shiftwidth=2|set softtabstop=2|set expandtab
autocmd FileType rdoc  set tabstop=2|set shiftwidth=2|set softtabstop=2|set expandtab
autocmd FileType eruby set tabstop=2|set shiftwidth=2|set softtabstop=2|set expandtab
autocmd FileType haml  set tabstop=2|set shiftwidth=2|set softtabstop=2|set expandtab
autocmd FileType sass  set tabstop=2|set shiftwidth=2|set softtabstop=2|set expandtab

set foldenable
set foldmethod=syntax
set foldlevel=10

" Don't create extra files
"set nobackup
"set nowritebackup
"set noswapfile

" Mappings
let mapleader = "\\"
map <leader>t :FufTag<CR>
map <leader>f :FufFile<CR>
map <leader>p :FufDir<CR>
map <leader>b :FufBuffer<CR>
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

" Map Function key shortcuts
map <silent> <F3> :FufTag<CR>
map <silent> <S-F3> :FufFile<CR>
map <silent> <M-F3> :FufBuffer<CR>
""map <silent> <F5> :RunMake?

map <silent> <C-F7> :set spell!<CR>
map <silent> <C-F10> :execute 'NERDTreeToggle ' . getcwd()<CR>

runtime ftplugin/man.vim

"colorscheme zenburn
"set background=dark
"let g:zenburn_high_Contrast = 1
"let g:zenburn_alternate_Visual = 1

colorscheme macdev
set background=dark

"colorscheme github
"set background=light

"set t_Co=256
