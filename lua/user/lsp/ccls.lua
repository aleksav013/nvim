local status, lspconfig = pcall(require, "lspconfig")
if not status then
	return
end


vim.notify(vim.fn.expand('%:p'));
local extraArgs_opt = {};

if string.match(vim.fn.expand('%:p'), "/home/aleksa/mygit/benet.rs/") then
	vim.opt["shiftwidth"] = 2;
	vim.opt["tabstop"] = 2;
	vim.opt["expandtab"] = true;
	vim.notify("jsx");
end

if string.match(vim.fn.expand('%:p'), "/home/aleksa/mygit/oldrepos/mykernel/") then
	extraArgs_opt = { "--sysroot=/opt/aleksa", "--gcc-toolchain=/opt/aleksa/usr/bin/i686-aleksa-gcc", };
	vim.notify("mykernel");
end

if string.match(vim.fn.expand('%:p'), "/media/linux/") then
	extraArgs_opt = { "--sysroot=/media/linux/staging/", };
	vim.notify("linux");
end

if string.match(vim.fn.expand('%:p'), "/home/aleksa/files/arduino_avr") then
	extraArgs_opt = { "--sysroot=/usr/avr", };
	vim.notify("arduino-avr");
end

if string.match(vim.fn.expand('%:p'), "/home/aleksa/mygit/mykernel64") then
	extraArgs_opt = { "--sysroot=/home/aleksa/mygit/mykernel64/kernel", };
	vim.notify("mykernel64");
end


lspconfig.ccls.setup {

	on_attach = require("user.lsp.handlers").on_attach,
	capabilities = require("user.lsp.handlers").capabilities,

	flags = {
		debounce_text_changes = 150,
	},
	init_options = {
		cache = {
			directory = "/tmp/ccls-cache",
		},
		index = {
			threads = 0,
		},
		clang = {
			excludeArgs = { "-frounding-math" },
			extraArgs = extraArgs_opt,
		}
	},
}
