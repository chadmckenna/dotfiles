---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },

    ["<leader>gp"] = {"<Esc><cmd>lua require('telescope').extensions.gen.prompts({ mode = 'n'})<CR>"},

  },
  v = {
    [">"] = { ">gv", "indent"},

    ["<leader>gp"] = {"<Esc><cmd>lua require('telescope').extensions.gen.prompts({ mode = 'v'})<CR>"},
  },
}

-- more keybinds!

return M
