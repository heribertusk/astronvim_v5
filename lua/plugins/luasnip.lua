return {
  "L3MON4D3/LuaSnip",
  dependencies = { "rafamadriz/friendly-snippets" },
  config = function(plugin, opts)
    -- include the default astronvim config that calls the setup call
    require "astronvim.plugins.configs.luasnip"(plugin, opts)

    local luasnip = require "luasnip"
    luasnip.filetype_extend("javascript", { "vue" })
    luasnip.filetype_extend("php", { "blade" })

    -- load snippets paths
    require("luasnip.loaders.from_vscode").lazy_load {
      paths = { vim.fn.stdpath "config" .. "/snippets" },
    }
  end,
}
