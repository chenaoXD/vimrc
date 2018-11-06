source ~/.config/nvim/vundle_init.vim

" Basic
inoremap jk <ESC>

set expandtab
set shiftwidth=2
set softtabstop=2
set smarttab
set autoindent
set autoread
set number

set ignorecase
set smartcase
set hidden
set incsearch
set tabstop=2

" swap ^ & 0
nnoremap 0 ^
nnoremap ^ 0

" YouCompleteMe related autocomplete
" let g:ycm_semantic_triggers = { \   'css': [ 're!^\s{2}', 're!:\s+' ], \   'less': [ 're!^\s{2}', 're!:\s+' ],
"      \ }

:iabbrev </ </<C-X><C-O>

" JSX related let g:jsx_ext_required = 0

" Color theme
colorscheme molokai
" hi MatchParen ctermfg=249 ctermbg=236 cterm=bold

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" Ctrl-p ignore
let g:ctrlp_custom_ignore = 'node_modules\|\.git'

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 0

inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" Language Server
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
  \'java': ['/home/dreamszl/softwares/jdt-language-server-0.12.1/java-lang-server.sh'],
  \'javascript': ['javascript-typescript-stdio'],
  \'javascript.jsx': ['javascript-typescript-stdio'],
  \'typescript': ['javascript-typescript-stdio'],
  \'python': ['pyls'],
  \'go': ['go-langserver'],
  \}
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

" python-pep8-indent
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4

" html&js indent
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2

" set leader
nnoremap <SPACE> <Nop>
let mapleader=" "

nmap <leader>w :w!<cr>
nmap <leader>o <C-W>o
nmap <leader>h <C-W>h
nmap <leader>k <C-W>k
nmap <leader>j <C-W>j
nmap <leader>l <C-W>l
nmap <leader>i <C-W>k<C-W>q
nmap <leader>v <C-W>v