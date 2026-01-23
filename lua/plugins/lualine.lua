local found_cmake, cmake = pcall(require, "cmake-tools")
if not found_cmake then
	cmake = {
		is_cmake_project = function()
			return false
		end,
	}
end
local icons = require("config/icons")
local cmake_component = {
	{
		function()
			if cmake.has_cmake_preset() then
				local b_preset = cmake.get_build_preset()
				if not b_preset then
					return icons.cmake.CMake
				end
				return icons.cmake.CMake .. string.format(" [%s]", b_preset)
			else
				local b_type = cmake.get_build_type()
				if not b_type then
					return icons.cmake.CMake
				end
				return icons.cmake.CMake .. string.format(" [%s]", b_type)
			end
		end,
		cond = function()
			return cmake.is_cmake_project() and (vim.bo.buftype == "" or vim.bo.buftype == "quickfix")
		end,
		on_click = function(n, mouse)
			if n == 1 then
				if mouse == "l" then
					cmake.generate({})
				elseif mouse == "r" then
					if cmake.has_cmake_preset() then
						cmake.select_build_preset()
					else
						cmake.select_build_type()
					end
				end
			end
		end,
	},
	{
		function()
			local b_target = cmake.get_build_target()
			if not b_target or b_target == "all" then
				return icons.cmake.Build
			end
			return icons.cmake.Build
		end,
		cond = function()
			return cmake.is_cmake_project() and vim.bo.buftype == ""
		end,
		on_click = function(n, mouse)
			if n == 1 then
				if mouse == "l" then
					local b_target = cmake.get_build_target()
					if not b_target then
						local l_target = cmake.get_launch_target()
						if l_target then
							cmake.build({
								target = l_target,
							})
							return
						end
						cmake.build({
							target = "all",
						})
					else
						cmake.build({})
					end
				elseif mouse == "r" then
					cmake.select_build_target()
				end
			end
		end,
	},

	{
		function()
			return icons.cmake.Debug
		end,
		cond = function()
			return cmake.is_cmake_project() and vim.bo.buftype == ""
		end,
		on_click = function(n, mouse)
			if n == 1 then
				if mouse == "l" then
					local l_target = cmake.get_launch_target()
					if not l_target then
						local b_target = cmake.get_build_target()
						if b_target then
							cmake.debug({
								target = b_target,
							})
							return
						end
					end
					cmake.debug({})
				elseif mouse == "r" then
					cmake.select_launch_target()
				end
			end
		end,
	},
	{
		function()
			local l_target = cmake.get_launch_target()
			if not l_target then
				return icons.cmake.Run
			end
			return icons.cmake.Run .. string.format(" [%s]", l_target)
		end,
		cond = function()
			return cmake.is_cmake_project() and vim.bo.buftype == ""
		end,
		on_click = function(n, mouse)
			if n == 1 then
				if mouse == "l" then
					local l_target = cmake.get_launch_target()
					if not l_target then
						local b_target = cmake.get_build_target()
						if b_target then
							cmake.run({
								target = b_target,
							})
							return
						end
					end
					cmake.run({})
				elseif mouse == "r" then
					cmake.select_launch_target()
				end
			end
		end,
	},
}

return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	event = "VeryLazy",
	opts = {
		options = {
			theme = "auto",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
		},
		extensions = { "nvim-tree" },
		sections = {
			lualine_b = { "branch", "diff" },
			lualine_x = {
				"filesize",
				"encoding",
				"filetype",
			},
		},
		winbar = {
			lualine_a = {},
			lualine_b = {
				cmake_component[1],
				cmake_component[2],
			},
			lualine_c = {
				cmake_component[3],
				cmake_component[4],
			},
		},
		interactive_winbar = {},
	},
	enabled = false,
}
