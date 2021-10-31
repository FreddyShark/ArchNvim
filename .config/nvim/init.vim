call plug#begin()
Plug 'kyazdani42/nvim-web-devicons'  
Plug 'trescenzi/nvim-tree.lua'
Plug 'hoob3rt/lualine.nvim'
"Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug '907th/vim-auto-save'
Plug 'chaoren/vim-wordmotion'
Plug 'wellle/targets.vim'
Plug 'vimwiki/vimwiki'
Plug 'airblade/vim-gitgutter'
Plug 'qwfy/doc-browser-nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'psf/black', {'branch': 'stable'}
"Plug 'https://github.com/jaxbot/browserlink.vim'
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'tiagovla/tokyodark.nvim'
Plug 'skywind3000/asyncrun.vim'
call plug#end()

set number
set relativenumber
set showcmd
set softtabstop=4 tabstop=4 shiftwidth=4 
set linebreak
set colorcolumn=88
set autoread
set hidden
set clipboard=unnamedplus
set formatoptions-=cro		 "stop annoying comment continuation
" recommended for coc
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
filetype plugin indent on
syntax on
au FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
au FileType typescript setlocal shiftwidth=2 tabstop=2 softtabstop=2
au FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
au FileType json setlocal shiftwidth=2 tabstop=2 softtabstop=2
" au BufEnter *.jsx,*.ts,*.json,*.html,*.js setlocal shiftwidth=2 tabstop=2 softtabstop=2

if has("patch-8.1.1564")
  set signcolumn=number		 " Recently vim can merge signcolumn and number column into one
else
  set signcolumn=yes
endif


let mapleader = ' '
"-----auto save and load in browser------"
" nnoremap <silent> <F5> :set shell=cmd.exe<Bar>update<Bar>silent ! start %:p<Bar>set shell=bash<CR>
" nnoremap <silent> <F5> :update<Bar>silent ! start %:p<CR>
"-----insert a single character with s[character]----"
nnoremap <silent> s :exec "normal i".nr2char(getchar())."\e"<CR>
nnoremap <silent> S :exec "normal a".nr2char(getchar())."\e"<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <leader>. :exe "vertical resize +5"<CR>
nnoremap <leader>, :exe "vertical resize -5"<CR>
nnoremap <Leader>r :edit!<CR>
inoremap <C-Space> <End>

"--------- navigation from neoclide/coc
nnoremap <silent> gs <Plug>(coc-type-definition)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" autosave
let g:auto_save = 1  " enable AutoSave on Vim startup

"--------------COC----------------------
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"---------------NVIM-TREE-----------------------
let g:nvim_tree_side = 'right' " | 'left' left by default
let g:nvim_tree_width = 30 "30 by default
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default
let g:nvim_tree_auto_open = 1 "0 by default, opens the tree when typing `vim $DIR` or `vim`
let g:nvim_tree_auto_close = 1 "0 by default, closes the tree when it's the last window
"let g:nvim_tree_auto_ignore_ft = {} "empty by default, don't auto open tree on specific filetypes.
let g:nvim_tree_quit_on_open = 0 "0 by default, closes the tree when you open a file
let g:nvim_tree_follow = 1 "0 by default, this option allows the cursor to be updated when entering a buffer
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_hide_dotfiles = 1 "0 by default, this option hides files and folders starting with a dot `.`
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_tab_open = 1 "0 by default, will open the tree when entering a new tab and the tree was previously open
let g:nvim_tree_width_allow_resize  = 1 "0 by default, will not resize the tree when opening a file
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ }
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath

" You can edit keybindings be defining this variable
" You don't have to define all keys.
" NOTE: the 'edit' key will wrap/unwrap a folder and open a file
let g:nvim_tree_bindings = {
    \ 'edit':            'o',
    \ 'edit_vsplit':     '\',
    \ 'edit_split':      '-',
    \ 'edit_tab':        't',
    \ 'close_node':      ['<S-C>', '<BS>'],
    \ 'toggle_ignored':  'i',
    \ 'toggle_dotfiles': '.',
    \ 'refresh':         'R',
    \ 'preview':         '<Tab>',
    \ 'cd':              'cd',
    \ 'create':          'mk',
    \ 'remove':          'rm',
    \ 'rename':          'mv',
    \ 'cut':             'x',
    \ 'copy':            'y',
    \ 'paste':           'p',
    \ 'prev_git_item':   'h',
    \ 'next_git_item':   'l',
    \ 'dir_up':          '<BS>',
    \ 'close':           '['
    \ }

" Disable default mappings by plugin
" Bindings are enable by default, disabled on any non-zero value
" let nvim_tree_disable_keybindings=1

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★"
    \   },
    \ 'folder': {
    \   'default': "",
    \   'open': "",
    \   'symlink': "",
    \   }
    \ }

nnoremap <leader>n :NvimTreeToggle<CR>
nnoremap <S-r> :NvimTreeRefresh<CR>
nnoremap <leader>/ :NvimTreeFindFile<CR>
" NvimTreeOpen and NvimTreeClose are also available if you need them

set termguicolors " this variable must be enabled for colors to be applied properly

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=Black
"--------NERD TREE---------"
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
"starts nerdtree on directory open"
"starts nerdtree when no file is specified"
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"let g:NERDTreeWinPos = 'right'
"let g:NERDTreeWinSize = 26
"let g:NERDTreeAutoDeleteBuffer = 1
"let g:NERDTreeCreatePrefix = 'silent keepalts keepjumps'
"let g:NERDTreeQuitOnOpen = 1
"nnoremap <Leader>n :NERDTreeToggle<CR>
"nnoremap <C-n> :NERDTreeFocus<CR>

" For conceal markers.
if has('conceal')
  set conceallevel=1 concealcursor=niv
endif

"---------VIMWIKI------------"
let g:vimwiki_folding = 'list'
let g:vimwiki_option_auto_tags = 1
hi VimwikiHeader1 ctermfg=Green guifg=Green
hi VimwikiHeader2 ctermfg=Yellow guifg=Yellow
hi VimwikiHeader3 ctermfg=Blue guifg=Blue  
hi VimwikiHeader4 ctermfg=Red guifg=#ff0000
hi VimwikiHeader5 ctermfg=Cyan guifg=Cyan
hi VimwikiHeader6 ctermfg=Magenta guifg=Mageneta

" color scheme
let g:tokyodark_transparent_background = 0
let g:tokyodark_enable_italic_comment = 1
let g:tokyodark_enable_italic = 1
let g:tokyodark_color_gamma = "1.0"
colorscheme tokyodark


"highlight CocWarningFloat ctermbg=Grey ctermfg=Yellow guibg=#222222 guifg=Orange
"highlight CocWarningFloating ctermbg=Grey ctermfg=Yellow guibg=#222222 guifg=Orange
"highlight CocWarningVirtualText ctermbg=Grey ctermfg=Yellow guibg=#222222 guifg=Orange
highlight CocFloating ctermbg=235 guibg=#222222 ctermfg=235 guifg=#222222
highlight FgCocWarningFloatBgCocFloating ctermbg=235 ctermfg=Yellow guibg=#222222 guifg=Orange
"highlight CocErrorFloat ctermbg=Grey ctermfg=Red guibg=#222222 guifg=Red
"highlight CocErrorFloating ctermbg=Grey ctermfg=Red guibg=#222222 guifg=Red
"highlight CocErrorVirtualText ctermbg=Grey ctermfg=Red guibg=#222222 guifg=Red
highlight FgCocErrorFloatBgCocFloating ctermbg=235 ctermfg=Red guibg=#222222 guifg=Red





" for windows
"set shell=powershell 
"set shellquote=
"set shellxquote=( 
"set shellpipe=\| 
"set shellredir=>
"set shellcmdflag=-NoLogo\ -NoProfile\ -ExecutionPolicy\ RemoteSigned\ -Command
"set nocompatible

"colorscheme vice
"

"--------mardown preview options----------"
" set to 1, the nvim will open the preview window once enter the markdown buffer
" default: 0
"let g:mkdp_auto_start = 0
"if set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
"let g:mkdp_auto_close = 1
" set to 1, the vim will just refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
"let g:mkdp_refresh_slow = 0
" set to 1, the MarkdownPreview command can be use for all files,
" by default it just can be use in markdown file
" default: 0
"let g:mkdp_command_for_global = 1
" set to 1, preview server available to others in your network
" by default, the server only listens on localhost (127.0.0.1)
" default: 0
"let g:mkdp_open_to_the_world = 0
" switch browser to open preview page
" default: ''
"let g:mkdp_browser = ''

"let g:mkdp_markdown_css = ''
" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
"let g:mkdp_preview_options = {
    " \ 'mkit': {},
    " \ 'katex': {},
    " \ 'uml': {},
    " \ 'maid': {}
    " \ }
" use a custom port to start server or random for empty
" let g:mkdp_port = ''
"
"-----shortcut for markdown to html converison----"
"nmap <leader>md :%!fnamescape(C:/Program Files (x86)/Neovim/Neovim/share/nvim/runtime/Markdown/Markdown.pl) --html4tags <cr>

