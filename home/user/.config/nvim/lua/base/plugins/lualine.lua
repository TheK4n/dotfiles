
function get_formatted_cwd()
    return vim.fn.getcwd():gsub(os.getenv("HOME"), "~")
end

local function get_virtual_env()
    return vim.fs.basename(os.getenv("VIRTUAL_ENV"))
end

function get_formatted_virtual_env()
    if vim.bo.filetype == 'python' then
        return "<" .. get_virtual_env() .. ">"
    end
    return ""
end

function detect_indent_type()
    if vim.bo.expandtab then
        return "indent: " .. vim.bo.tabstop .. "s"
    else
        return "indent: " .. 1 .. "t = " .. vim.bo.tabstop .. "s"
    end
end

return {
    'nvim-lualine/lualine.nvim',
    config = function()
        require("lualine").setup({
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_c = {'get_formatted_cwd()'},
                lualine_x = {'get_formatted_virtual_env()', 'detect_indent_type()', 'filetype'},
                lualine_y = {'progress'},
                lualine_z = {'location'},
              },
        })
    end,
    dependencies = { 'kyazdani42/nvim-web-devicons' }
}
