# Vim syntax highlighting for YARA rules

A Vim syntax-highlighting plugin for [YARA](https://virustotal.github.io/yara/)
rules. Covers YARA versions up to v4.3.

![Screenshot](screenshot.png "Syntax highlighting in action.")

## Installation

The installation depends on the plugin manager you use (if any). Here are some of the options:

### vim-pathogen

If you use [vim-pathogen](https://github.com/tpope/vim-pathogen), go into the
`bundle` directory and clone the repository in there:
```bash
cd ~/.vim/bundle
git clone https://github.com/s3rvac/vim-syntax-yara.git
```

### lazy.nvim

If you use [lazy.nvim](https://github.com/folke/lazy.nvim), add the following
piece of code into your plugin configuration:
```lua
-- Vim syntax highlighting for YARA rules
-- https://github.com/s3rvac/vim-syntax-yara
{
    "s3rvac/vim-syntax-yara",
}
```

### Manual installation

You can also install the plugin manually by copying the
[`syntax/yara.vim`](https://raw.githubusercontent.com/s3rvac/vim-syntax-yara/master/syntax/yara.vim)
file to your `~/.vim/syntax` directory and the
[`ftdetect/yara.vim`](https://raw.githubusercontent.com/s3rvac/vim-syntax-yara/master/ftdetect/yara.vim)
file to your `~/.vim/ftdetect` directory. If these directories do not exist,
create them.

## License

Copyright (c) 2017 Petr Zemek (s3rvac@petrzemek.net) and contributors.

Distributed under the MIT license. See the
[`LICENSE`](https://github.com/s3rvac/vim-syntax-yara/blob/master/LICENSE)
file for more details.
