local lint = require("lint")

lint.linters_by_ft = {
  ansible    = { "ansible_lint", },
  markdown   = { "markdownlint", },
  python     = { "flake8", },
  typescript = { "eslint", },
  javascript = { "eslint", },
  fish       = { "fish", },
  lua        = { "luacheck", },
  env        = { "dotenv_linter", },
};

lint.try_lint();
