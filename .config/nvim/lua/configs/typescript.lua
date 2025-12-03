-- typescript
vim.lsp.config("ts_ls", {
        on_attach = on_attach,
        filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
        cmd = { "typescript-language-server", "--stdio" },
})

local status, prettier = pcall(require, "prettier")
if not status then
        return
end

prettier.setup({
        bin = "prettierd",
        filetypes = {
                "css",
                "javascript",
                "typescript",
                "json",
        },
})
