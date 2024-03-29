call plug#begin('~/.local/share/nvim/plugged')

" let Vundle manage Vundle, required
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-multiple-cursors'
Plug 'haya14busa/incsearch.vim'
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-commentary'
Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'hdima/python-syntax'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'nicwest/vim-http'
Plug 'dhruvasagar/vim-table-mode'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'ryanoasis/vim-devicons'
Plug 'sindrets/diffview.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'dense-analysis/ale'

" themes
Plug 'morhetz/gruvbox'
Plug 'tyrannicaltoucan/vim-deep-space'

call plug#end()

set encoding=UTF-8
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set number                     " Show current line number
set relativenumber             " Show relative line numbers
" set listchars+=space:␣
" set list

" trim space when saving "
autocmd BufWritePre * %s/\s\+$//e

" set copy/paste from clipboard. from now one, visual mode yy will copy
" directly to clipboard. This need vim compiled with clipboard (vim --version
" | grep clipboard) "
" set clipboard=unnamed
set clipboard+=unnamedplus

" Stop the stupid identation for vim when pasting from other source
" Thank to https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
    set pastetoggle=<Esc>[201~
    set paste
    return ""
endfunction

" setup auto close
ino " ""<left>
ino ' ''<left>
ino ( ()<left>
ino [ []<left>
ino { {}<left>
ino {<CR> {<CR>}<ESC>O


" Python config
let python_highlight_all = 1

" set up for incremental search "
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)


" Kill the capslock when leaving insert mode.
autocmd InsertLeave * set iminsert=0

"map shift enter to esc"
imap <S-CR> <ESC>

" airline
set laststatus=2
let g:airline_powerline_fonts = 0
let g:airline_left_sep = ''
let g:airline_right_sep = ''

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='gruvbox'
" bubblegum
" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <c-o> :ZoomToggle<CR>

hi NonText guifg=bg
"----------------------  Color schem  ----------------------"
syntax on

set termguicolors

" set background=dark
" colorscheme deep-space

" theme setup
set background=dark
colorscheme gruvbox

set cursorline
hi CursorLine term=bold cterm=bold guibg=NONE ctermbg=NONe

"----------------------/ Color schem  ----------------------"

"---------------------- Python Syntax ----------------------"
let python_highlight_all = 1
"----------------------/ Python Syntax ----------------------"


set backupdir=$HOME/.vim_backup//
set directory=$HOME/.vim_backup//

set backspace=indent,eol,start

"---------------- Fzf setting ----------------"
" set rtp+=/home/bubuzzz/.fzf/bin/fzf


let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'up': '~60%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '40split enew' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" remove the separator when splitting vim"
hi LineNr guibg=bg
set foldcolumn=2
hi foldcolumn guibg=bg
hi VertSplit guibg=bg guifg=bg

" Vim Align"
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Diff View "
map <C-d> :DiffviewOpen<cr>

" Vim Http
let g:vim_http_split_vertically = 1
let g:vim_http_tempbuffer = 1

" CHADTree for file explorer
nnoremap , <cmd>CHADopen<cr>
let g:chadtree_settings = {
    \ 'theme.text_colour_set': 'solarized_dark',
\ }


" ALE configuration
let g:ale_linters = {'python': ['pyright']}
let g:ale_completion_enabled = 1
set completeopt=menu,menuone,preview,noselect,noinsert

nnoremap gd <cmd>ALEGoToDefinition<cr>
nnoremap <s-f6> <cmd>ALERename<cr>

" Go to prev/next buffer
nnoremap <s-h> <cmd>bp<cr>
nnoremap <s-l> <cmd>bn<cr>
