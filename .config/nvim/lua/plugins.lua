return {
        {
                "projekt0n/github-nvim-theme",
                lazy = false,
                priority = 1000,
                config = function()
                        vim.cmd("colorscheme github_dark_dimmed")
                end,
        },
        {
                "nvim-telescope/telescope.nvim",
                tag = "0.1.6",
                dependencies = { "nvim-lua/plenary.nvim" },
        },
        {
                "nvim-telescope/telescope-fzf-native.nvim",
                dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        },
        { "nvim-telescope/telescope-file-browser.nvim" },
        {
                "nvim-treesitter/nvim-treesitter",
                build = ":TSUpdate",
                config = function()
                        local configs = require("nvim-treesitter.configs")
                        configs.setup({
                                ensure_installed = {
                                        "toml",
                                        "markdown",
                                        "c",
                                        "lua",
                                        "vim",
                                        "vimdoc",
                                        "query",
                                        "rust",
                                        "typescript",
                                        "javascript",
                                        "html",
                                },
                                sync_install = false,
                                highlight = { enable = true },
                                indent = { enable = true },
                        })
                end,
        },
        { "williamboman/mason.nvim" },
        {
                "j-hui/fidget.nvim",
                opts = {},
        },
        { "neovim/nvim-lspconfig",
                        config = function()
                        -- Setup language servers.
                        local on_attach = function(client, bufnr)
                        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                end

                        -- Rust
                        vim.lsp.config('rust_analyzer', {
                                settings = {
                                        ["rust-analyzer"] = {
                                                cargo = {
                                                        allFeatures = true,
                                                },
                                                imports = {
                                                        group = {
                                                                enable = true,
                                                        },
                                                },
                                                completion = {
                                                        postfix = {
                                                                enable = false,
                                                        },
                                                },
                                        },
                                },
                        })
                vim.lsp.enable('rust_analyzer');
                end
        },
        {
                "hrsh7th/nvim-cmp",
                event = "InsertEnter",
                dependencies = {
                        'neovim/nvim-lspconfig',
                        "hrsh7th/cmp-nvim-lsp",
                        "hrsh7th/cmp-buffer",
                        "hrsh7th/cmp-path",
                },
                config = function()
                        local cmp = require("cmp")
                        cmp.setup({
                                preselect = cmp.PreselectMode.None,
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
                                        { name = "copilot" },
                                        { name = "path" },
                                        { name = "buffer" },
                                },
                        })

                cmp.setup.cmdline(':', {
                                sources = cmp.config.sources({
                                        { name = 'path' }
                                })
                        })
                end

        },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        {
                "nvim-lualine/lualine.nvim",
                dependencies = { "nvim-tree/nvim-web-devicons" },
        },
        {
                'rust-lang/rust.vim',
                ft = { "rust" },
                config = function()
                        vim.g.rustfmt_autosave = 1
                        vim.g.rustfmt_emit_files = 1
                        vim.g.rustfmt_fail_silently = 0
                        vim.g.rust_clip_command = 'wl-copy'
                end
        },
        { "ellisonleao/glow.nvim", config = true, cmd = "Glow" },
        { "kosayoda/nvim-lightbulb" },
        { "BurntSushi/ripgrep" },
        { "rmagatti/auto-session" },
        { "mbbill/undotree" },
        { "zbirenbaum/copilot-cmp",
                dependencies = { "zbirenbaum/copilot.lua" },
                config = function()
        require("copilot_cmp").setup()
                end,
        },
        {"zbirenbaum/copilot.lua",
                cmd = "Copilot",
                event = "InsertEnter",
                config = function()
                require("copilot").setup({})
                end
        },
        {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
                { "zbirenbaum/copilot.lua" },
                        { "nvim-lua/plenary.nvim", branch = "master" },
        },
        build = "make tiktoken", -- Only on MacOS or Linux
        opts = {
        },
        },
        {
                "ray-x/lsp_signature.nvim",
                event = "VeryLazy",
                opts = {},
                config = function(_, opts)
                        require "lsp_signature".setup({
                                doc_lines = 0,
                                handler_opts = {
                                        border = "rounded"
                                },
                        })
                end
        },
        {
                "shortcuts/no-neck-pain.nvim",
                config = function()
                        require("no-neck-pain").setup()
                end,
        },
        {
                "lewis6991/gitsigns.nvim",
                config = function()
                        require("gitsigns").setup()
                end,
        },
        {
                "nwiizo/cargo.nvim",
                build = "cargo build --release",
                config = function()
                require("cargo").setup({
                float_window = true,
                window_width = 0.8,
                window_height = 0.8,
                border = "rounded",
                auto_close = true,
                close_timeout = 5000,
        })
                end,
                ft = { "rust" },
                cmd = {
                "CargoBench",
                "CargoBuild",
                "CargoClean",
                "CargoDoc",
                "CargoNew",
                "CargoRun",
                "CargoRunTerm",
                "CargoTest",
                "CargoUpdate",
                "CargoCheck",
                "CargoClippy",
                "CargoFmt",
                }
        }
}
