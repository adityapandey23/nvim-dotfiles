-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
-- rtp -> runtimepath; this tell about put lazy in the runtime path
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

function ColorMyPencils(color)
  color = color or "aura-dark"  -- Default to 'rose-pine' colorscheme
  vim.cmd.colorscheme(color)

  -- Set transparency for Normal background
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })  -- For non-current windows
  vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })  -- If you want transparent vertical splits
end

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- { "baliestri/aura-theme", config = function() vim.cmd.colorscheme "aura-dark" end },
    {
      "baliestri/aura-theme",
      lazy = false,
      priority = 1000,
      config = function(plugin)
	vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
	vim.cmd([[colorscheme aura-dark]])
      end
    },
    {import = "config.plugins"}
  },
})

-- ColorMyPencils()
