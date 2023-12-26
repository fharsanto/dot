call plug#begin('~/.vim/plugged')
" leave some space in between

"Plug 'preservim/nerdtree'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'sheerun/vim-polyglot'

Plug 'folke/tokyonight.nvim'

Plug 'nvim-tree/nvim-web-devicons' " optional
Plug 'nvim-tree/nvim-tree.lua'

Plug 'nvim-lua/plenary.nvim'

Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }
Plug 'williamboman/mason.nvim' " Plugin Manager for Language
Plug 'lewis6991/gitsigns.nvim'

call plug#end()

" we will add keybinds below this comment.
"Changing default NERDTree arrows

set number "Display line number on NVIM
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
