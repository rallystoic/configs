set number
syntax  enable
"highligh search set hlsearch
"ctag
set tags=tags
:set tabstop=4
:set shiftwidth=4
:set expandtab

:set suffixesadd+=.ts
:set suffixesadd+=.js
:set suffixesadd+=.cs
:set suffixesadd+=.md


"syntax enable
"set background=dark
"colorscheme solarized
" If installed using git
" base16 luna wombat  
" bubblegum
let g:airline_theme='bubblegum'
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'OmniSharp/omnisharp-vim'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'rust-lang/rust.vim'
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown'}
Plug 'jlanzarotta/bufexplorer'




Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

" Debugger
Plug 'puremourning/vimspector'

"tablemode
Plug 'dhruvasagar/vim-table-mode'

" snipmate
Plug 'SirVer/ultisnips'

Plug 'honza/vim-snippets'

"vim go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }


call plug#end()

"disable ident
"let g:typescript_indent_disable = 1

"Nerdtree open automatically when start up
"autocmd vimenter * NERDTree
"map <F3> :NERDTreeToggle<cr>
"ctrl-l = next
map <C-L> :tabn<cr>
"ctrl+h for tab left and ctrl+l for tab right
map <C-H> :tabp<cr>
"ctrl-h = previous
map <C-\> :FZF<cr>

map <F2> :tab new<cr>
""""""""""""Parentheses handling""""""""""
"inoremap ( ()<Esc>i
""""""""""""Bracer handling"""""""""""""""
"inoremap { {}<Esc>i
inoremap <C-\> ()<Esc>i
inoremap <C-l> {<CR><CR>}<Esc>ki
"inoremap < <><Esc>i
"inoremap [ []<Esc>i
"""""""""""Bracer handling"""""""""""""""
:nnoremap <leader>w :w<cr>
:nnoremap <leader>' f'ci' 
:nnoremap <leader>" f"ci" 
:nnoremap <leader>{ f{ci{ 
:nnoremap <leader>( f(ci( 
:nnoremap <leader>nh :noh<cr>
:nnoremap <leader>nu :set nu!<cr>
":nnoremap <leader>1 vaw"1y<CR>
":nnoremap <leader>2 vaw"2y<CR>
:nnoremap <leader>fn i(){<CR>}<Esc>k_
:nnoremap <leader>pu ipublic $ {get;set;}<Esc>_f$cw
" remove blank line
:nnoremap <leader>9 :g/^\s*$/d<CR>
" vim grep command find parrtern word  in current directory
:nnoremap <leader>g :vimgrep //\c **<left><left><left><left><left><left>
":nnoremap <leader>4 :%s/^\_s\+/\r/g<CR>
:nnoremap <leader>l :cw<CR>
:nnoremap <leader>1 :cnext<CR>
:nnoremap <leader>2 :cprev<CR>
" Datetime Insert mode
:map! <F4> <C-R>=strftime('%F')<CR>
" quit all
:nnoremap <leader>q :qa!<CR>
"visual mode map
:vnoremap <leader>i :norm!<space>
"visual mode remove get set property
:vnoremap <leader>rr :norm!<space>fpd2wf{df}<CR>
"transform word into json format
:vnoremap <leader>js :norm wysiw"A: "$",<CR>

" Buffers - explore/next/previous: Alt-F12, F12, Shift-F12.
:nnoremap <F5> :buffers<CR>:buffer<Space>
:nnoremap  <F11> :bp<CR>
:nnoremap  <F12>  :bn<CR>
	
"buffer tab
"map <C-l>  :bn<cr>
"map <C-h>  :bp<cr>

"Enable true colors
 if exists('+termguicolors')
   let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
   let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
   set termguicolors
 endif

"English Dictionary for writing a document!
au FileType * execute 'setlocal dict+=~/.vim/words/'.&filetype.'.txt'.'.md'
"set dictionary+=/usr/share/dict/thaiword
set dictionary+=/usr/share/dict/words


"font setup
set guifont=ProggyClean

" add html syntax to dotnet razor files
"autocmd BufNewFile,BufRead *.cshtml set syntax=html

" persistence fold
"autocmd BufWinLeave *.* mkview
"autocmd BufWinEnter *.* silent loadview 
" 
" leafgarland typescript
let g:typescript_compiler_binary = 'tsc'
"
"
"markdown config
filetype plugin on
let g:instant_markdown_browser = "google-chrome --new-window"
"Uncomment to override defaults:
"let g:instant_markdown_slow = 1
" let g:instant_markdown_autostart = 0
" let g:instant_markdown_open_to_the_world = 1
" let g:instant_markdown_allow_unsafe_content = 1
" let g:instant_markdown_allow_external_content = 0
" let g:instant_markdown_mathjax = 1
" let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
" let g:instant_markdown_autoscroll = 0
" let g:instant_markdown_port = 8090
" let g:instant_markdown_python = 1
 
 
 
" omnisharp c#
 " set updatetime=500
 " 
 " sign define OmniSharpCodeActions text=
 " 
 " augroup OSCountCodeActions
 "     autocmd!
 "     autocmd FileType cs set signcolumn=yes
 "     autocmd CursorHold *.cs call OSCountCodeActions()
 " augroup END
 " 
 " function! OSCountCodeActions() abort
 "     if bufname('%') ==# '' || OmniSharp#FugitiveCheck() | return | endif
 "     if !OmniSharp#IsServerRunning() | return | endif
 "     let opts = {
 "                 \ 'CallbackCount': function('s:CBReturnCount'),
 "                 \ 'CallbackCleanup': {-> execute('sign unplace 99')}
 "                 \}
 "     call OmniSharp#actions#codeactions#Count(opts)
 " endfunction
 " 
 " function! s:CBReturnCount(count) abort
 "     if a:count
 "         let l = getpos('.')[1]
 "         let f = expand('%:p')
 "         execute ':sign place 99 line='.l.' name=OmniSharpCodeActions file='.f
 "     endif
 " endfunction
