call plug#begin('~/.vim/plugged')
" leave some space in between

"Plug 'preservim/nerdtree'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'folke/tokyonight.nvim'
Plug 'nvim-tree/nvim-web-devicons' " optional
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-lua/plenary.nvim'		" Coroutine for lua
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }	" Searching with fuzzy
Plug 'williamboman/mason.nvim' 	" Plugin Manager for Language
Plug 'lewis6991/gitsigns.nvim' 	" Visual git changes
Plug 'tpope/vim-fugitive' 			" Git plugins command 
Plug 'kien/ctrlp.vim' 					" For finding files
Plug 'SirVer/ultisnips'         " Snippet engine
Plug 'honza/vim-snippets'       " Snippet
" Golang support
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

" we will add keybinds below this comment.
"Changing default NERDTree arrows

syntax on 
set number "Display line number on NVIM
set cursorline
set hlsearch
set autowrite

" nmap <c-s> :w<cr>
" imap <c-s> <esc>:w<cr>a

"ctrlp.vim 
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_switch_buffer = 'et'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"set cc=80
"let g:NERDTreeDirArrowExpandable = '▸'
"let g:NERDTreeDirArrowCollapsible = '▾'
"let g:NERDTreeHijackNetrw = 1
"au VimEnter NERD_tree_1 enew | execute 'NERDTree '.argv()[0]

"nnoremap <C-t> :NERDTreeToggle<CR>

" coc nmap
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
nmap <leader>do <Plug>(coc-codeaction)
nmap <leader>rn <Plug>(coc-rename)

colorscheme tokyonight-night

lua require('init')
