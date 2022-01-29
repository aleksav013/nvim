local status, lspconfig = pcall(require, "lspconfig")
if not status then
    return
end


vim.notify(vim.fn.expand('%:p'));
local extraArgs_opt = {};

if string.match(vim.fn.expand('%:p'),"/home/aleksa/mygit/mykernel/") then
    extraArgs_opt = { "--sysroot=/opt/aleksa", "--gcc-toolchain=/opt/aleksa/usr/bin/i686-aleksa-gcc", };
    vim.opt["shiftwidth"]=4;
    vim.opt["tabstop"]=4;
    vim.opt["expandtab"]=true;
    vim.notify("aleksav013/mykernel");
else
end


lspconfig.ccls.setup {

    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,

    flags = {
        debounce_text_changes = 150,
    };
    init_options = {
    compilationDatabaseDirectory = "build";
    cache = {
       directory = "/tmp/ccls-cache";
    };
    index = {
        threads = 0;
    };
    clang = {
        excludeArgs = { "-frounding-math"};
        extraArgs = extraArgs_opt;
        }
    };
}
