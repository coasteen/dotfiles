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

-- PREPEND YOUR LOCAL CONFIG PATH TO package.path for patched project_nvim.project
local config_path = vim.fn.stdpath("config") .. "/lua/?.lua;" .. vim.fn.stdpath("config") .. "/lua/?/init.lua;"
package.path = config_path .. package.path

require("lazy").setup({

  -- colorscheme plugin
  {
    "morhetz/gruvbox",
    lazy = false,
  },

  -- startup screen
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- icons
  "nvim-tree/nvim-web-devicons",

  -- fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup {
        defaults = {
          layout_strategy = "horizontal",
          sorting_strategy = "ascending",
          prompt_prefix = "🔍 ",
        }
      }
    end,
  },

  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = { "lua", "python", "bash", "javascript", "json" },
        highlight = { enable = true },
        indent = { enable = true },
      }
    end,
  },

  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup {
        options = {
          theme = "gruvbox",
          icons_enabled = false,
          section_separators = "",
          component_separators = "",
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = { "filename" },
          lualine_x = { "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        inactive_sections = {
          lualine_c = { "filename" },
          lualine_x = { "location" },
        },
      }
    end,
  },

  -- git signs
  {
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitsigns").setup()
    end,
  },

  -- commenting helper
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },

  -- autopairs
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup{}
    end,
  },

  -- project management (patched)
  {
    "ahmedkhalf/project.nvim",
    config = function()
      -- Force reload patched project module before setup
      package.loaded["project_nvim.project"] = nil
      package.loaded["project_nvim"] = nil

      require("project_nvim").setup {}
      require("telescope").load_extension("projects")
    end,
  },

  -- bufferline
  {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup {
        options = {
          separator_style = "slant",
          show_close_icon = false,
          show_buffer_close_icons = false,
          diagnostics = "nvim_lsp",
        }
      }
    end,
  },

  -- which-key
  {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {}
    end,
  },

  -- LSP and completion
  {
    "williamboman/mason.nvim",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    config = true,
  },
  {
    "neovim/nvim-lspconfig",
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
        }),
      }
    end,
  },

})

-- Your existing vim options (you can keep or remove as you want)
vim.o.swapfile = false
vim.o.backup = false
vim.o.undofile = true
vim.o.updatetime = 200
vim.o.timeoutlen = 300

vim.wo.number = true
vim.wo.relativenumber = true

vim.o.clipboard = "unnamedplus"

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true

vim.o.autochdir = true
vim.o.showmode = false

-- Load your fennel config file safely
pcall(require, "config")

vim.cmd("colorscheme gruvbox")
