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
  use { 'wbthomason/packer.nvim' }

  use { 'nvim-lua/popup.nvim' }
  use { 'nvim-lua/plenary.nvim' }
  use { 'windwp/nvim-autopairs' }
  use { 'numToStr/Comment.nvim' }
  use { 'kyazdani42/nvim-web-devicons' }
  use { 'kyazdani42/nvim-tree.lua' }
  use { 'akinsho/bufferline.nvim' }
  use { 'moll/vim-bbye' }
  use { 'nvim-lualine/lualine.nvim' }
  use { 'akinsho/toggleterm.nvim' }
  use { 'lewis6991/impatient.nvim' }
  use { 'goolord/alpha-nvim' }
  use { 'antoinemadec/FixCursorHold.nvim' }
  use { 'folke/which-key.nvim' }

  -- Colorschemes
  use { 'AlphaTechnolog/pywal.nvim' }
  use { 'dylanaraps/wal.vim' }
  use { 'lilydjwg/colorizer' }
  use { 'navarasu/onedark.nvim' }
  use { 'frenzyexists/aquarium-vim' }

  -- CMP plugins
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-nvim-lua' }
  use { 'hrsh7th/cmp-calc' }
  use { 'rcarriga/cmp-dap' }
  use { 'quangnguyen30192/cmp-nvim-ultisnips' }
  use { 'kdheepak/cmp-latex-symbols' }

  -- Snippets
  use { 'SirVer/UltiSnips' }

  -- Syntax highlighting
  use { 'neomutt/neomutt.vim' }

  -- LSP
  use { 'neovim/nvim-lspconfig' }
  use { 'williamboman/nvim-lsp-installer' }
  use { 'tamago324/nlsp-settings.nvim' }
  use { 'jose-elias-alvarez/null-ls.nvim' }
  use { 'onsails/lspkind-nvim' }
  use { 'tami5/lspsaga.nvim' }
  use { 'folke/trouble.nvim' }
  use { 'simrat39/symbols-outline.nvim' }
  use { 'ray-x/navigator.lua' }
  use { 'ray-x/guihua.lua' }
  use { 'ray-x/lsp_signature.nvim' }
  use { 'rmagatti/goto-preview' }

  -- Debugging
  use { 'mfussenegger/nvim-dap' }
  use { 'rcarriga/nvim-dap-ui' }
  use { 'theHamsta/nvim-dap-virtual-text' }
  use { 'ravenxrz/DAPInstall.nvim' }
  use { 'mfussenegger/nvim-dap-python' }
  use { 'nvim-telescope/telescope-dap.nvim' }

  -- Telescope
  use { 'nvim-telescope/telescope.nvim' }
  use { 'tom-anders/telescope-vim-bookmarks.nvim' }
  use { 'nvim-telescope/telescope-file-browser.nvim' }
  use { 'nvim-telescope/telescope-fzy-native.nvim' }
  use { 'nvim-telescope/telescope-ui-select.nvim' }
  use { 'nvim-telescope/telescope-media-files.nvim' }
  use { 'ghillb/cybu.nvim' }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }
  use { 'nvim-treesitter/playground' }
  use { 'JoosepAlviste/nvim-ts-context-commentstring' }

  -- Git
  use { 'lewis6991/gitsigns.nvim' }
  use { 'tpope/vim-rhubarb' }
  use { 'tpope/vim-fugitive' }

  -- LaTeX
  use { 'lervag/vimtex' }
  use { 'KeitaNakamura/tex-conceal.vim' }
  use { 'anufrievroman/vim-tex-kawaii' }

  -- Rust
  use { 'simrat39/rust-tools.nvim' }

  -- JavaScript
  use { 'pangloss/vim-javascript' }
  use { 'leafgarland/typescript-vim' }
  use { 'MaxMEllon/vim-jsx-pretty' }
  use { 'peitalin/vim-jsx-typescript' }

  -- HTML
  use { 'mattn/emmet-vim' } -- Fast typing
  use { 'Valloric/MatchTagAlways' } -- Highlight the closing tag
  use { 'alvan/vim-closetag' } -- Auto close tags

  -- Markdown
  use { 'ferrine/md-img-paste.vim' }
  use { 'iamcco/markdown-preview.nvim', run = 'cd app && npm install' } -- View markdown
  use { 'preservim/vim-markdown' }
  use { 'mzlogin/vim-markdown-toc' }

  -- Other
  use { 'lukas-reineke/indent-blankline.nvim' }
  -- use { 'github/copilot.vim' } -- AI suggestions
  use { 'folke/zen-mode.nvim' } -- Distraction free writing
  use { 'folke/twilight.nvim' } -- Highlight certain lines
  use { 'scrooloose/nerdcommenter' }
  use { 'tpope/vim-surround' }
  use { 'kdheepak/lazygit.nvim' }
  use { 'dhruvasagar/vim-table-mode' }
  use { 'p00f/nvim-ts-rainbow' }
  use { 'machakann/vim-highlightedyank' }
  use { 'marcushwz/nvim-workbench' }
  use { 'booperlv/nvim-gomove' }
  use { 'AndrewRadev/splitjoin.vim' }
  use { 'mtdl9/vim-log-highlighting' }
  use { 'windwp/nvim-ts-autotag' }
  use { 'folke/lua-dev.nvim' }
  use { 'turbio/bracey.vim' }
  use { 'danymat/neogen' }
  use { 'haya14busa/is.vim' }
  use { 'mhinz/vim-grepper' }
  use { 'folke/todo-comments.nvim' }
  use {
    'xeluxee/competitest.nvim',
    requires = 'MunifTanjim/nui.nvim',
    config = function() require'competitest'.setup() end
  }
  use {
    'ahmedkhalf/project.nvim',
    config = function()
      require("project_nvim").setup {
        manual_mode = false,
        detection_methods = { "lsp", "pattern" },
        patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "Cargo.toml" },
        ignore_lsp = {},
        exclude_dirs = {},
        show_hidden = false,
        silent_chdir = true,
        datapath = vim.fn.stdpath("data")
      }
    end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
