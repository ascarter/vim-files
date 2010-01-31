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
map <leader>t :FuzzyFinderTag<CR>
map <leader>f :FuzzyFinderFile<CR>
map <leader>p :FuzzyFinderDir<CR>
map <leader>b :FuzzyFinderBuffer<CR>
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>
map <leader>c :NERDComToggleComment<CR>

map <silent> <C-F10> :set spell!<CR>

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
