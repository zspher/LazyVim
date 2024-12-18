return {
  recommended = {
    ft = { "gitcommit", "gitconfig", "gitrebase", "gitignore", "gitattributes" },
  },
  -- Treesitter git support
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "git_config", "gitcommit", "git_rebase", "gitignore", "gitattributes" } },
  },

  {
    "hrsh7th/nvim-cmp",
    optional = true,
    dependencies = {
      { "petertriho/cmp-git", opts = {} },
    },
    ---@module 'cmp'
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      table.insert(opts.sources, { name = "git" })
    end,
  },

  {
    "saghen/blink.cmp",
    optional = true,
    dependencies = { "petertriho/cmp-git", "saghen/blink.compat" },
    opts = {
      sources = {
        compat = { "git" },
        providers = {
          git = {
            score_offset = -1,
            async = true,
          },
        },
      },
    },
  },
}
