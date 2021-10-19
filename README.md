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
    require'lspconfig'.efm.setup(require('nvim-efm-setup').get_default_config())
    ```
