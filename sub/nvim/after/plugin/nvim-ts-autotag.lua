
local status, nvim_ts_autotag = pcall(require, "nvim-ts-autotag")
if (not status) then return end


nvim_ts_autotag.setup()
