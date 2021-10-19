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
  eslint_d = {
    filetypes = { "js", "ts", "jsx", "tsx" },
    root_patterns = { ".eslintrc" },
    healthCheck = "eslint_d --version",
    settings = {
      lintCommand = "eslint_d -f unix --stdin",
      lintStdin = true,
      lintFormats = { "%f:%l:%c: %m" },
      lintIgnoreExitCode = true,
      formatCommand = "eslint_d --fix-to-stdout --stdin",
      formatStdin = true,
    },
  },
}
