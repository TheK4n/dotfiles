
return {
    "mhartington/formatter.nvim",
    config = function()
        local util = require "formatter.util"
        require("formatter").setup({
            filetype = {
                python = {
                    function()
                        return {
                          exe = "autopep8",
                          args = {
                            util.escape_path(util.get_current_buffer_file_path()),
                          },
                          stdin = true,
                        }
                      end
                }
            }
        })
    end
}
