return {
	"stevearc/conform.nvim",
	dependencies = { "mason-org/mason.nvim" },
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	init = function()
		vim.o.formatexpr = [[v:lua.require("conform").formatexpr()]]
	end,
	opts = {
		formatters_by_ft = {
			c = { "clang-format" },
			cpp = { "clang-format" },
			lua = { "stylua" },
			-- Conform will run multiple formatters sequentially
			python = { "black" },
			-- You can customize some of the format options for the filetype (:help conform.format)
			rust = { "rustfmt", lsp_format = "fallback" },
			-- Conform will run the first available formatter
			javascript = { "prettierd", "prettier", stop_after_first = true },
		},
		-- format_on_save = {
		-- 	timeout_ms = 500,
		-- 	lsp_fallback = true,
		-- },
	},
	keys = {
		{
			"<leader>lf",
			function()
				require("conform").format({ "injected", timeout_ms = 3000 })
			end,
		},
	},
}
