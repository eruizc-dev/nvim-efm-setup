return {
  stylua = {
    filetypes = { "lua" },
    root_patterns = { "stylua.toml", ".stylua.toml" },
    healthCheck = "stylua --version",
    settings = {
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
