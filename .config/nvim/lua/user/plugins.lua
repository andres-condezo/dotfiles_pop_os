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
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use { "wbthomason/packer.nvim", commit = "00ec5adef58c5ff9a07f11f45903b9dbbaa1b422" } -- Have packer manage itself
  use { "nvim-lua/plenary.nvim", commit = "968a4b9afec0c633bc369662e78f8c5db0eba249" } -- Useful lua functions used by lots of plugins
  use { "ahmedkhalf/project.nvim", commit = "541115e762764bc44d7d3bf501b6e367842d3d4f" }
  use { "lewis6991/impatient.nvim", commit = "969f2c5c90457612c09cf2a13fee1adaa986d350" }
  -- use { 'nathom/filetype.nvim' }

  use { "numToStr/Comment.nvim", commit = "2c26a00f32b190390b664e56e32fd5347613b9e2" }
  use { "JoosepAlviste/nvim-ts-context-commentstring", commit = "88343753dbe81c227a1c1fd2c8d764afb8d36269" }

  use { "kyazdani42/nvim-web-devicons", commit = "8d2c5337f0a2d0a17de8e751876eeb192b32310e" }
  use { "kyazdani42/nvim-tree.lua", commit = "bdb6d4a25410da35bbf7ce0dbdaa8d60432bc243" }
  use { "akinsho/bufferline.nvim", commit = "c78b3ecf9539a719828bca82fc7ddb9b3ba0c353" }
  use { "nvim-lualine/lualine.nvim", commit = "3362b28f917acc37538b1047f187ff1b5645ecdd" }
  use { "goolord/alpha-nvim", commit = "ef27a59e5b4d7b1c2fe1950da3fe5b1c5f3b4c94" }

  use { "lukas-reineke/indent-blankline.nvim", commit = "6177a59552e35dfb69e1493fd68194e673dc3ee2" }
  use { "windwp/nvim-autopairs", commit = "fa6876f832ea1b71801c4e481d8feca9a36215ec" } -- Autopairs, integrates with both cmp and treesitter
  use { "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" }
  use { "akinsho/toggleterm.nvim", commit = "aaeed9e02167c5e8f00f25156895a6fd95403af8" }

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
      vim.g.mkdp_browser = "surf"
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
  use { "folke/tokyonight.nvim" }
  use "LunarVim/onedarker.nvim"
  use { "lunarvim/darkplus.nvim", commit = "2584cdeefc078351a79073322eb7f14d7fbb1835" }
  -- use "lunarvim/darkplus.nvim"
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
  use "olimorris/onedarkpro.nvim"
  use "rmehri01/onenord.nvim"

  -- cmp plugins
  use { "hrsh7th/nvim-cmp", commit = "df6734aa018d6feb4d76ba6bda94b1aeac2b378a" } -- The completion plugin
  -- use { "hrsh7th/nvim-cmp" } -- The completion plugin
  use { "hrsh7th/cmp-buffer", commit = "62fc67a2b0205136bc3e312664624ba2ab4a9323" } -- buffer completions
  use { "hrsh7th/cmp-path", commit = "466b6b8270f7ba89abd59f402c73f63c7331ff6e" } -- path completions
  use { "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" } -- snippet completions
  use { "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" }
  -- use { "hrsh7th/cmp-nvim-lsp" }
  use { "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" }
  use "f3fora/cmp-spell"
  use "hrsh7th/cmp-emoji"
  use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
  use "notomo/cmp-neosnippet"
  use { 'hrsh7th/cmp-cmdline' }
  use { 'David-Kunz/cmp-npm' }

  -- snippets
  use { "L3MON4D3/LuaSnip", commit = "79b2019c68a2ff5ae4d732d50746c901dd45603a" } --snippet engine
  use { "rafamadriz/friendly-snippets", commit = "d27a83a363e61009278b6598703a763ce9c8e617" } -- a bunch of snippets to use

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
  use { "neovim/nvim-lspconfig", commit = "148c99bd09b44cf3605151a06869f6b4d4c24455" } -- enable LSP
  use { "williamboman/nvim-lsp-installer", commit = "e9f13d7acaa60aff91c58b923002228668c8c9e6" } -- simple to use language server installer
  use { "jose-elias-alvarez/null-ls.nvim", commit = "ff40739e5be6581899b43385997e39eecdbf9465" } -- for formatters and linters

  use { "RRethy/vim-illuminate", commit = "c82e6d04f27a41d7fdcad9be0bce5bb59fcb78e5" } -- Telescope
  use { "nvim-telescope/telescope.nvim", commit = "d96eaa914aab6cfc4adccb34af421bdd496468b0" }
  use "nvim-telescope/telescope-ui-select.nvim"
  use "tom-anders/telescope-vim-bookmarks.nvim"
  use "nvim-telescope/telescope-media-files.nvim"
  use { 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim' }
  use { "github/copilot.vim" }


  -- Treesitter
  -- use {
  --   "nvim-treesitter/nvim-treesitter",
  --   commit = "518e27589c0463af15463c9d675c65e464efc2fe",
  -- }

  -- use {
  --   "nvim-treesitter/nvim-treesitter",
  --   commit = "556388b",
  -- }

  use { "nvim-treesitter/nvim-treesitter" }
  use { 'm-demare/hlargs.nvim' }
  use { "p00f/nvim-ts-rainbow" }
  use "windwp/nvim-ts-autotag"

  -- Git
  use { "lewis6991/gitsigns.nvim", commit = "c18e016864c92ecf9775abea1baaa161c28082c3" }
  use "tpope/vim-fugitive"

  -- DAP
  use { "mfussenegger/nvim-dap", commit = "014ebd53612cfd42ac8c131e6cec7c194572f21d" }
  use { "rcarriga/nvim-dap-ui", commit = "d76d6594374fb54abf2d94d6a320f3fd6e9bb2f7" }
  use { "ravenxrz/DAPInstall.nvim", commit = "8798b4c36d33723e7bba6ed6e2c202f84bb300de" }

  use 'sheerun/vim-polyglot'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
