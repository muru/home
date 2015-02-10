# My vimrc

This repository contains my `.vimrc` and and `.vim` folder. 
The `.vimrc` file is inside the folder and I usually keep a hard link outside.

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
- [diffchar.vim](https://github.com/vim-scripts/diffchar.vim)
- [vim-airline](https://github.com/bling/vim-airline)
- [ctrlp.vim](https://github.com/kien/ctrlp.vim)
- [eregex.vim](https://github.com/othree/eregex.vim) - The regex will rise, moar powerful than ever before!
- [nerdtree](https://github.com/scrooloose/nerdtree)
- [vim-surround](https://github.com/tpope/vim-surround)
- [vim2hs](https://github.com/dag/vim2hs) - Haskell in all its visual beauty:

        symbol :: Eq s => s -> Parser s s
        symbol a x = satisfy (a == ) x
Becomes:

        symbol :: Eq s ⇒ s → Parser s s
        symbol a x = satisfy (a ≡ ) x

- [LaTeX-Box](https://github.com/LaTeX-Box-Team/LaTeX-Box)
