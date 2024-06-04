local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "<C-h>a", function() harpoon:list():add() end)


vim.keymap.set("n", "<C-h>y", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-h>u", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-h>i", function() harpoon:list():select(3) end)

vim.keymap.set("n", "<C-h>o", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-h>p", function() harpoon:list():next() end)


-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)

    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
    { desc = "Open harpoon window" })
