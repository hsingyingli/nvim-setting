local status, packer = pcall(require, 'packer')
if (not status) then 
  print("Packer is not installed")
  return
end

vim.cmd[[packadd packer.nvim]]

packer.startup(function(use)
  use 'scrooloose/nerdcommenter' -- quick comment
  use 'wbthomason/packer.nvim'
  use 'nvim-lualine/lualine.nvim' -- Statusline
  use 'neovim/nvim-lspconfig' -- LSP
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/nvim-cmp' -- Completion
  use 'onsails/lspkind-nvim' -- vscode-like pictograms
  use 'kyazdani42/nvim-web-devicons'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use 'ghifarit53/tokyonight-vim' -- nvim dark theme
  use "lukas-reineke/lsp-format.nvim" -- auto formatting
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
  -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {'mg979/vim-visual-multi', branch= 'master'} -- support vscode like multi cursor
  use 'L3MON4D3/LuaSnip'
  use 'norcalli/nvim-colorizer.lua' -- color highlighter for Neovim
  use 'lewis6991/gitsigns.nvim'
  use 'dinhhuy258/git.nvim' -- For git blame & browse
  use 'lukas-reineke/indent-blankline.nvim' --  indentation guides to all lines
end)
