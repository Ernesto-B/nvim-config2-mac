-- Helper: render the current Harpoon list inside a Telescope picker.
local function toggle_telescope(harpoon_files)
    local conf = require("telescope.config").values
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end
    require("telescope.pickers")
        .new({}, {
            prompt_title = "harpoon",
            finder = require("telescope.finders").new_table({ results = file_paths }),
            previewer = conf.file_previewer({}),
            sorter = conf.generic_sorter({}),
        })
        :find()
end

return {
    "theprimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    opts = {},
    config = function(_, opts)
        require("harpoon"):setup(opts)
    end,
    keys = {
        {
            "<leader>a",
            function()
                require("harpoon"):list():add()
                vim.notify("File added to Harpoon", vim.log.levels.INFO)
            end,
            desc = "harpoon file",
        },
        {
            "<leader>A",
            function() toggle_telescope(require("harpoon"):list()) end,
            desc = "harpoon quick menu (telescope ui)",
        },
        { "<leader>1", function() require("harpoon"):list():select(1) end, desc = "harpoon to file 1" },
        { "<leader>2", function() require("harpoon"):list():select(2) end, desc = "harpoon to file 2" },
        { "<leader>3", function() require("harpoon"):list():select(3) end, desc = "harpoon to file 3" },
        { "<leader>4", function() require("harpoon"):list():select(4) end, desc = "harpoon to file 4" },
        { "<leader>5", function() require("harpoon"):list():select(5) end, desc = "harpoon to file 5" },
        {
            "<leader>C",
            function()
                require("harpoon"):list():clear()
                vim.notify("Harpoon list cleared", vim.log.levels.INFO)
            end,
            desc = "clear all harpoon marks",
        },
        {
            "<leader>r",
            function()
                require("harpoon"):list():remove()
                vim.notify("File removed from Harpoon", vim.log.levels.INFO)
            end,
            desc = "remove current file from harpoon",
        },
        { "<leader>]", function() require("harpoon"):list():next() end, desc = "Harpoon: next file" },
        { "<leader>[", function() require("harpoon"):list():prev() end, desc = "Harpoon: prev file" },
    },
}
