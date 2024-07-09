vim.opt.hlsearch = true 				-- highlight search
vim.opt.incsearch = true 				-- incremental search
vim.opt.tabstop = 4 					-- number of columns for a tab
vim.opt.number = true					-- turn on line numbers
vim.opt.cursorline = true		 		-- highlight the current line
vim.opt.swapfile = false 				-- don't create swap files
vim.opt.ttyfast = true 					-- faster redrawing
vim.opt.cmdheight = 0 					-- don't show command bar
vim.opt.conceallevel = 0 				-- don't show conceal characters
vim.opt.whichwrap:append("<,>,[,]")     -- allow backspacing over wrapped lines
vim.opt.softtabstop = 0 				-- don't expand tabs to spaces
vim.opt.shiftwidth = 4 					-- number of spaces to use for indent
vim.expandtab = false 					-- don't use tabs for indent

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", 
    lazypath,
  }):wait()
end

vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup("plugins")

vim.keymap.set('n', '<C-t>', '<cmd>:Telescope file_browser<cr>')
vim.keymap.set('n', '<C-f>f', '<cmd>:Telescope grep_string<cr>')
vim.keymap.set('n', '<C-f>g', '<cmd>:Telescope resume<cr>')
vim.keymap.set('n', '<C-f>b', '<cmd>:Telescope buffers<cr>')
vim.keymap.set('n', '<C-f>t', '<cmd>:Telescope find_files<cr>')
vim.keymap.set('n', '<C-f>c', '<cmd>:Telescope git_commits<cr>')
vim.keymap.set('n', '<C-s>', '<cmd>:wa<cr>')
vim.keymap.set('n', '<A-j>', '<cmd>:m .+1<cr>==')
vim.keymap.set('n', '<A-k>', '<cmd>:m .-2<cr>==')
vim.keymap.set('i', '<A-j>', '<cmd><ESC>:m .+1<cr>==gi')
vim.keymap.set('i', '<A-k>', '<cmd><ESC>:m .-2<cr>==gi')
vim.keymap.set('v', '<A-j>', '<cmd>:m .+1<cr>gv==gv')
vim.keymap.set('v', '<A-k>', '<cmd>:m .-2<cr>gv==gv')
vim.keymap.set('n', '<A-p>', '<cmd>:%bd|e#)
vim.api.nvim_set_keymap('n', '<C-w>s', '<C-w>s<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-w>v', '<C-w>v<C-w>l', { noremap = true, silent = true })

require("configs")

-- auto format with LSP
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = {"*.lua", "*.ts", "*.rs" },
  callback = function()
    vim.lsp.buf.format({ async = true })
  end,
})
