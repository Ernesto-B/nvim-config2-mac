-- ~/.config/nvim/lua/plugins/grug-far.lua
return {
    "MagicDuck/grug-far.nvim",
    version = "1.6.3",
    event = "VeryLazy",

    init = function()
        -- Try to load the renderer module
        local ok, results = pcall(require, "grug-far.render.resultsList")
        if not ok or type(results) ~= "table" then
            return
        end

        -- Patch addResultChunkHighlights
        if type(results.addResultChunkHighlights) == "function" then
            local orig1 = results.addResultChunkHighlights
            results.addResultChunkHighlights = function(self, state, chunk)
                if not (state and type(state.hl) == "table") then
                    return
                end
                pcall(orig1, self, state, chunk)
            end
        end

        -- Patch setError (line ~394 in their source)
        if type(results.setError) == "function" then
            local orig2 = results.setError
            results.setError = function(self, state, err)
                if not (state and type(state.hl) == "table") then
                    return
                end
                pcall(orig2, self, state, err)
            end
        end
    end,

    config = function()
        require("grug-far").setup({
            -- your options here (if any)
        })
    end,
}
