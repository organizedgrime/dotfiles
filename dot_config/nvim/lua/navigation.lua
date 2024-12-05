-- # Go to definition (in a split)
function definition_split()
	vim.lsp.buf.definition({
		on_list = function(options)
			-- If there are multiple items, warn the user
			if #options.items > 1 then
				vim.notify("Multiple items found, opening first one", vim.log.levels.WARN)
			end

			-- Open the first item in a vertical split
			local item = options.items[1]
			local cmd = "vsplit +" .. item.lnum .. " " .. item.filename .. "|" .. "normal " .. item.col .. "|"

			vim.cmd(cmd)
		end,
	})
end

function format()
	vim.lsp.buf.format({ async = true })
end
