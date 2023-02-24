local status, mason = pcall(require, "mason")
if not status then
	return
end

-- mason
mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗"
		}
	}
})

-- mason-lspconfig
require("mason-lspconfig").setup {
	ensure_installed = { "pylsp", "bashls", "lua_ls", "cmake" },
}
require("mason-lspconfig").setup_handlers {
	function(server_name)
		require("lspconfig")[server_name].setup {}
	end
}

-- mason-null-ls
require('mason-null-ls').setup({
	automatic_setup = true,
	ensure_installed = {}
})
require('mason-null-ls').setup_handlers {
	function(source_name, methods)
		require("mason-null-ls.automatic_setup")(source_name, methods)
	end,
}

-- null_ls
local status, null_ls = pcall(require, "null-ls")
if not status then
	return
end
null_ls.setup()
