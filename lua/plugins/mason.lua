-- Customize Mason

---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- install language servers
        "lua-language-server",
        "vue-language-server",
        "css-lsp",
        "tailwindcss-language-server",
        "intelephense",
        "eslint-lsp",

        -- install formatters
        "stylua",
        "eslint_d",
        "blade-formatter",
        "pint",

        -- install debuggers
        -- "debugpy",
        "js-debug-adapter",

        -- install any other package
        "tree-sitter-cli",
      },
    },
  },
}
