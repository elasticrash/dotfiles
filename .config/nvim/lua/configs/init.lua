require("configs.lsp")
require("configs.statusline")
require("configs.typescript")
require("configs.cody")
-- glow
require("glow").setup()
-- mason
require("mason").setup()
-- lightbulb
local lb = require("nvim-lightbulb")
lb.setup({ autocmd = { enabled = true } })
-- rust specific
vim.g.rustaceanvim = {
	tools = {},
	server = {
		on_attach = function(_, bufnr)
			vim.keymap.set("n", "<C-a>", function()
				vim.cmd.RustLsp({ "hover", "actions" })
			end, { desc = "Code Action", buffer = bufnr })
		end,
		default_settings = {
			["rust-analyzer"] = {},
		},
	},
	dap = {},
}

-- completion
local cmp = require("cmp")
cmp.setup({
	preselect = cmp.PreselectMode.None,
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	mapping = {
		["<Up>"] = cmp.mapping.select_prev_item(),
		["<Down>"] = cmp.mapping.select_next_item(),
		["<Enter>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		}),
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "vsnip" },
		{ name = "cody" },
		{ name = "path" },
		{ name = "buffer" },
	},
})

-- auto session
local opts = {
	log_level = "info",
	auto_session_enable_last_session = false,
	auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
	auto_session_enabled = true,
	auto_save_enabled = nil,

	auto_restore_enabled = nil,
	auto_session_suppress_dirs = nil,
	auto_session_use_git_branch = nil,
	bypass_session_save_file_types = nil,
}

require("auto-session").setup(opts)

-- telescope
require("telescope").load_extension("file_browser")

-- treesitter
require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", "rust", "toml" },
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	ident = { enable = true },
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
})
