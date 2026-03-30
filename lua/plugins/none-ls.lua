-- Customize None-ls sources

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvimtools/none-ls-extras.nvim" },
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- ESLint configuration with priority for local project eslint
      -- This ensures each project uses its own ESLint version via node_modules
      require("none-ls.diagnostics.eslint").with {
        condition = function(utils)
          return utils.root_has_file { ".eslintrc", ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.yaml", ".eslintrc.yml", ".eslintrc.json", "eslint.config.js" }
        end,
      },
      require("none-ls.formatting.eslint").with {
        condition = function(utils)
          return utils.root_has_file { ".eslintrc", ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.yaml", ".eslintrc.yml", ".eslintrc.json", "eslint.config.js" }
        end,
      },
      require("none-ls.code_actions.eslint").with {
        condition = function(utils)
          return utils.root_has_file { ".eslintrc", ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.yaml", ".eslintrc.yml", ".eslintrc.json", "eslint.config.js" }
        end,
      },
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.blade_formatter,
      null_ls.builtins.formatting.pint,
      -- null_ls.builtins.formatting.prettierd,
      -- null_ls.builtins.formatting.prettier,
    }
    return config -- return final config table
  end,
}
