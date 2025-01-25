return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
      require('telescope').setup {
	pickers = {
	  find_files = {
	    theme = "ivy"
	  }
	}
      }

      vim.keymap.set("n", "<space>fh", require('telescope.builtin').help_tags) -- find help
      vim.keymap.set("n", "<space>fd", require('telescope.builtin').find_files) -- find directory
      vim.keymap.set("n", "<space>en", function() -- directly have the nvim config folder
	require('telescope.builtin').find_files {
	  cwd = vim.fn.stdpath("config")
	}
      end)
      vim.keymap.set("n", "<space>ep", function() -- get all the plugin's files directory
	require('telescope.builtin').find_files {
	  cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
	}
      end)
      require "config.telescope.multigrep".setup()
    end
  }
}
