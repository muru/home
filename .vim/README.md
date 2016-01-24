# My vimrc

This repository contains my `.vim` folder.  The `vimrc` file is inside the folder.

Of note:

- `sudo` write: `cmap w!! w !sudo tee >/dev/null %`  
If you opened a root-owned file but forgot to use `sudo`, use `:w!!` to write.
- Only the latest for me:

        let g:syntastic_cpp_compiler_options=' -std=c++11'
        let g:syntastic_python_python_exec = '/usr/bin/python3'
- May the `Shift` not be with you:

        nore ; :
        nore , ;

  
## [Plugins](bundle)

- [Pathogen](https://github.com/tpope/vim-pathogen) - for autoloading plugins
- [supertab](https://github.com/ervandew/supertab) - for completion awesomeness
- [syntastic](https://github.com/scrooloose/syntastic) - for highlighting the living daylights out of syntax errors
- [YouCompleteMe](https://github.com/Valloric/YouCompleteMe.git)
- [vim-airline](https://github.com/bling/vim-airline)
- [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim.git)
- [diffchar.vim](https://github.com/vim-scripts/diffchar.vim)
- [molokai](https://github.com/tomasr/molokai.git)
- [nerdtree](https://github.com/scrooloose/nerdtree.git)
- [tabular](https://github.com/godlygeek/tabular.git)
- [tagbar](https://github.com/majutsushi/tagbar.git)
- [vim-fugitive](https://github.com/tpope/vim-fugitive.git)
- [vim-go](https://github.com/fatih/vim-go.git)
- [vim-markdown](https://github.com/gabrielelana/vim-markdown)
- [vim-surround](https://github.com/tpope/vim-surround.git)
- [vimtex](https://github.com/lervag/vimtex)
- [vim2hs](https://github.com/dag/vim2hs) - Haskell in all its visual beauty:

        symbol :: Eq s => s -> Parser s s
        symbol a x = satisfy (a == ) x
 Becomes:

        symbol :: Eq s ⇒ s → Parser s s
        symbol a x = satisfy (a ≡ ) x
