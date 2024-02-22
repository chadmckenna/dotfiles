local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "stevearc/conform.nvim",
    --  for users those who want auto-save conform + lazyloading!
    -- event = "BufWritePre"
    config = function()
      require "custom.configs.conform"
    end,
  },

  {
    "dustinblackman/oatmeal.nvim",
    cmd = { "Oatmeal" },
    keys = {
        { "<leader>om", mode = "n", desc = "Start Oatmeal session" },
    },
    opts = {
        backend = "ollama",
        model = "gemma:7b",
    },
  },

  { 
    "David-Kunz/gen.nvim",
    event = "VeryLazy",
    opts = {
      model = "mistral:latest",
      display_mode = "split",
      no_auto_close = true
    },
    config = function()
      require("custom.configs.gen")
    end
  },

  { "dj95/telescope-gen.nvim" },

}

return plugins
