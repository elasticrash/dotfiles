require("configs.lsp")
require("configs.statusline")
require("configs.typescript")
require('copilot').setup({
  panel = {
    enabled = true,
    auto_refresh = false,
    keymap = {
      jump_prev = "[[",
      jump_next = "]]",
      accept = "<CR>",
      refresh = "gr",
      open = "<M-CR>"
    },
    layout = {
      position = "bottom", -- | top | left | right | horizontal | vertical
      ratio = 0.4
    },
  },
  suggestion = {
    enabled = true,
    auto_trigger = true,
    hide_during_completion = true,
    debounce = 75,
    keymap = {
      accept = "<M-l>",
      accept_word = false,
      accept_line = false,
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>",
    },
  },
  filetypes = {
    yaml = false,
    markdown = false,
    help = false,
    gitcommit = false,
    gitrebase = false,
    hgcommit = false,
    svn = false,
    cvs = false,
    ["."] = false,
  },
  copilot_node_command = 'node', -- Node.js version must be > 18.x
  server_opts_overrides = {},
})

-- glow
require("glow").setup()
-- mason
require("mason").setup()
-- lightbulb
local lb = require("nvim-lightbulb")
lb.setup({ autocmd = { enabled = true } })
-- auto session
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
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
