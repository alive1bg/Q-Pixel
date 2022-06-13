function TextUI(text, color)
	if text ~= nil then
		SendNUIMessage({
			action = "showtext",
			text = text,
			color = color,
		})
	else
		SendNUIMessage({
			action = 'hidetext'
		})
	end
end


-- local value = false
-- CreateThread(function()
-- 	while true do
-- 		Wait(0)
-- 		if value then
-- 			exports["cn-ui"]:TextUI("[E] Enter House")
-- 		else
-- 			exports["cn-ui"]:TextUI()
-- 		end
-- 	end
-- end)

-- RegisterCommand("showtext", function()
-- 	value = not value
-- end)