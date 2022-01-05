local status, lspconfig = pcall(require, "lspconfig")
if not status then
    return
end


vim.notify(vim.fn.expand('%:p'));
local extraArgs_opt = {};

if string.match(vim.fn.expand('%:p'),"/home/aleksa/mygit/mykernel/") then
    extraArgs_opt = { "--sysroot=/home/aleksa/mygit/mykernel/sysroot", "--gcc-toolchain=/usr/bin/i686-elf-gcc", "-ffreestanding", "-nobuiltininc"};
else
end


lspconfig.ccls.setup {
    on_attach = on_attach,
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
