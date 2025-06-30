return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8', dependencies = { 'nvim-lua/plenary.nvim' },
  { 'rose-pine/neovim', name = 'rose-pine' },
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  { 'mbbill/undotree' },
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/nvim-cmp'},
  {'L3MON4D3/LuaSnip',
    dependencies = {
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets'
    }
  },
  {'neovim/nvim-lspconfig'},
  { 'mason-org/mason.nvim' },
  {
    'mason-org/mason-lspconfig.nvim',
    dependencies = {
      'mason-org/mason.nvim',
      'neovim/nvim-lspconfig',
    },
  },
  { 'nvim-tree/nvim-tree.lua' },
  'tpope/vim-fugitive',
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  -- CoPilot
  'github/copilot.vim'
}
