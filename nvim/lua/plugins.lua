vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'lewis6991/impatient.nvim'

  -- Treesitter
  use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })

  -- Illuminate
  use 'RRethy/vim-illuminate'
  use {
    'windwp/nvim-autopairs',
      config = function() require("nvim-autopairs").setup {} end
  }

  -- Highlight arguments
  use 'm-demare/hlargs.nvim'

  -- Animate jumped line
  use 'danilamihailov/beacon.nvim'

  -- VimMotion like navigation
  use {
    'phaazon/hop.nvim',
    branch = 'v2',
    config = function()
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }

  -- Telescope
  use 'nvim-lua/plenary.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'} }
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Notify
  use 'rcarriga/nvim-notify'

  -- Colorize
  use 'norcalli/nvim-colorizer.lua'

  -- Indent lines
  use 'lukas-reineke/indent-blankline.nvim'

  -- File tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- Status line
  use 'feline-nvim/feline.nvim'

  -- Tabs
  use 'nanozuki/tabby.nvim'

  -- LSP
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
  use 'kabouzeid/nvim-lspinstall'

  -- Rust
  use("simrat39/rust-tools.nvim")
  use("simrat39/inlay-hints.nvim")
  use("lvimuser/lsp-inlayhints.nvim")

  -- Dashboard
  use("glepnir/dashboard-nvim")

  -- Debugging
  use("mfussenegger/nvim-dap")
  use { 'rcarriga/nvim-dap-ui', requires = {"mfussenegger/nvim-dap"} }

  -- Completion framework:
  use 'hrsh7th/nvim-cmp'

  -- LSP completion source:
  use 'hrsh7th/cmp-nvim-lsp'

  -- Useful completion sources:
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/vim-vsnip'

  -- Theme
  use 'EdenEast/nightfox.nvim'
end)
