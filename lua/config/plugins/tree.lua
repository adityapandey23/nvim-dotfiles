return {
  "nvim-tree/nvim-tree.lua",
  keys = {
    { "<C-A-b>", "<cmd>NvimTreeToggle<CR>", desc = "Toggle NvimTree sidebar" },
  },
  opts = {
    view = {
      side = "right",
      width = 30,
    },
    renderer = {
      root_folder_label = false,
    },
  },
}
