return {
  stylua = {
    filetypes = { "lua" },
    file_extensions = { "lua" },
    root_patterns = { "*stylua.toml" },
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
    filetypes = { "javascript", "typescript", "javascript.jsx", "typescript.tsx", "javascriptreact", "typescriptreact" },
    file_extensions = { "js", "ts", "jsx", "tsx" },
    root_patterns = { ".eslintrc*" },
    healthCheck = "eslint_d --version",
    settings = {
      lintCommand = "eslint_d -f unix --stdin",
      lintStdin = true,
      lintFormats = { "%f:%l:%c: %m" },
      lintIgnoreExitCode = true,
      formatCommand = "eslint_d --fix-to-stdout --stdin",
      formatStdin = true,
      lintSeverity = 3,
    },
  },
  checkstyle = {
    filetypes = { "java" },
    file_extensions = { "java" },
    root_patterns = { "checkstyle.xml" },
    healthCheck = "java -jar"
      .. vim.fn.expand("$CHECKSTYLE_ROOT/checkstyle-*.jar")
      .. " --version",
    settings = {
      lintCommand = "java -jar "
        .. vim.fn.expand("$CHECKSTYLE_ROOT/checkstyle-*.jar")
        .. " -c checkstyle.xml ${INPUT}",
      lintFormats = { "[ERROR] %f:%l:%c: %m" },
      lintIgnoreExitCode = true,
      lintSeverity = 2,
    },
  }
}
