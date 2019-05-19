set tabstop=4
set shiftwidth=4
set expandtab
set background=dark
filetype plugin indent on
syntax on
set relativenumber
set showmatch
set laststatus=2
set encoding=utf-8

" Set colorscheme
autocmd VimEnter * colorscheme base16-default-dark 

" YouCompleteMe 
let g:ycm_autoclose_preview_window_after_completion=1

" NerdTREE Mappings
map <C-n> :NERDTreeToggle<CR>
map <C-p> :Files<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Breaking bad habits
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Tab Navigation
nnoremap tl :tabnext<CR>
nnoremap th :tabprev<CR>
nnoremap tn :tabnew<CR>

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Set colorizer file types. Current: ALL
let g:colorizer_auto_filetype='*'
" Plugins management using vim-plug
call plug#begin()

Plug 'scrooloose/nerdtree'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } 
Plug 'junegunn/fzf.vim' 
Plug 'tpope/vim-surround'
Plug 'farmergreg/vim-lastplace'
Plug 'airblade/vim-gitgutter'
Plug 'akz92/vim-ionic2'
Plug 'lilydjwg/colorizer'
Plug 'alvan/vim-closetag'
Plug 'chriskempson/base16-vim'
Plug 'jwalton512/vim-blade'
Plug 'vim-scripts/indentpython.vim'
Plug 'leafgarland/typescript-vim'

call plug#end()

" Status bar functions and configs
" Credits goes to https://cromwell-intl.com/open-source/vim-word-count.html
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Here begins my automated wordcount addition.
" This combines several ideas from:
" http://stackoverflow.com/questions/114431/fast-word-count-function-in-vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:word_count="<unknown>"
function WordCount()
	return g:word_count
endfunction
function UpdateWordCount()
	let lnum = 1
	let n = 0
	while lnum <= line('$')
		let n = n + len(split(getline(lnum)))
		let lnum = lnum + 1
	endwhile
	let g:word_count = n
endfunction
" Update the count when cursor is idle in command or insert mode.
" Update when idle for 1000 msec (default is 4000 msec).
set updatetime=1000
augroup WordCounter
	au! CursorHold,CursorHoldI * call UpdateWordCount()
augroup END
" Set statusline, shown here a piece at a time
highlight User1 ctermbg=green guibg=green ctermfg=black guifg=black
set statusline=%1*			" Switch to User1 color highlight
set statusline+=%<%F			" file name, cut if needed at start
set statusline+=%M			" modified flag
set statusline+=%y			" file type
set statusline+=%=			" separator from left to right justified
set statusline+=\ %{WordCount()}\ words,
set statusline+=\ %l/%L\ lines,\ %P	" percentage through the file

