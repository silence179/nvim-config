return {
    "akinsho/bufferline.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    opts = {
        options = {
            diagnostics = "nvim_lsp",
            diagnostics_indicator = function(_, _, diagnostics_dict, _)
                local indicator = " "
                for level, number in pairs(diagnostics_dict) do
                    local symbol
                    if level == "error" then
                        symbol = ""
                    elseif level == "warning" then
                        symbol = ""
                    else
                        symbol = ""
                    end
                    indicator = indicator .. number .. symbol
                end
                return indicator
            end
        },
        highlights = {
            buffer_selected = {
                fg = '#ffffff', -- 选中的文字颜色（设为纯白）
                bold = true,
            }
        }
    },
    keys = {
        { "H", ":BufferLineCyclePrev<CR>",   silent = true },
        { "L", ":BufferLineCycleNext<CR>",   silent = true },
        { "<leader>bh", ":BufferLinePick<CR>",        silent = true },
        { "<leader>bd", ":bdelete<CR>",               silent = true },
        { "<leader>bo", ":BufferLineCloseOthers<CR>", silent = true },
    },
    lazy = false,
}
