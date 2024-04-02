
function GET_FORMATTED_CWD()
    return vim.fn.getcwd():gsub(os.getenv("HOME"), "~")
end

local function get_virtual_env()
    return vim.fs.basename(os.getenv("VIRTUAL_ENV"))
end

function GET_FORMATTED_VIRTUAL_ENV()
    if vim.bo.filetype == 'python' then
        return "<" .. get_virtual_env() .. ">"
    end
    return ""
end

function DETECT_INDENT_TYPE()
    if vim.bo.expandtab then
        return vim.bo.shiftwidth .. " spaces"
    else
        return vim.bo.shiftwidth / vim.bo.tabstop .. " tabs (" .. vim.bo.tabstop .. ")"
    end
end

return {
    'nvim-lualine/lualine.nvim',
    config = function()
        require("lualine").setup({
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_c = {
                    'GET_FORMATTED_CWD()',
                    {
                        'filename',
                        file_status = true,
                        path = 1
                    },
                },
                lualine_x = {'GET_FORMATTED_VIRTUAL_ENV()', 'DETECT_INDENT_TYPE()', 'filetype'},
                lualine_y = {'progress'},
                lualine_z = {'location'},
              },
        })
    end,
    dependencies = { 'kyazdani42/nvim-web-devicons' }
}