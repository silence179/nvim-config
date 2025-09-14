return {
	"nvim-treesitter/nvim-treesitter",
	event = "VeryLazy",
	main = "nvim-treesitter.configs",
	opts = {
		ensure_installed = { "lua", "c", "cpp", "python", "cmake" },
		auto_install = true,
		highlight = { enable = true },
	},
}
