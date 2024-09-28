-- General settings
vim.o.termguicolors = true   -- Enable 24-bit RGB colors

-- Set the mapleader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Lazy.nvim Plugin Manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Colorscheme
    {
      "joshdick/onedark.vim",
      lazy = false,
      priority = 1000,
      config = function()
        vim.cmd([[colorscheme onedark]])
      end,
    },

    -- Treesitter for enhanced syntax highlighting
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

    -- Log Highlighting
    { "mtdl9/vim-log-highlighting"},

    -- LSP and Autocompletion
    { "neovim/nvim-lspconfig" },
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "onsails/lspkind-nvim" },

    -- File explorer
    { "nvim-tree/nvim-tree.lua", keys = { { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" } } },

    -- Status line
    { "nvim-lualine/lualine.nvim", requires = { "nvim-tree/nvim-web-devicons", lazy = true }, config = function()
      require('lualine').setup {
        options = {
          theme = 'onedark',
        },
      }
    end },

    -- Git integration
    { "lewis6991/gitsigns.nvim", config = function()
      require('gitsigns').setup()
    end },

    -- Additional utilities
    { "tpope/vim-fugitive" },
    { "windwp/nvim-autopairs", config = function()
      require('nvim-autopairs').setup()
    end },
    { "norcalli/nvim-colorizer.lua", config = function()
      require('colorizer').setup()
    end },
    { "preservim/nerdcommenter" },

    -- Airline theme
    { "vim-airline/vim-airline" },
    { "vim-airline/vim-airline-themes" },

    -- Markdown support
    { "plasticboy/vim-markdown" },

    -- Icon support
    { "kyazdani42/nvim-web-devicons" },
  defaults = { lazy = true },
})

-- Treesitter setup
require('nvim-treesitter.configs').setup {
  ensure_installed = { "bash", "lua", "python", "json", "hyprlang" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

-- Filetype setup
vim.filetype.add {
  extension = {
    rasi = 'rasi',
  },
  pattern = {
    ['.*/waybar/config'] = 'jsonc',
    ['.*/mako/config'] = 'dosini',
    ['.*/kitty/*.conf'] = 'bash',
    ['.*/hypr/.*%.conf'] = 'hyprlang',
  },
}

-- Remove background
vim.cmd([[highlight Normal guibg=NONE ctermbg=NONE]])
vim.cmd([[highlight NonText guibg=NONE ctermbg=NONE]])

-- Enable vim-markdown syntax highlighting
vim.g.vim_markdown_folding_disabled = 1

-- Airline configuration
vim.g.airline_theme = 'onedark'
vim.g.airline_powerline_fonts = 1

vim.api.nvim_set_option("clipboard", "unnamedplus")
