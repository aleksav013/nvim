local mason_status, mason = pcall(require, "mason")
if not mason_status then
	print("lsp/mason.lua: loading mason failed")
	return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	print("lsp/mason.lua: loading mason-lspconfig failed")
	return
end

local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	print("lsp/mason.lua: loading lspconfig failed")
	return
end

local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	print("lsp/mason.lua: loading mason-null-ls failed")
	return
end

local null_ls_status, null_ls = pcall(require, "null-ls")
if not null_ls_status then
	print("lsp/mason.lua: loading null-ls failed")
	return
end


local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

local servers = {
	"pylsp", "bashls", "lua_ls", "cmake"
}


-- mason
mason.setup(settings)

-- mason-lspconfig
mason_lspconfig.setup({
	ensure_installed = servers,
	automatic_installation = true,
})

--table.insert(servers, "ccls")
mason_lspconfig.setup_handlers {
	function(server_name)
		lspconfig[server_name].setup {
			on_attach = require("user.lsp.handlers").on_attach,
			capabilities = require("user.lsp.handlers").capabilities,
		}
	end,
}

-- mason-null-ls
mason_null_ls.setup({
	automatic_setup = true,
	ensure_installed = {},
	handlers = {
		function(source_name, methods)
			require("mason-null-ls.automatic_setup")(source_name, methods)
		end,
	},
})

-- null_ls
null_ls.setup()
