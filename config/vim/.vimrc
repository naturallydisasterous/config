" ***************
" *** README! ***
" ***************
"
" Created by Aaron Mann, hosted at github.com/Aaron-Mann/dotfiles
" 
" ** COMPATABILITY NOTE! **
" Yank and Put to and from the system clipboard will only work if your vim
" distribution contains the +clipboard requirement. This can be checked with:
" 
" `vim --version | grep clipboard`
" 
" If the +clipboard requirement is not available for your distribution, there
" are a couple of workarounds. Arch Linux:
"
" `$pacman -R vim
"
"  $pacman -S gvim`
" 
" I can't speak for most other distributions, however the gvim package will
" always contain system clipboard support. Additionally, one can still use
" `vim` as normal with gvim installed


" ***************
" *** PLUGINS ***
" ***************

if empty(glob('~/.vim/autoload/plug.vim'))
	  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
	      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif
" Run PlugInstall if plugins are missing
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Start Plugin Installs

call plug#begin('~/.vim/plugged')

" Visuals
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'

" Languages
" depending on how well youcompleteme works these might not be neccessary

" Tools
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'valloric/youcompleteme'

call plug#end()

" **********
" *** UI ***
" **********

colorscheme nord

if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Lightline.vim:

set laststatus=2
set noshowmode

let g:lightline = {
	\ 'colorscheme': 'nord',
	\ }

" Enable Cursorline

set cursorline

" ***************************
" *** SYNTAX HIGHLIGHTING ***
" ***************************

set number
set showmatch

syntax enable

" **************
" *** SPLITS ***
" **************

set splitbelow splitright

" Remap split nav to SHIFT+hjkl
nnoremap <S-h> <C-w>h
nnoremap <S-j> <C-w>j
nnoremap <S-k> <C-w>k
nnoremap <S-l> <C-w>l
nnoremap <S-s> <C-w>s
nnoremap <S-v> <C-w>v
nnoremap <S-c> <C-w>c

set fillchars+=vert:\ 

" ************
" *** MISC ***
" ************

set numberwidth=5
set noshowcmd
set title

" Tabs FTW

set tabstop=2
set shiftwidth=2
set expandtab
filetype plugin indent on

" make sure that your vim has +clipboard! `vim --version | grep clipboard`.
" Otherwise, system clipboard access will not work

if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif
