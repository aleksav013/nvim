require "user.lsp.mason"

local status, lspconfig = pcall(require, "lspconfig")
if not status then
    return
end

require "user.lsp.ccls"
