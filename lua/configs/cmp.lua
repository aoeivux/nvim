local cmp = require "cmp"

return {
    mapping = {
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        }),

        ["<TAB>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true
        }),

        -- ["<Tab>"] = cmp.mapping(function(fallback)
        --     if cmp.visible() then
        --         cmp.select_next_item()
        --     elseif require("luasnip").expand_or_jumpable() then
        --         require("luasnip").expand_or_jump()
        --     else
        --         fallback()
        --     end
        -- end, {"i", "s"}),

        -- ["<S-Tab>"] = cmp.mapping(function(fallback)
        --     if cmp.visible() then
        --         cmp.select_prev_item()
        --     elseif require("luasnip").jumpable(-1) then
        --         require("luasnip").jump(-1)
        --     else
        --         fallback()
        --     end
        -- end, {"i", "s"})
    },
    sources = {{
        name = "nvim_lsp"
    }, {
        name = "luasnip"
    }, {
        name = "buffer"
    }, {
        name = "nvim_lua"
    }, {
        name = "path"
    }}
}
