return {
  stylua = {
    filetypes = { "lua" },
    root_patterns = { "stylua.toml", ".stylua.toml" },
    settings = {
      healthCheck = "stylua --version",
      lintCommand = "stylua --check --color never -",
      lintFormats = {
        "    %l |+%m",
        "    %l  |+%m",
        "    %l   |+%m",
        "    %l    |+%m",
      },
      lintStdin = true,
      formatCommand = "stylua -",
      formatStdin = true,
      lintIgnoreExitCode = true,
      lintSeverity = 3,
    },
  },
}
