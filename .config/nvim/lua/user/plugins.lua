local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
  git = {
    clone_timeout = 300, -- Timeout, in seconds, for git clones
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use { "wbthomason/packer.nvim", commit = "6afb67460283f0e990d35d229fd38fdc04063e0a" } -- Have packer manage itself
  use { "nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" } -- Useful lua functions used by lots of plugins
  use { "ahmedkhalf/project.nvim", commit = "628de7e433dd503e782831fe150bb750e56e55d6" }
  use { "lewis6991/impatient.nvim", commit = "b842e16ecc1a700f62adb9802f8355b99b52a5a6" }
  use { "numToStr/Comment.nvim", commit = "97a188a98b5a3a6f9b1b850799ac078faa17ab67" }
  use { "JoosepAlviste/nvim-ts-context-commentstring", commit = "32d9627123321db65a4f158b72b757bcaef1a3f4" }
  use { "kyazdani42/nvim-web-devicons", commit = "563f3635c2d8a7be7933b9e547f7c178ba0d4352" }
  use { "kyazdani42/nvim-tree.lua", commit = "7282f7de8aedf861fe0162a559fc2b214383c51c" }
  use { "akinsho/bufferline.nvim", commit = "83bf4dc7bff642e145c8b4547aa596803a8b4dc4" }
  use { "nvim-lualine/lualine.nvim", commit = "a52f078026b27694d2290e34efa61a6e4a690621" }
  use { "goolord/alpha-nvim", commit = "0bb6fc0646bcd1cdb4639737a1cee8d6e08bcc31" }
  use { "lukas-reineke/indent-blankline.nvim", commit = "db7cbcb40cc00fc5d6074d7569fb37197705e7f6" }
  use { "windwp/nvim-autopairs", commit = "4fc96c8f3df89b6d23e5092d31c866c53a346347" } -- Autopairs, integrates with both cmp and treesitter
  use { "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" }
  use { "akinsho/toggleterm.nvim", commit = "2a787c426ef00cb3488c11b14f5dcf892bbd0bda" }
  use "folke/which-key.nvim"
  use "petertriho/nvim-scrollbar"
  use "mg979/vim-visual-multi"
  use "farmergreg/vim-lastplace"
  use "Shatur/neovim-session-manager"
  use "rcarriga/nvim-notify"
  use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}
  use "phaazon/hop.nvim"
  use {
    'VonHeikemen/fine-cmdline.nvim',
    requires = {
      {'MunifTanjim/nui.nvim'}
    }
  }
  use {
    'VonHeikemen/searchbox.nvim',
    requires = {
      {'MunifTanjim/nui.nvim'}
    }
  }

  use { 'anuvyklack/hydra.nvim',
      requires = 'anuvyklack/keymap-layer.nvim' -- needed only for pink hydras
  }

  use 'nacro90/numb.nvim'

  -- use 'sunjon/shade.nvim'
  use '0x100101/Shade.nvim'
  use "tjdevries/colorbuddy.nvim"
  use "onsails/lspkind.nvim"
  use { "folke/zen-mode.nvim" }
  use "Pocco81/TrueZen.nvim"
  use { "folke/twilight.nvim" }

  -- Code runner --
  use { 'metakirby5/codi.vim' }
  use { 'michaelb/sniprun', run = 'bash ./install.sh'}
  use { 'is0n/jaq-nvim' }

  -- Markdown --
  use {
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
    setup = function()
      vim.g.mkdp_browser = "firefox"
      vim.g.mkdp_open_to_the_world = 1
      vim.g.mkdp_port = "57843"
    end,
    ft = {
      "markdown",
    },
  }
  use {
    "mzlogin/vim-markdown-toc",
    cmd = {
      "GenTocGFM",
    },
  }
  use { 'godlygeek/tabular' }
  use {
    'preservim/vim-markdown',
    ft = {
      "markdown",
    },
  }
  use { 'dhruvasagar/vim-table-mode' }

  -- MORE --
  use 'psliwka/vim-smoothie'
  use 'sindrets/winshift.nvim'
  use 'jlanzarotta/bufexplorer'
  use {
    "AndrewRadev/splitjoin.vim",
    keys = {
      { "n", "gJ" },
      { "n", "gS" },
    },
  }
  use { 'andymass/vim-matchup' }
  use { "AckslD/nvim-neoclip.lua" }
  use "ziontee113/syntax-tree-surfer"
  use { 'tpope/vim-repeat' }
  use { 'windwp/nvim-spectre' }
  use { 'kmonad/kmonad-vim' }
  -- use { 'dense-analysis/ale' }
  use {
    "NTBBloodbath/rest.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  }
  use { 'https://github.com/tpope/vim-dotenv' }
  use { 'tpope/vim-dadbod' }
  use { 'kristijanhusak/vim-dadbod-ui',
    requires = {
      'tpope/vim-dadbod',
      'tpope/vim-dotenv',
    }
  }
  use { 'ziontee113/color-picker.nvim' }
  use { 'norcalli/nvim-colorizer.lua' }
  -- use { 'fgheng/winbar.nvim' }
  -- use({
  --   "utilyre/barbecue.nvim",
  --   tag = "*",
  --   requires = {
  --     "SmiteshP/nvim-navic",
  --     "nvim-tree/nvim-web-devicons", -- optional dependency
  --   },
  --   after = "nvim-web-devicons", -- keep this if you're using NvChad
  --   config = function()
  --     require("barbecue").setup()
  --   end,
  -- })

  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
  }

  -- VimWiki
  use { 'vimwiki/vimwiki' }
  use { 'ElPiloto/telescope-vimwiki.nvim' }
  use { 'mattn/calendar-vim' }

  -- Ruby / Rails
  use "kana/vim-textobj-user"
  use "https://github.com/whatyouhide/vim-textobj-erb"
  use "vim-ruby/vim-ruby"
  use "tpope/vim-rails"
  use { 'ngmy/vim-rubocop' }

  -- React
  use "tpope/vim-surround"
  -- use { 'mattn/emmet-vim' }
  -- use { 'jelera/vim-javascript-syntax' }
  -- use { 'elzr/vim-json' }
  -- use { 'leafgarland/typescript-vim' }
  -- use { 'peitalin/vim-jsx-typescript' }

  -- Colorschemes

  use { "folke/tokyonight.nvim", commit = "66bfc2e8f754869c7b651f3f47a2ee56ae557764" }
  use { "lunarvim/darkplus.nvim", commit = "13ef9daad28d3cf6c5e793acfc16ddbf456e1c83" }
  use "LunarVim/onedarker.nvim"
  use "rebelot/kanagawa.nvim"
  use({ 'rose-pine/neovim', as = 'rose-pine', tag = 'v1.*' })
  use "morhetz/gruvbox"
  use "frenzyexists/aquarium-vim"
  use "luisiacc/gruvbox-baby"
  use "rafamadriz/neon"
  use "tiagovla/tokyodark.nvim"
  use "sainnhe/everforest"
  use 'navarasu/onedark.nvim'
  use 'shaunsingh/nord.nvim'
  use 'marko-cerovac/material.nvim'
  use "tomasiser/vim-code-dark"
  use { "catppuccin/nvim", as = "catppuccin" }

  -- use "olimorris/onedarkpro.nvim"
  -- use "rmehri01/onenord.nvim"


  -- cmp plugins
  use { "hrsh7th/nvim-cmp", commit = "b0dff0ec4f2748626aae13f011d1a47071fe9abc" } -- The completion plugin
  use { "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" } -- buffer completions
  use { "hrsh7th/cmp-path", commit = "447c87cdd6e6d6a1d2488b1d43108bfa217f56e1" } -- path completions
  use { "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" } -- snippet completions
  use { "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" }
  use { "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" }
  use "f3fora/cmp-spell"
  use "hrsh7th/cmp-emoji"
  use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
  use "notomo/cmp-neosnippet"
  use { 'hrsh7th/cmp-cmdline' }
  use { 'David-Kunz/cmp-npm' }
  -- use "zbirenbaum/copilot-cmp"

  -- snippets
  use { "L3MON4D3/LuaSnip", commit = "8f8d493e7836f2697df878ef9c128337cbf2bb84" } --snippet engine
  use { "rafamadriz/friendly-snippets", commit = "2be79d8a9b03d4175ba6b3d14b082680de1b31b1" } -- a bunch of snippets to use

  -- For vsnip users.
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  -- For ultisnips users.
  use 'SirVer/ultisnips'
  use 'quangnguyen30192/cmp-nvim-ultisnips'
  use 'honza/vim-snippets'

  -- For snippy users.
  use 'dcampos/nvim-snippy'
  use 'dcampos/cmp-snippy'

  -- LSP
  -- use { "williamboman/nvim-lsp-installer", commit = "e9f13d7acaa60aff91c58b923002228668c8c9e6" } -- simple to use language server installer
  use { "neovim/nvim-lspconfig", commit = "f11fdff7e8b5b415e5ef1837bdcdd37ea6764dda" } -- enable LSP
  use { "williamboman/mason.nvim", commit = "c2002d7a6b5a72ba02388548cfaf420b864fbc12"}
  use { "williamboman/mason-lspconfig.nvim", commit = "0051870dd728f4988110a1b2d47f4a4510213e31" }
  use { "jose-elias-alvarez/null-ls.nvim", commit = "c0c19f32b614b3921e17886c541c13a72748d450" } -- for formatters and linters
  use { "RRethy/vim-illuminate", commit = "a2e8476af3f3e993bb0d6477438aad3096512e42" }
  use "github/copilot.vim"

  -- Telescope
  use { "nvim-telescope/telescope.nvim", commit = "76ea9a898d3307244dce3573392dcf2cc38f340f" }
  use "nvim-telescope/telescope-ui-select.nvim"
  use "tom-anders/telescope-vim-bookmarks.nvim"
  use "nvim-telescope/telescope-media-files.nvim"
  -- use { 'MunifTanjim/eslint.nvim' }
  use { 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim' }


  -- Treesitter
  -- use {
  --   "nvim-treesitter/nvim-treesitter",
  --   commit = "8e763332b7bf7b3a426fd8707b7f5aa85823a5ac",
  -- }
  -- use {
    -- "nvim-treesitter/nvim-treesitter",
    -- tag = "v0.8.0",
  -- }
	use {
    "nvim-treesitter/nvim-treesitter",
	}
  use { 'm-demare/hlargs.nvim' }
  -- use { "p00f/nvim-ts-rainbow" }

  -- use { "hiphish/rainbow-delimiters.nvim" }

  use "windwp/nvim-ts-autotag"

  -- Git
  use { "lewis6991/gitsigns.nvim", commit = "f98c85e7c3d65a51f45863a34feb4849c82f240f" }
  use "tpope/vim-fugitive"
  use({
      "kdheepak/lazygit.nvim",
      -- optional for floating window border decoration
      requires = {
          "nvim-lua/plenary.nvim",
      },
  })

  -- DAP
  use { "mfussenegger/nvim-dap", commit = "6b12294a57001d994022df8acbe2ef7327d30587" }
  use { "rcarriga/nvim-dap-ui", commit = "1cd4764221c91686dcf4d6b62d7a7b2d112e0b13" }
  use { "ravenxrz/DAPInstall.nvim", commit = "8798b4c36d33723e7bba6ed6e2c202f84bb300de" }
  -- use {
  --   "microsoft/vscode-js-debug",
  --   opt = true,
  --   run = "npm install --legacy-peer-deps && npm run compile" 
  -- }
  use { "mxsdev/nvim-dap-vscode-js", commit = "079d0f3713c4649603290dc2ecc765e23e76a9fc",
      requires = { "mfussenegger/nvim-dap" } }

  -- MORE
  use 'sheerun/vim-polyglot'
  use 'eandrju/cellular-automaton.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
