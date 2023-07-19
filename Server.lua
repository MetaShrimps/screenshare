local http = game:GetService("HttpService")

local screen = workspace:WaitForChild("Screen")
local disp = screen:WaitForChild("Display")
local CanvasDraw = require(script:WaitForChild("CanvasDraw")) -- Download this here https://www.roblox.com/library/13252615540/CanvasDraw-Edited 
-- Canvas draw is edited to up the max res size due to CanvasDraw limiting it (for good reason too as there are some visual artifacts if the resolution is set too high, I've already found the best numbers so you do not have to worry)

local PORT = 23935 -- Your port goes here ofc

local finished = false -- Top tier scripting am I right?
local ran = false

local Canvas

local function GetPixelXY(Number,w,h)
	return Vector2.new(Number%w,Number/h/2) -- Not 100% sure if this math is correct lol
end

task.desynchronize() -- pls roblox make parallel lua better pls!!!!!!
while true do -- while true loop 💀💀💀💀💀💀💀💀💀
	--// Get image data from server
	local s,e = pcall(function()
		task.synchronize()
		local resp = http:GetAsync("http://localhost:" .. PORT)
		task.desynchronize()
		local imgd = http:JSONDecode(resp)
		local w,h = unpack(imgd.size)
		--// Creates all the necessary "pixels"
		if ran == false then
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
		if finished == true then
			--// Draws image to screen
			task.desynchronize()
			for i,rgb in pairs(imgd.data) do
				task.synchronize()
				Canvas:DrawPixel(GetPixelXY(i,w,h), Color3.fromRGB(unpack(rgb)))
			end
			task.desynchronize()
		end
	end)
	if not s then
		warn("Failed to get image")
		task.wait(0.3)
	end
	task.wait(0.5)
end
