local servers = { "bashls", "pylsp", "texlab", "sumneko_lua" }

local status, lsp_installer_servers = pcall(require, "nvim-lsp-installer.servers")
if not status then
    return
end

for _, server in pairs(servers) do
    local _, requested_server = lsp_installer_servers.get_server(server)
    if not requested_server:is_installed() then
        -- Queue the server to be installed
        requested_server:install()
    end
end


local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
    return
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = require("user.lsp.handlers").on_attach,
        capabilities = require("user.lsp.handlers").capabilities,
    }

    if server.name == "bashls" then
        local bashls_opts = require("user.lsp.settings.bashls")
        opts = vim.tbl_deep_extend("force", bashls_opts, opts)
    end

    if server.name == "texlab" then
        local texlab_opts = require("user.lsp.settings.texlab")
        opts = vim.tbl_deep_extend("force", texlab_opts, opts)
    end

    if server.name == "sumneko_lua" then
        local sumneko_opts = require("user.lsp.settings.sumneko_lua")
        opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    end

    if server.name == "pylsp" then
        local pylsp_opts = require("user.lsp.settings.pylsp")
        opts = vim.tbl_deep_extend("force", pylsp_opts, opts)
    end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)
