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
      -- helper to register and enable a server
      local function register(name, conf)
	-- register config with Neovim's native API
	if conf == nil then conf = {} end
	-- either set table by key or call the function form
	-- both are acceptable: vim.lsp.config['name'] = conf  OR  vim.lsp.config(name, conf)
	vim.lsp.config[name] = conf
	-- enable it so it will attach to matching filetypes
	vim.lsp.enable(name)
      end

      -- Lua language server
      register("lua_ls", {
	cmd = { "lua-language-server" },      -- or path to your built binary
	filetypes = { "lua" },
	settings = {
	  Lua = {
	    diagnostics = { globals = { "vim" } },
	    workspace = { checkThirdParty = false },
	  },
	},
      })

      -- clangd (C/C++)
      register("clangd", {
	cmd = { "/usr/bin/clangd" }, -- keep your custom cmd
	filetypes = { "c", "cpp", "objc", "objcpp" },
	root_dir = function(fname)
	  -- you can keep using lspconfig's root detection helpers if needed,
	  -- or implement a custom root detection here.
	  return vim.fs.find({ 'compile_commands.json', 'compile_flags.txt', '.git' }, { path = vim.fn.fnamemodify(fname, ':p:h'), upward = true })[1]
	end,
      })

      -- If you have more servers to add later (via Mason), you can register them
      -- similarly here or let Mason manage install and then enable by name.

      -- load your diagnostics config (same as before)
      require("config.lsp.diagnostics")
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
