return {
    "laytan/cloak.nvim",
    config = function()
        require("cloak").setup({
            enabled = true,
            cloak_character = "*",
            -- The applied highlight group (colors) on the cloaking, see `:h highlight`.
            highlight_group = "Comment",
            -- Applies the length of the replacement characters for all matched
            -- patterns, defaults to the length of the matched pattern.
            cloak_length = nil, -- Provide a number if you want to hide the true length of the value.
            -- Whether it should try every pattern to find the best fit or stop after the first.
            try_all_patterns = true,
            -- Set to true to cloak Telescope preview buffers. (Required feature not in 0.1.x)
            cloak_telescope = true,
            -- Re-enable cloak when a matched buffer leaves the window.
            cloak_on_leave = false,
            patterns = {
                -- KEY=value / key = value style: dotenv, wrangler, tfvars,
                -- AWS credentials ini. Terraform .tfvars uses HCL assignments
                -- like `db_password = "secret"` — the `=.+` pattern masks it.
                {
                    file_pattern = {
                        ".env*",
                        "wrangler.toml",
                        ".dev.vars",
                        "*.tfvars",
                        "*.auto.tfvars",
                        "*/.aws/credentials",
                        "credentials",
                    },
                    cloak_pattern = "=.+",
                    replace = nil,
                },
                -- key: value / key = value style: secrets manifests
                {
                    file_pattern = {
                        "secrets.yaml",
                        "secrets.yml",
                        "*.secrets.yaml",
                        "*.secrets.yml",
                        "secrets.json",
                    },
                    cloak_pattern = { ":%s*.+", "=%s*.+" },
                    replace = nil,
                },
                -- Full-file cover for private key material. `.+` matches any
                -- non-empty line, so the whole file is masked. Public keys
                -- (*.pub) are intentionally excluded.
                {
                    file_pattern = {
                        "*.pem",
                        "*.key",
                        "id_rsa",
                        "id_ed25519",
                        "id_ecdsa",
                    },
                    cloak_pattern = ".+",
                    replace = nil,
                },
            },
        })
    end,
}
