-- Fix render-markdown.nvim treesitter error on non-markdown files

---@type LazySpec
return {
  "MeanderingProgrammer/render-markdown.nvim",
  opts = function(_, opts)
    opts.enabled = function(bufnr)
      local filetype = vim.api.nvim_get_option_value("filetype", { buf = bufnr })
      return filetype == "markdown"
    end
    return opts
  end,
}
