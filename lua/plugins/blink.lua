-- ~/.config/nvim/lua/plugins/blink-override.lua
return {
    {
        "saghen/blink.cmp",
        opts = function(_, opts)
            opts.fuzzy = opts.fuzzy or {}
            opts.fuzzy.implementation = "lua" -- or "prefer_rust"
            return opts
        end,
    },
}
