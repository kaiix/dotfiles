call plug#begin('~/.vim/bundle')

Plug 'junegunn/vim-plug'

Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/syntastic'
Plug 'pangloss/vim-javascript'
Plug 'majutsushi/tagbar'  " require ctags
Plug 'edkolev/tmuxline.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
"Plug 'easymotion/vim-easymotion'
Plug 'othree/html5.vim'
Plug 'vim-scripts/python_match.vim'

Plug 'google/vim-maktaba'
Plug 'google/vim-glaive'
Plug 'google/vim-codefmt'

Plug 'Yggdroot/indentLine'
Plug 'kien/rainbow_parentheses.vim'
Plug 'vim-scripts/searchfold.vim'
Plug 'vim-scripts/LargeFile'
Plug 'sjl/gundo.vim'
Plug 'rhysd/accelerated-jk'
"Plug 'qstrahl/vim-matchmaker'
Plug 'scrooloose/nerdcommenter'
Plug 'jlanzarotta/bufexplorer'
" plantuml
Plug 'scrooloose/vim-slumlord'
Plug 'aklt/plantuml-syntax'
Plug 'SirVer/ultisnips'
Plug 'avakhov/vim-yaml'
Plug 'tweekmonster/braceless.vim'
Plug 'Vimjas/vim-python-pep8-indent'
"Plug 'airblade/vim-gitgutter'
Plug 'fisadev/vim-isort'
Plug 'tpope/vim-rhubarb'

if has('python') || has('python3')
    Plug 'Valloric/YouCompleteMe'
endif

call plug#end()

call glaive#Install()
" Optional: Enable codefmt's default mappings on the <Leader>= prefix.
Glaive codefmt plugin[mappings]
