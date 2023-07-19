-- A slightly faster alternative to Server.lua 
-- Pretty much stores Frame data in a table then plays them back in order for a slightly higher FPS but increases latency
local http = game:GetService("HttpService")

local screen = workspace:WaitForChild("Screen")
local disp = screen:WaitForChild("Display")
local CanvasDraw = require(script:WaitForChild("CanvasDraw")) -- Download this here https://www.roblox.com/library/13252615540/CanvasDraw-Edited 

local PORT = 23935 -- Your port goes here ofc
local finished = false -- Top tier scripting am I right?
local ran = false

local Canvas

local function GetPixelXY(Number,w,h)
	return Vector2.new(Number%w,Number/h/2) -- Not 100% sure if this math is correct lol
end

local FrameTable = {} -- Frame stacking omg

task.desynchronize() -- pls roblox make parrallel lua better pls!!!!!!
task.spawn(function()
	while true do -- while true loop 💀💀💀💀💀💀💀💀💀
		--// Get image data from server
		local s,e = pcall(function()
			task.synchronize()
			local resp = http:GetAsync("http://localhost:" .. PORT)
			table.insert(FrameTable,resp)
			task.desynchronize()

			--// Creates all the necessary "pixels"
			if ran == false then
				local imgd = http:JSONDecode(resp)
				local w,h = unpack(imgd.size)
				ran = true
				task.synchronize()
				Canvas = CanvasDraw.new(
					disp.Frame, -- The frame for the canvas to be parented to
					Vector2.new(w, h/1.1), -- Our resolution omgggg
					Color3.new(0, 0, 0) 
				)
				task.desynchronize()
				finished = true
			end
		end)
		if not s then
			warn("Failed to get image")
			task.wait(0.3)
		end
		task.wait()
	end
end)

task.spawn(function() 
	while true do -- while true loop 💀💀💀💀💀💀💀💀💀
		local s,e = pcall(function()
			task.desynchronize()
			if #FrameTable > 1 then
				for i, resp in ipairs(FrameTable) do
					table.remove(FrameTable,i)
					local imgd = http:JSONDecode(resp)
					local w,h = unpack(imgd.size)
					task.desynchronize()
					for i,rgb in pairs(imgd.data) do
						task.synchronize()
						Canvas:DrawPixel(GetPixelXY(i,w,h), Color3.fromRGB(unpack(rgb)))
						task.desynchronize()
					end
					task.desynchronize()
				end
			end
		end)
		if not s then
			warn("Failed to get image")
			task.wait(0.3)
		end
		task.wait()
	end
end)
