return {
    "snacks.nvim",
    opts = {
        dashboard = {
            preset = {
                pick = function(cmd, opts)
                    return LazyVim.pick(cmd, opts)()
                end,
                -- Font Style = ANSI Shadow
                header = [[
██╗   ██╗ ██████╗ ██╗   ██╗    ███╗   ██╗███████╗██████╗ ██████╗ 
╚██╗ ██╔╝██╔═══██╗██║   ██║    ████╗  ██║██╔════╝██╔══██╗██╔══██╗
 ╚████╔╝ ██║   ██║██║   ██║    ██╔██╗ ██║█████╗  ██████╔╝██║  ██║
  ╚██╔╝  ██║   ██║██║   ██║    ██║╚██╗██║██╔══╝  ██╔══██╗██║  ██║
   ██║   ╚██████╔╝╚██████╔╝    ██║ ╚████║███████╗██║  ██║██████╔╝
   ╚═╝    ╚═════╝  ╚═════╝     ╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚═════╝ 
 ]].. "\n  cwd: " .. vim.fn.getcwd(),
                -- stylua: ignore
                ---@type snacks.dashboard.Item[]
                keys = {
                    { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                    { icon = "", key = "n", desc = "New File", action = function()
                        vim.ui.input({ prompt = "New file name: " }, function(fname)
                            if not fname or fname == "" then return end
                            vim.cmd("edit " .. vim.fn.fnameescape(fname))
                        end)
                    end,
                    },
                    { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
                    { icon = " ", key = "e", desc = "Open File Tree", action = function() Snacks.explorer({ cwd = LazyVim.root() }) end },
                    { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                    { icon = "󰪺 ", key  = "p", desc = "Recent Projects", action = function() LazyVim.pick("projects")() end, },
                    { icon = " ", key  = "o", desc = "Open GitHub", action = function()
                        local url = "https://github.com/Ernesto-B?tab=repositories"
                        if vim.loop.os_uname().sysname:match("Windows") then
                            -- on Windows use the builtin 'start' from cmd.exe:
                            vim.fn.jobstart({ "cmd.exe", "/C", "start", "", url }, { detach = true })
                        else
                            -- on *nix use the default opener
                            vim.fn.jobstart({ "xdg-open", url }, { detach = true })
                        end
                    end,
                    },
                    -- Dynamic "Open GitHub (open GitHub repo of current project)"
                    { icon = " ", key = "O", desc = "Open GitHub Repo", action = function()
                        -- 1) get git root; bail if not a git repo
                        local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
                        if vim.v.shell_error ~= 0 or git_root == "" then
                            vim.notify("Not in a git repo", vim.log.levels.ERROR)
                            return
                        end
                        -- 2) get origin URL
                        local origin = vim.fn.systemlist("git -C " .. vim.fn.fnameescape(git_root) .. " config --get remote.origin.url")[1]
                        if origin == "" then
                            vim.notify("No remote.origin.url found", vim.log.levels.ERROR)
                            return
                        end
                        -- 3) normalize to https
                        --    e.g. git@github.com:USER/REPO.git → https://github.com/USER/REPO
                        local url = origin
                            :gsub("^git@([^:]+):", "https://%1/")
                            :gsub("%.git$", "")
                        -- 4) open in browser
                        if vim.loop.os_uname().sysname:match("Windows") then
                            vim.fn.jobstart({ "cmd.exe", "/C", "start", "", url }, { detach = true })
                        else
                            vim.fn.jobstart({ "xdg-open", url }, { detach = true })
                        end
                    end },
                    { icon = " ", key = "s", desc = "Restore Session", section = "session" },
                    { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
                    { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
                    -- { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
                    { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                },
            },
        },
    },
}
