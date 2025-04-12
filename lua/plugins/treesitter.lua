-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
      "lua",
      "vim",
      "php",
      "vue",
      "javascript",
      "typescript",
      "css",
      "scss",
      "blade",
      "php_only",
      -- add more arguments for adding more treesitter parsers
    })
  end,
  config = function(_, opts)
    vim.filetype.add {
      pattern = {
        [".*%.blade%.php"] = "blade",
      },
    }

    require("nvim-treesitter.configs").setup(opts)
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    parser_config.blade = {
      install_info = {
        url = "https://github.com/EmranMR/tree-sitter-blade",
        files = { "src/parser.c" },
        branch = "main",
      },
      filetype = "blade",
    }
  end,
}
