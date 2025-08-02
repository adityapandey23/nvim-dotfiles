-- I've added the following language servers
-- 1. lua: for lua
-- 2. clang: for C and C++
-- Dear future me, please remember that you add rest of the language servers via Mason, please!

return {
    {
	"neovim/nvim-lspconfig",
	dependencies = {
	    {
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
		    library = {
			-- See the configuration section for more details
			-- Load luvit types when the `vim.uv` word is found
			{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
		    },
		},
	    },
	},
	config = function()
	    require("lspconfig").lua_ls.setup {}
	    -- require("lspconfig").gopls.setup{}
	    -- require("lspconfig").ts_ls.setup{}
	    --[[
	    require("lspconfig").jdtls.setup{
		cmd = {"/home/aditya/.local/bin/jdtls"}
	    }
	    ]]
	    require("lspconfig").clangd.setup{
		cmd = {"/usr/bin/clangd"}
	    }

	    require("config.lsp.diagnostics") -- ✅ load diagnostics config
	end,
    },
    -- I really don't remember what the fuck is this
    -- I'll def need this
    {
	'nvim-java/nvim-java',
	dependencies = {
	    "nvim-java/lua-async-await",
	    "nvim-java/nvim-java-core",
	    "nvim-java/nvim-java-test",
	    "nvim-java/nvim-java-dap",
	    "mfussenegger/nvim-dap",
	    "neovim/nvim-lspconfig",
	},
    }
}
