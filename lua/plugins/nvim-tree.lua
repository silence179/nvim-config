return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "BufEnter",
	keys = {
		{ "<leader>e", ":NvimTreeToggle<CR>" },
	},
	config = function()
		require("nvim-tree").setup({
			actions = {
				open_file = {
					quit_on_open = true,
				},
			},
		})

		-- VimEnter 自动打开 nvim-tree，如果打开的是目录
		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function(data)
				local is_dir = vim.fn.isdirectory(data.file) == 1
				if is_dir then
					-- 切换到目录
					vim.cmd.cd(data.file)
					-- 打开 nvim-tree
					require("nvim-tree.api").tree.open()
				end
			end,
		})
	end,
}
