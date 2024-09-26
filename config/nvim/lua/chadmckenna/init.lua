require("chadmckenna.config.lazy")
require("chadmckenna.remap")
require("chadmckenna.set")

require("nvim-tree").setup({
  renderer = {
    icons = {
      show = {
        git = false,
        file = false,
        folder = false,
        folder_arrow = false
      },
      glyphs = {
        symlink = ""
      }
    }
  }
})

