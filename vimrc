set nocompatible                " stop vim behaving in a vi compatible way

set expandtab                   " puts in spaces instead of a tab
set tabstop=4                   " the number of spaces to use
                                " use :retab to convert tabs to spaces in existing code
set shiftwidth=4                " number of spaces inserted for indentation
set softtabstop=4               " the number of spaces to use in insert mode
set autoindent                  " turns on auto indenting
set smarttab                    " predicts and actions on indenting automatically

set number                      " show line number in the gutter column
" set relativenumber            " show line numbers relative to current line
set ruler                       " helpful bar at the bottom right of the page
set laststatus=2                " always show the current mode, file name, file status, ruler, etc

set noswapfile                  " stop a swap file from being created

" syntax on                       " enable syntax highlighting
set scrolloff=3                 " show lines above and below when side scrolling

let mapleader=","               " set comma as the custom command 'kick off' character

set history=700                 " set how many lines of history to remember
" set autoread                    " autoread when a file is changed from outside
set cmdheight=2                 " set the height of the command bar
set smartcase                   " enable smart thinking about Cases in search
set hlsearch                    " highlight search results
set showmatch                   " show matching brackets when highlighted
" set mat=2                       " how many milliseconds to blink when highlighting brackets
set encoding=utf8               " set utf8 as standard encoding

execute pathogen#infect()        

filetype on                     " vim tries to detect the filetype of a file when opening
filetype plugin on              " load plugins based on filetype
filetype indent on              " load indent scheme based on filetype

syntax enable
"set background=dark
"let g:solarized_visibility = "high"
"let g:solarized_contrast = "high"
"let g:solairzed_termcolors=256
"colorscheme solarized

let g:projectionist_heuristics = {
      \ "src/main/java/" : {
      \ "src/main/java/*.java": {"alternate": "src/test/java/{}Test.java",
      \                          "type": "src"},
      \ "src/test/java/*Test.java": {"alternate": "src/main/java/{}.java",
      \                          "type": "spec"},
      \ },
      \ "project.clj" : {
      \ "src/*.clj": {"alternate": "spec/{}_spec.clj",
      \               "type": "src"},
      \ "spec/*_spec.clj": {"alternate": "src/{}.clj",
      \                     "type": "spec"}
      \ }
      \ }
