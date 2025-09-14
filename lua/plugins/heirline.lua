return {
	"rebelot/heirline.nvim",
	config = function()
		local Align = { provider = "%=" }

		-- 顶部 winbar：CMake 按钮
		local Build = {
			provider = "Build 󱌣 ",
			hl = { fg = "#98be65", bold = true },
			on_click = {
				name = "cmake_build",
				callback = function()
					vim.cmd("CMakeBuild")
				end,
			},
		}

		local Run = {
			provider = " Run  ",
			hl = { fg = "#51afef", bold = true },
			on_click = {
				name = "cmake_run",
				callback = function()
					vim.cmd("CMakeRun")
				end,
			},
		}

		local Debug = {
			provider = "Debug ",
			hl = { fg = "#ec5f67", bold = true },
			on_click = {
				name = "cmake_debug",
				callback = function()
					vim.cmd("CMakeDebug")
				end,
			},
		}

		local Winbar = {
			Build,
			Run,
			Debug,
			Align,
			{ provider = "%t" }, -- 文件名
		}

		require("heirline").setup({
			winbar = Winbar,
		})

		-- 启用 winbar
		vim.o.winbar = "%!v:lua.require'heirline'.eval_winbar()"

		-- 确保鼠标可用（点击按钮）
		vim.o.mouse = "a"
	end,
	enabled = false,
}
