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
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use 'ghifarit53/tokyonight-vim' -- nvim dark theme
  use "lukas-reineke/lsp-format.nvim" -- auto formatting
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"

  use {'mg979/vim-visual-multi', branch= 'master'} -- support vscode like multi cursor
  use 'L3MON4D3/LuaSnip'
  use 'norcalli/nvim-colorizer.lua' -- color highlighter for Neovim
  use 'lewis6991/gitsigns.nvim'
  use 'dinhhuy258/git.nvim' -- For git blame & browse
  use 'lukas-reineke/indent-blankline.nvim' --  indentation guides to all lines
  use {
    "danymat/neogen",
    requires = "nvim-treesitter/nvim-treesitter",
    -- Uncomment next line if you want to follow only stable versions
    tag = "*"
  }
  use 'simrat39/symbols-outline.nvim'
end)
