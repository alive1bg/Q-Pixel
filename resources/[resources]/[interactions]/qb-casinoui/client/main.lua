RegisterNetEvent('qb-casinouiShowUI')
AddEventHandler('qb-casinouiShowUI', function(action, text)
	SendNUIMessage({
		action = action,
		text = text,
	})
end)

RegisterNetEvent('qb-casinouiHideUI')
AddEventHandler('qb-casinouiHideUI', function()
	SendNUIMessage({
		action = 'hide'
	})
end)

function DrawCasinoUi(action, text)
	SendNUIMessage({
		action = action,
		text = text,
	})
end

function HideCasinoUi()
	SendNUIMessage({
		action = 'hide'
	})
end

-- RegisterCommand('test', function()
-- 	exports['qb-casinoui']:DrawCasinoUi('show', "Diamond Casino Blackjack</p>Balance: $5000Test</br>Bet: 10000Test") 
--     Wait(3700)
-- 	exports['qb-casinoui']:HideCasinoUi('hide') 
-- end, false)


