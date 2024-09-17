-- lsp
require("lspconfig").ts_ls.setup({})
require("fidget").setup()

vim.o.completeopt = "menuone,noinsert,noselect"
vim.opt.shortmess = vim.opt.shortmess + "c"

vim.lsp.inlay_hint.enable()

vim.diagnostic.config({
	virtual_text = false,
	float = { border = "rounded" },
})

vim.o.updatetime = 250
vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
vim.cmd([[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335 guifg=#abb2bf]])
