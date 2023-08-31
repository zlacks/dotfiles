" PLUGINS-------------

" set mapleader before any plugins try to set it 
let mapleader = " "

" Automatically install vim-plug if it is not installed
let data_dir = '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" visual select region-exapand through subsequent 'v' presses
Plug 'terryma/vim-expand-region'

" show git-diff in left-hand gutter as changes are made
Plug 'airblade/vim-gitgutter' 

" allow vim to autoload .editorconfig files to set formatting options
Plug 'editorconfig/editorconfig-vim'

" lightweight, easily customizable bottom status bar
Plug 'itchyny/lightline.vim'

" bundle of colour schemes
Plug 'rodnaph/vim-color-schemes'

" fzf in vim. what's not to love
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" easily comment and uncomment code
Plug 'tpope/vim-commentary'

" autocompletion engine. requires additional installations
" Plug 'ycm-core/YouCompleteMe'
"
call plug#end()

" PLUGINS END--------

" FORMATTING-------------------------------------------------
set tabstop=4
set shiftwidth=4
set autoindent
set expandtab
set smarttab

" VISUAL-----------------------------------------------------
set colorcolumn=80
set number
set nowrap
set cursorline
set signcolumn=yes      " 2 columns, one for numbers, one for gitgutter
set updatetime=100
set is hls
set scrolloff=6
set relativenumber
set showcmd

" For lightline
set laststatus=2
set noshowmode
let g:lightline = {'colorscheme': 'boo_berry',}

" THEME------------------------------------------------------
set termguicolors
syntax enable
colorscheme blackboard

" Modify certain highights to jive better with terminal background
hi Normal guibg=NONE ctermbg=NONE
hi CursorLine cterm=none guibg=#47345E
hi CursorLineSign cterm=none guibg=#47345E
hi ColorColumn guibg=#47345E
hi LineNr cterm=none guibg=#47345E
hi CursorLineNr cterm=none guibg=#47345E
hi clear SignColumn
hi Visual guibg=#2B1C3D

" MISC-------------------------------------------------------
" activate autocomplete menu for commands. complete longest first then show
" horizontal list
set wildmenu
set wildmode=longest:full,full

" disable swap file. Lets hope we remembered to save!
set noswapfile

" enable mouse scrolling, window selection, and cursor positioning
set mouse=a

" Set mapping sequence timeout to 1s and escape sequence timeout to 25ms
set timeoutlen=1000
set ttimeoutlen=25

" Let clangd fully control code completion
" let g:ycm_clangd_uses_ycmd_caching = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
" let g:ycm_clangd_binary_path = exepath("clangd")

" KEY COMMANDS-----------------------------------------------
" Removes highlighting after search by hitting return
nnoremap <silent><CR> :noh<CR><CR>

" Use a visual selection for a search by hitting '//' 
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" remap expand region to 'v' and shrink to ctrl-v
map v <Plug>(expand_region_expand)
map <c-v> <Plug>(expand_region_shrink)

" fzf list open buffers
nnoremap <leader>b :Buffer<cr>

" fzf list files in current and sub dirs
nnoremap <leader>f :Files<cr>

" fzf interactive ripgrep on working directory
nnoremap <leader>/ :RG<cr>

" fzf open jumplist picker
nnoremap <leader>j :Jumps<cr>

" fzf open marks picker
nnoremap <leader>m :Marks<cr>

" fzf show mappings
nnoremap <leader>M :Maps<cr>

" reload source
nnoremap <F2> :so $MYVIMRC<cr>

" quick paste toggle
set pastetoggle=<F3>

" quick find and replace word under cursor (case sensitive)
nnoremap c* /\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgn
nnoremap C* ?\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgN

" quickly apply macro (across visual selection as well)
nnoremap Q @q
vnoremap Q :norm @q<cr>

" create newline above cursor and jump to without exiting insert mode
inoremap <silent><c-o> <esc>O

" remap REDO to something more sensible
nnoremap U <c-r>

" write and quit a little faster
nnoremap <c-w> :w<cr>
nnoremap <c-q> :q<cr>
