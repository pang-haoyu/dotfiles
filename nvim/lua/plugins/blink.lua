return {
  {
    "saghen/blink.cmp",
    opts = {
      cmdline = {
        enabled = false,
      },
      completion = {
        ghost_text = {
          enabled = false,
        },
      },
      sources = {
        default = { "lsp", "path", "buffer" },
        providers = {
          snippets = {
            enabled = false,
          },
        },
      },
    },
  },
}
