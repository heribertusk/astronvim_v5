-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@module "lazy"
---@type LazySpec
return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    version = "1.*",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      completion = {
        list = { selection = { preselect = false, auto_insert = true } },
        keyword = { range = "full" },
      },
      appearance = {
        nerd_font_variant = "mono",
      },
      sources = {
        providers = {
          lsp = { score_offset = 3 },
          snippets = { score_offset = 2 },
          path = { score_offset = 1 },
          buffer = { score_offset = 0 },
        },
      },
    },
  },
}
