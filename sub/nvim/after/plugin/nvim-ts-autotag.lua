
local status, nvim_ts_autotag = pcall(require, "nvim_ts_autotag")
if (not status) then return end


nvim_ts_autotag.setup()
