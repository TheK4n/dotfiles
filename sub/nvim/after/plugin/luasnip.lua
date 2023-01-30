
local status, luasnip = pcall(require, "luasnip")
if (not status) then return end

luasnip.add_snippets(nil, {
    all = {
        luasnip.snippet({
            trig = "ifmain",
            namr = "ifmain",
            dscr = "If python file run as main (not import)",
        }, {
            luasnip.text_node({
                "if __name__ == '__main__':",
                "\t"
            })
        })
    }
})

