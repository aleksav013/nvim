vim.opt.fileencoding = "utf-8"
vim.opt.wrap = false
vim.opt.cmdheight = 1
-- vim.opt.mouse = "a"
vim.opt.cursorline = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.showtabline = 2
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 300
vim.opt.timeoutlen = 1000
vim.opt.undofile = true
vim.opt.clipboard = "unnamedplus"
-- vim.opt.termguicolors = true
vim.opt.shortmess:append("sI")

-- Open a file from its last left off position
vim.cmd [[ au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif ]]
