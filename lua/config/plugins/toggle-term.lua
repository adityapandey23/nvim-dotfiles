return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        direction = "float", -- make it an overlay box
      })

      vim.keymap.set("n", "to", "<cmd>ToggleTerm<CR>", { noremap = true, silent = true }) -- open/toggle
     -- Close with 'tc' (terminal mode)
      vim.keymap.set("t", "tc", [[<C-\><C-n><cmd>ToggleTermToggleAll<CR>]], { noremap = true, silent = true })
    end,
  }
}
