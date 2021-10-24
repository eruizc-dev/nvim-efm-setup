return {
  stylua = {
    filetypes = { "lua" },
    file_extensions = { "lua" },
    root_patterns = { "*stylua.toml" },
    healthCheck = { "which", "stylua" },
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
    healthCheck = { "which", "eslint_d" },
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
    healthCheck = { "test", vim.fn.expand("$CHECKSTYLE_ROOT/checkstyle-*.jar") },
    settings = {
      lintCommand = "java -jar "
        .. vim.fn.expand("$CHECKSTYLE_ROOT/checkstyle-*.jar")
        .. " -c checkstyle.xml ${INPUT}",
      lintFormats = { "[ERROR] %f:%l:%c: %m" },
      lintIgnoreExitCode = true,
      lintSeverity = 2,
    },
  },
  prettier_babel = {
    filetypes = { "javascript", "typescript", "javascript.jsx", "typescript.tsx", "javascriptreact", "typescriptreact" },
    file_extensions = { "js", "ts", "jsx", "tsx" },
    root_patterns = { ".prettierrc*" },
    healthCheck = { "which", "prettier" },
    settings = {
      formatCommand = "prettier --parser babel",
      formatStdin = true,
    },
  },
  prettier_json = {
    filetypes = { "json", "jsonc" },
    file_extensions = { "json" },
    root_patterns = { ".prettierrc*" },
    healthCheck = { "which", "prettier" },
    settings = {
      formatCommand = "prettier --parser json",
      formatStdin = true,
    },
  },
  prettier_html = {
    filetypes = { "html" },
    file_extensions = { "html" },
    root_patterns = { ".prettierrc*" },
    healthCheck = { "which", "prettier" },
    settings = {
      formatCommand = "prettier --parser html",
      formatStdin = true,
    },
  },
  prettier_css = {
    filetypes = { "css" },
    file_extensions = { "css" },
    root_patterns = { ".prettierrc*" },
    healthCheck = { "which", "prettier" },
    settings = {
      formatCommand = "prettier --parser css",
      formatStdin = true,
    },
  },
  lua_format = {
    filetypes = { "lua" },
    file_extensions = { "lua" },
    root_patterns = { ".lua-format" },
    healthCheck = { "which", "prettier" },
    settings = {
      formatCommand = "lua-format -i ${INPUT}",
      formatStdin = false,
    },
  }
}
