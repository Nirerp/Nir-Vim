local Terminal = require("toggleterm.terminal").Terminal


-- Function to run the current Python file in a floating terminal
function _G.run_python_file()
	local file = vim.fn.expand("%:p") -- Get the absolute path of the current file
	if vim.fn.filereadable(file) == 1 then
		local python_terminal = Terminal:new({
			cmd = "python3 " .. file,
			direction = "float",
			close_on_exit = false, -- Keep the terminal open after the command finishes
		})
		python_terminal:toggle()
	else
		print("File does not exist or is not readable: " .. file)
	end
end

-- Function to run the current C file in a floating terminal
function _G.run_c_file()
	local file = vim.fn.expand("%:p") -- Get the absolute path of the current file
	if vim.fn.filereadable(file) == 1 then
		local c_terminal = Terminal:new({
			cmd = "gcc -ansi -pedantic-errors -Wall -Wextra -g " .. file .. " && ./a.out",
			direction = "float",
			close_on_exit = false, -- Keep the terminal open after the command finishes
		})
		c_terminal:toggle()
	else
		print("File does not exist or is not readable: " .. file)
	end
end

-- Function to run current Cpp file in floating window


-- Function to run the current html file in a live-server
function _G.run_html_file()
	local file = vim.fn.expand("%:p") -- Get the absolute path of the current file
	if vim.fn.filereadable(file) == 1 then
		local c_terminal = Terminal:new({
			cmd = "live-server " .. file,
			direction = "float",
			close_on_exit = true, -- Keep the terminal open after the command finishes
		})
		c_terminal:toggle()
	else
		print("File does not exist or is not readable: " .. file)
	end
end

----------
function _G.run_file()
	local file = vim.fn.expand("%:p") -- Get the absolute path of the current file
	if vim.fn.filereadable(file) == 1 then
		local ext = vim.fn.expand("%:e") -- Get the file extension
		if ext == "py" then
			run_python_file(file)
		elseif ext == "c" then
			run_c_file(file)
		elseif ext == "html" then
			run_html_file(file)
		else
			print("Unsupported file type: " .. ext)
		end
	else
		print("File does not exist or is not readable: " .. file)
	end
end
