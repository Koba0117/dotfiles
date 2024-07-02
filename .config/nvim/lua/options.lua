vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set clipboard+=unnamedplus")
vim.g.mapleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"

vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])

vim.api.nvim_set_keymap("n", "L", "<cmd>bnext<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "H", "<cmd>bprevious<CR>", { silent = true })
