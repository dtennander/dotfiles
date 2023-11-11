language en_US.UTF-8
set encoding=UTF-8
set termguicolors
set hidden

" Enable syntax highlighting
if has('syntax')
  syntax on
endif

set background=dark" Set to light for a light variant
colorscheme iceberg
highligh CocCodeLens guibg=#333333

" Map the leader key to be used in maps.
 let mapleader = '<'

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
if has('filetype')
  filetype indent plugin on
endif


" Better command-line completion
set wildmenu

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Use visual bell instead of beeping when doing something wrong
set visualbell

" Enable use of the mouse for all modes
if has('mouse')
  set mouse=a
  set ttymouse=xterm2
endif

" turn hybrid line numbers on
set number relativenumber
set nu rnu

" Have statusmeny available
set laststatus=2

" No Insert as airline shows that
set noshowmode
set noshowcmd

" Let's use spaces 🙈
set expandtab

" Plugins
call plug#begin()
" themes
Plug 'crispybaccoon/dawn.vim'
Plug 'crispybaccoon/fantastic.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'raphamorim/lucario'
" other
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'https://gitlab.com/gi1242/vim-emoji-ab.git'
Plug 'vim-airline/vim-airline'
Plug 'pacha/vem-tabline'
" Coc plugins
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fannheyward/coc-pyright', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'fannheyward/coc-rust-analyzer', {'do': 'yarn install --frozen-lockfile'}

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'
Plug 'wincent/command-t', {
    \   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
    \ }
Plug 'github/copilot.vim'
call plug#end()

" Emoji in files:
au FileType markdown runtime macros/emoji-ab.vim
au FileType text runtime macros/emoji-ab.vim
au FileType gitcommit runtime macros/emoji-ab.vim

" Tabline
let g:vem_tabline_show = 2
let g:vem_tabline_show_number = 'buffnr'
let g:vem_tabline_multiwindow_mode = 1


" Netrw
let g:netrw_altv = 1

" Copilot
let g:copilot_filetypes={
      \ 'markdown': 'true',
      \ 'yaml': 'true'
      \}

" Command T Bindings
nmap <silent> <leader>t :KommandT<CR>
nmap <silent> <leader>b :KommandTBuffer<CR>
nmap <silent> <leader>j :CommandTJump<CR>

" Git hunk jumping
nmap <leader>hk <Plug>(GitGutterPrevHunk)
nmap <leader>hj <Plug>(GitGutterNextHunk)


" Coc Bindings
nnoremap <C-E> :NERDTreeToggle<CR>
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Completion accept on CR
inoremap <silent><expr> <cr> coc#pum#visible() && coc#pum#info()['index'] != -1 ? coc#pum#confirm() : "\<C-g>u\<CR>"
" Use <C-@> on vim
inoremap <silent><expr> <c-@> coc#refresh()
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
nnoremap <silent> <c-j> :call CocActionAsync('doHover')<cr>

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Formatting file
nmap <leader>fs  :call CocAction('format')<CR>

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Visual block move
" move selected lines up one line
xnoremap <c-k>  :m-2<CR>gv=gv

" move selected lines down one line
xnoremap <c-j> :m'>+<CR>gv=gv

" tmux connection
let g:tmux_navigator_no_mappings = 1

noremap <silent> <c-w>h :<C-U>TmuxNavigateLeft<cr>
noremap <silent> <c-w>j :<C-U>TmuxNavigateDown<cr>
noremap <silent> <c-w>k :<C-U>TmuxNavigateUp<cr>
noremap <silent> <c-w>l :<C-U>TmuxNavigateRight<cr>

