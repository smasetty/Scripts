" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=/usr/local/opt/fzf
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
 "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'tomasr/molokai'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Tuxdude/mark.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'junegunn/fzf.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ternjs/tern_for_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'digitaltoad/vim-pug'
call vundle#end()            " required
filetype plugin indent on    " required

set tags=./tags;/Users/sharatmasetty/
set rtp+=~/.fzf
source ~/.vim/cscope_maps.vim
"source ~/.vim/mark.vim

"http://stackoverflow.com/questions/14635295/vim-takes-a-very-
"long-time-to-start-up
set clipboard=exclude:.*


" ================ General Config ====================
set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden
set noswapfile
set nobackup
set nowb
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set nu        "line no.s
set hlsearch   
set incsearch
set showmatch
set colorcolumn=80
set mouse=a
set showmode           
set nowrap 
set nowrapscan
set ruler
set title
set ignorecase
set smartcase
set wildmode=list:longest
set noswapfile
set backupcopy=no     
set autowrite
highlight ColorColumn guibg=black
"http://stackoverflow.com/questions/14635295/vim-takes-a-very-
"long-time-to-start-up
set clipboard=exclude:.*

" Display tabs and trailing spaces visually
"set list listchars=tab:\ \ ,trail:Â·
set wrap
set linebreak

filetype plugin on
filetype indent on

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" A few shortcuts to make life easy
noremap <Leader>s :update<CR>
noremap <C-S> :update<CR>
inoremap <c-s> <c-o>:update<CR>
vmap <C-s> <esc>:w<CR>gv
map Q :qa<CR>

set scrolloff=8
set sidescrolloff=15
set sidescroll=1

if exists('$TMUX')
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

"set foldmethod=manual
"folding options
"vnoremap zz zf
"inoremap zz <Esc>zaki
"nnoremap zz za
"inoremap \zB <Esc>vaBzf

"Visually select a string and search
vnoremap // y/<C-R>"<CR>
"vnoremap // y/\V<C-R>"<CR>
"vnoremap <expr> // 'y/\V'.escape(@",'\').'<CR>'

set splitbelow
set splitright

"Use the plugin provided YouCompleteMe settings for now
let g:ycm_global_ycm_extra_conf="/Users/sharatmasetty/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
let g:ycm_show_diagnostics_ui = 0

"Tagbar settings
nmap <F2> :TagbarToggle<CR>

"turn on syntax highlighting
syntax enable
syntax on 
set noshowmode

"Molokai settings
set background=dark
colorscheme molokai
set t_Co=256
"If working with Tmux then add this to your bashrc
"alias tmux="TERM=screen-256color-bce tmux"
"add this to your tmux configuration file
"set -g default-terminal xterm"
if has('unix')
   set t_Co=256
endif
let g:molokai_original = 1
"let g:rehash256 = 1

"Airline settings 
let g:airline_theme = 'molokai'
set laststatus=2
set ttimeoutlen=50

"YouCompleteMe and UltiSnips compatibility.
let g:UltiSnipsExpandTrigger = '<Tab>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'

let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:ycm_key_list_accept_completion = ['<C-y>']

"Additional UltiSnips config.
"let g:UltiSnipsSnippetsDir = '~/.vim/ultisnips'
"let g:UltiSnipsSnippetDirectories = ['ultisnips']

" Additional YouCompleteMe config.
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_seed_identifiers_with_syntax = 1

" ==================== UltiSnips ====================
function! g:UltiSnips_Complete()
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res == 0
    if pumvisible()
      return "\<C-n>"
    else
      call UltiSnips#JumpForwards()
      if g:ulti_jump_forwards_res == 0
        return "\<TAB>"
      endif
    endif
  endif
  return ""
endfunction

function! g:UltiSnips_Reverse()
  call UltiSnips#JumpBackwards()
  if g:ulti_jump_backwards_res == 0
    return "\<C-P>"
  endif

  return ""
endfunction


if !exists("g:UltiSnipsJumpForwardTrigger")
  let g:UltiSnipsJumpForwardTrigger = "<tab>"
endif

if !exists("g:UltiSnipsJumpBackwardTrigger")
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
endif

au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"

"AutoPairs plugin
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'
inoremap <C-e> <Esc>A
inoremap <C-a> <Esc>I

"Airline issues

let g:airline_section_c = '%t'
let g:airline_section_y = ''
let g:airline_section_warning = ''

"NERDtree
map <silent> <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeShowBookmars=1
