return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8', dependencies = { 'nvim-lua/plenary.nvim' },
  { "rose-pine/neovim", name = "rose-pine" },
  { "nvim-treesitter/nvim-treesitter", build = ':TSUpdate'},
  { "theprimeagen/harpoon" },
  { "mbbill/undotree" },
  {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
  {'neovim/nvim-lspconfig'},
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/nvim-cmp'},
  {'L3MON4D3/LuaSnip'},
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "nvim-tree/nvim-tree.lua" },
  "tpope/vim-fugitive",
  -- CoPilot w/ Tonic:
  "github/copilot.vim"
}
