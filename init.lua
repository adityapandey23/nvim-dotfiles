require("config.lazy")
vim.opt.number = true
vim.opt.clipboard = "unnamedplus"
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

-- Oil nvim
vim.keymap.set("n", "<space>me", ":e ./<CR>")
vim.keymap.set("n", "<space>mb", function()
  local file = vim.fn.expand("%:p")             -- full path to current file
  local parent = vim.fn.fnamemodify(file, ":h") -- directory of file
  local up = vim.fn.fnamemodify(parent, ":h")   -- one level up
  vim.cmd("e " .. up)
end, { silent = true })

-- For Going into a definition and coming back
vim.keymap.set("n", "<space>gi", vim.lsp.buf.definition, { noremap = true, silent = true })
vim.keymap.set("n", "<space>gb", "<C-o>", { noremap = true, silent = true })

-- Tranparency
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
-- vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })

vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
vim.cmd("hi NormalNC guibg=NONE ctermbg=NONE")
vim.cmd("hi EndOfBuffer guibg=NONE ctermbg=NONE")

-- Highlight when yanking (copying) text
-- Try it with `yap` in normal mode
-- See `:help vim.highlight.on_yank()`

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
