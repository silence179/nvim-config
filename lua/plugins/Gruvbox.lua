return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	opts = {},
	config = function()
		require("gruvbox").setup({
			contrast = "hard",
			transparnet_mode = true,
		})
		vim.cmd.colorscheme("gruvbox")
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
		vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
	end,
}
