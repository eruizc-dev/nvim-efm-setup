# nvim-efm-setup

[EFM](https://github.com/mattn/efm-langserver) is really cool, but requires some
configuration. Why not make it easy?

### Installation

 1. Install [efm-langserver](https://github.com/mattn/efm-langserver)
 2. Install [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig#install)
    and nvim-efm-setup with your favorite plugin manager
    ```vim
    Plug 'neovim/nvim-lspconfig'
    Plug 'eruizc-dev/nvim-efm-setup'
    ```
 3. Setup efm-langserver
    ```lua
    require'lspconfig'.efm.setup(require('efm_setup').get_default_config())
    ```

### Supported linters and formatters

Check the [wiki](https://github.com/eruizc-dev/nvim-efm-setup/wiki) for that.

Installation instructions can be found
[here](https://github.com/eruizc-dev/nvim-efm-setup/wiki/Install-linters-and-formatters)


### Contributing

Your favorite linter/formatter is not supported yet? Add it to
[configs.lua](./lua/nvim-efm-setup/configs.lua) like
[in this commit](https://github.com/eruizc-dev/nvim-efm-setup/commit/03ad37f88c4c8a6d80535f1b1cde5669dcb7c079#diff-1ebf37bd5bf3c515b4e9de7138edf1468c85290c7aa3701fe60967b70d4d0282)
and don't forget to [submit a PR](https://github.com/eruizc-dev/nvim-efm-setup/compare)
