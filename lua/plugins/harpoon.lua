return {
    "theprimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    config = function()
        local ui = require("harpoon.ui")
        local harpoon = require("harpoon")
        harpoon:setup({})

        -- function to use telescope as the harpoon ui
        local conf = require("telescope.config").values
        local function toggle_telescope(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            require("telescope.pickers")
                .new({}, {
                    prompt_title = "harpoon",
                    finder = require("telescope.finders").new_table({
                        results = file_paths,
                    }),
                    previewer = conf.file_previewer({}),
                    sorter = conf.generic_sorter({}),
                })
                :find()
        end

        -- key mappings
        vim.keymap.set("n", "<leader>a", function()
            harpoon:list():add()
            vim.notify("File added to Harpoon", vim.log.levels.INFO)
        end, { desc = "harpoon file" })
        vim.keymap.set("n", "<leader>A", function()
            toggle_telescope(harpoon:list())
        end, { desc = "harpoon quick menu (telescope ui)" })
        vim.keymap.set("n", "<leader>1", function()
            harpoon:list():select(1)
        end, { desc = "harpoon to file 1" })
        vim.keymap.set("n", "<leader>2", function()
            harpoon:list():select(2)
        end, { desc = "harpoon to file 2" })
        vim.keymap.set("n", "<leader>3", function()
            harpoon:list():select(3)
        end, { desc = "harpoon to file 3" })
        vim.keymap.set("n", "<leader>4", function()
            harpoon:list():select(4)
        end, { desc = "harpoon to file 4" })
        vim.keymap.set("n", "<leader>5", function()
            harpoon:list():select(5)
        end, { desc = "harpoon to file 5" })
        vim.keymap.set("n", "<leader>C", function()
            require("harpoon"):list():clear()
            vim.notify("Harpoon list cleared", vim.log.levels.INFO)
        end, { desc = "clear all harpoon marks" })
        vim.keymap.set("n", "<leader>r", function()
            require("harpoon"):list():remove()
            vim.notify("File removed from Harpoon", vim.log.levels.INFO)
        end, { desc = "remove current file from harpoon" })
        vim.keymap.set("n", "<leader>]", function()
            harpoon:list():next()
        end, { desc = "Harpoon: next file" })
        vim.keymap.set("n", "<leader>[", function()
            harpoon:list():prev()
        end, { desc = "Harpoon: prev file" })
    end,
}
