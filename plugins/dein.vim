"deinのインストール先を定義
if has('nvim')
  let s:dein_dir = expand('~/vimconfig-t/dein/nvim')
else
  let s:dein_dir = expand('~/vimconfig-t/dein/vim')
endif
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

"tomlファイル格納先を定義
let s:toml_dir = expand('~/vimconfig-t/toml')
let s:toml = s:toml_dir . '/dein.toml'
let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'

"deinがインストールされていない場合はインストールする
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    echo s:dein_repo_dir
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" Required:
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  "PHP開発時はコメント解除（php7,composerが必要）
  "call dein#load_toml(s:toml_dir . '/dev_php.toml', {'lazy': 1})

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
