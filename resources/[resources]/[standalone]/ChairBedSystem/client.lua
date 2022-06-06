local using = false
local lastPos = nil
local anim = "back"
local animscroll = 0
local oPlayer = false

--[[ CreateThread(function()
	while true do
		Wait(1000)
		oPlayer = PlayerPedId()
		local pedPos = GetEntityCoords(oPlayer)
		for k,v in pairs(Config.objects.locations) do
			local oSelectedObject = GetClosestObjectOfType(pedPos.x, pedPos.y, pedPos.z, 0.8, GetHashKey(v.object), 0, 0, 0)
			local oEntityCoords = GetEntityCoords(oSelectedObject)
			local objectexits = DoesEntityExist(oSelectedObject)
			if objectexits then
				if GetDistanceBetweenCoords(oEntityCoords.x, oEntityCoords.y, oEntityCoords.z,pedPos) < 15.0 then
					if oSelectedObject ~= 0 then
						local objects = Config.objects
						if oSelectedObject ~= objects.object then
							objects.object = oSelectedObject
							objects.ObjectVertX = v.verticalOffsetX
							objects.ObjectVertY = v.verticalOffsetY
							objects.ObjectVertZ = v.verticalOffsetZ
							objects.OjbectDir = v.direction
							objects.isBed = v.bed
						end
					end
				end
			end
		end
		
	end
end) ]]

--- BEDS
local beds = { 
	`v_med_bed1`,
	`v_med_bed2`,
	`v_med_emptybed`,
	`v_med_bed2`,
	`gabz_pillbox_diagnostics_bed_03`,
	`gabz_pillbox_diagnostics_bed_02`,

}
exports['qb-target']:AddTargetModel(beds, {
	options = {
		{
			event = "bed:sit",
			icon = "fas fa-bed",
			label = "Sit on bed",
		},
		{
			event = "bed:layBack",
			icon = "fas fa-bed",
			label = "Lying on back",
		},
		{
			event = "bed:layStomach",
			icon = "fas fa-bed",
			label = "Lying on stomach",
		},
	},
	distance = 2.5
})

-- CHAIRS
local chairs = { 
	`v_serv_ct_chair02`,
	`prop_off_chair_03`,
	`prop_off_chair_04`,
	`prop_off_chair_05`,
	`v_club_officechair`,
	`v_ilev_leath_chr`,
	`v_corp_offchair`,
	`Prop_Off_Chair_01`,
	`prop_bench_01a`,
	`prop_bench_01b`,
	`prop_bench_01c`,
	`prop_bench_02`,
	`prop_bench_03`,
	`prop_bench_04`,
	`prop_bench_05`,
	`prop_bench_06`,
	`prop_bench_08`,
	`prop_bench_09`,
	`prop_bench_10`,
	`prop_bench_11`,
	`prop_fib_3b_bench`,
	`prop_ld_bench01`,
	`prop_wait_bench_01`,
	`hei_prop_heist_off_chair`,
	`hei_prop_hei_skid_chair`,
	`prop_chair_01a`,
	`prop_chair_01b`,
	`prop_chair_02`,
	`prop_chair_03`,
	`prop_chair_04a`,
	`prop_chair_04b`,
	`prop_chair_05`,
	`prop_chair_06`,
	`prop_chair_08`,
	`prop_chair_09`,
	`prop_chair_10`,
	`prop_chateau_chair_01`,
	`prop_clown_chair`,
	`prop_cs_office_chair`,
	`prop_direct_chair_01`,
	`prop_direct_chair_02`,
	`prop_gc_chair02`,
	`prop_off_chair_01`,
	`prop_off_chair_03`,
	`prop_off_chair_04`,
	`prop_off_chair_04b`,
	`prop_off_chair_04_s`,
	`prop_off_chair_05`,
	`prop_old_deck_chair`,
	`prop_old_wood_chair`,
	`prop_rock_chair_01`,
	`prop_skid_chair_01`,
	`prop_skid_chair_02`,
	`prop_skid_chair_03`,
	`prop_sol_chair`,
	`p_armchair_01_s`,
	`p_clb_officechair_s`,
	`p_dinechair_01_s`,
	`p_ilev_p_easychair_s`,
	`p_soloffchair_s`,
	`p_yacht_chair_01_s`,
	`v_club_officechair`,
	`v_corp_bk_chair3`,
	`v_corp_cd_chair`,
	`v_corp_offchair`,
	`v_ilev_chair02_ped`,
	`v_ilev_p_easychair`,
	`v_ret_gc_chair03`,
	`prop_ld_farm_chair01`,
	`prop_table_04_chr`,
	`prop_table_05_chr`,
	`hei_prop_hei_skid_chair`,
	`prop_table_06_chr`,
	`v_ilev_leath_chr`,
	`prop_table_01_chr_a`,
	`prop_table_01_chr_b`,
	`prop_table_02_chr`,
	`prop_table_03b_chr`,
	`prop_table_03_chr`,
	`prop_torture_ch_01`,
	`v_ilev_fh_dineeamesa`,
	`v_ilev_fh_kitchenstool`,
	`v_ilev_tort_stool`,
	`hei_prop_yah_seat_01`,
	`hei_prop_yah_seat_02`,
	`hei_prop_yah_seat_03`,
	`prop_waiting_seat_01`,
	`prop_yacht_seat_01`,
	`prop_yacht_seat_02`,
	`prop_yacht_seat_03`,
	`prop_hobo_seat_01`,
	`prop_rub_couch01`,
	`miss_rub_couch_01`,
	`prop_ld_farm_couch01`,
	`prop_ld_farm_couch02`,
	`prop_rub_couch03`,
	`prop_rub_couch04`,
	`p_lev_sofa_s`,
	`p_res_sofa_l_s`,
	`p_v_med_p_sofa_s`,
	`p_yacht_sofa_01_s`,
	`v_ilev_m_sofa`,
	`v_res_tre_sofa_s`,
	`v_tre_sofa_mess_a_s`,
	`v_tre_sofa_mess_b_s`,
	`v_tre_sofa_mess_c_s`,
	`prop_roller_car_01`,
	`prop_roller_car_02`,
	`v_ilev_ph_bench`,
	`ex_prop_offchair_exec_01`,
	`ex_prop_offchair_exec_04`,
	`vw_prop_vw_offchair_02`,
	`vw_prop_casino_chair_01a`,
	`v_serv_ct_chair02`,
	`prop_cs_office_chair`,
	`prop_bench_01a`,
	`prop_off_chair_04`,
	`prop_off_chair_03`,
	`prop_off_chair_05`,
	`v_club_officechair`,
	`v_ilev_leath_chr`,
	`v_corp_offchair`,
	`Prop_Off_Chair_01`,
	`ba_prop_battle_club_chair_01`,
	`v_res_m_dinechair`,
	`imp_prop_impexp_offchair_01a`,
	`np_town_hall_judge_chair`,
	`v_ilev_m_dinechair`,
}
exports['qb-target']:AddTargetModel(chairs, {
	options = {
		{
			event = "chair:sit",
			icon = "fas fa-chair",
			label = "Sit",
		},
	},
	distance = 2.5
})

RegisterNetEvent("chair:sit")
AddEventHandler("chair:sit", function()
	oPlayer = PlayerPedId()
		local pedPos = GetEntityCoords(oPlayer)
		for k,v in pairs(Config.objects.locations) do
			local oSelectedObject = GetClosestObjectOfType(pedPos.x, pedPos.y, pedPos.z, 0.8, GetHashKey(v.object), 0, 0, 0)
			local oEntityCoords = GetEntityCoords(oSelectedObject)
			local objectexits = DoesEntityExist(oSelectedObject)
			if objectexits then
				if GetDistanceBetweenCoords(oEntityCoords.x, oEntityCoords.y, oEntityCoords.z,pedPos) < 15.0 then
					if oSelectedObject ~= 0 then
						local objects = Config.objects
						if oSelectedObject ~= objects.object then
							objects.object = oSelectedObject
							objects.ObjectVertX = v.verticalOffsetX
							objects.ObjectVertY = v.verticalOffsetY
							objects.ObjectVertZ = v.verticalOffsetZ
							objects.OjbectDir = v.direction
							objects.isBed = v.bed
						end
					end
				end
			end
		local objects = Config.objects
		if objects.object ~= nil and objects.ObjectVertX ~= nil and objects.ObjectVertY ~= nil and objects.ObjectVertZ ~= nil and objects.OjbectDir ~= nil and objects.isBed ~= nil then
			local player = oPlayer
			local getPlayerCoords = GetEntityCoords(player)
			local objectcoords = GetEntityCoords(objects.object)
			if GetDistanceBetweenCoords(objectcoords.x, objectcoords.y, objectcoords.z,getPlayerCoords) < 1.8 and not using then
						PlayAnimOnPlayer(objects.object,objects.ObjectVertX,objects.ObjectVertY,objects.ObjectVertZ,objects.OjbectDir, objects.isBed, player, objectcoords)
						FreezeEntityPosition(player, false)
				end
			end
			if using == true then
					ClearPedTasks(player)
					using = false
					local x,y,z = table.unpack(lastPos)
					if GetDistanceBetweenCoords(x, y, z,getPlayerCoords) < 10 then
						SetEntityCoords(player, lastPos)
					end
					FreezeEntityPosition(player, false)
				end
			end
		end)

RegisterNetEvent("bed:up")
AddEventHandler("bed:up", function()
	local player = oPlayer
	ClearPedTasks(player)
	using = false
	local x,y,z = table.unpack(lastPos)
	if GetDistanceBetweenCoords(x, y, z,getPlayerCoords) < 10 then
		SetEntityCoords(player, lastPos)
	end
	FreezeEntityPosition(player, false)
end)

RegisterNetEvent("bed:sit")
AddEventHandler("bed:sit", function()
	oPlayer = PlayerPedId()
		local pedPos = GetEntityCoords(oPlayer)
		for k,v in pairs(Config.objects.locations) do
			local oSelectedObject = GetClosestObjectOfType(pedPos.x, pedPos.y, pedPos.z, 0.8, GetHashKey(v.object), 0, 0, 0)
			local oEntityCoords = GetEntityCoords(oSelectedObject)
			local objectexits = DoesEntityExist(oSelectedObject)
			if objectexits then
				if GetDistanceBetweenCoords(oEntityCoords.x, oEntityCoords.y, oEntityCoords.z,pedPos) < 15.0 then
					if oSelectedObject ~= 0 then
						local objects = Config.objects
						if oSelectedObject ~= objects.object then
							objects.object = oSelectedObject
							objects.ObjectVertX = v.verticalOffsetX
							objects.ObjectVertY = v.verticalOffsetY
							objects.ObjectVertZ = v.verticalOffsetZ
							objects.OjbectDir = v.direction
							objects.isBed = v.bed
						end
					end
				end
			end
		local objects = Config.objects
		if objects.object ~= nil and objects.ObjectVertX ~= nil and objects.ObjectVertY ~= nil and objects.ObjectVertZ ~= nil and objects.OjbectDir ~= nil and objects.isBed ~= nil then
			local player = oPlayer
			local getPlayerCoords = GetEntityCoords(player)
			local objectcoords = GetEntityCoords(objects.object)
			if GetDistanceBetweenCoords(objectcoords.x, objectcoords.y, objectcoords.z,getPlayerCoords) < 1.8 and not using then
				if objects.isBed == true then
						anim = "sit"
						PlayAnimOnPlayer(objects.object,objects.ObjectVertX,objects.ObjectVertY,objects.ObjectVertZ,objects.OjbectDir, objects.isBed, player, objectcoords)
					end
				end
			end
		end
end)

RegisterNetEvent("bed:layBack")
AddEventHandler("bed:layBack", function()
	oPlayer = PlayerPedId()
		local pedPos = GetEntityCoords(oPlayer)
		for k,v in pairs(Config.objects.locations) do
			local oSelectedObject = GetClosestObjectOfType(pedPos.x, pedPos.y, pedPos.z, 0.8, GetHashKey(v.object), 0, 0, 0)
			local oEntityCoords = GetEntityCoords(oSelectedObject)
			local objectexits = DoesEntityExist(oSelectedObject)
			if objectexits then
				if GetDistanceBetweenCoords(oEntityCoords.x, oEntityCoords.y, oEntityCoords.z,pedPos) < 15.0 then
					if oSelectedObject ~= 0 then
						local objects = Config.objects
						if oSelectedObject ~= objects.object then
							objects.object = oSelectedObject
							objects.ObjectVertX = v.verticalOffsetX
							objects.ObjectVertY = v.verticalOffsetY
							objects.ObjectVertZ = v.verticalOffsetZ
							objects.OjbectDir = v.direction
							objects.isBed = v.bed
						end
					end
				end
			end
	local objects = Config.objects
	if objects.object ~= nil and objects.ObjectVertX ~= nil and objects.ObjectVertY ~= nil and objects.ObjectVertZ ~= nil and objects.OjbectDir ~= nil and objects.isBed ~= nil then
		local player = oPlayer
		local getPlayerCoords = GetEntityCoords(player)
		local objectcoords = GetEntityCoords(objects.object)
		if GetDistanceBetweenCoords(objectcoords.x, objectcoords.y, objectcoords.z,getPlayerCoords) < 1.8 and not using then
			if objects.isBed == true then
						anim = "back"
					PlayAnimOnPlayer(objects.object,objects.ObjectVertX,objects.ObjectVertY,objects.ObjectVertZ,objects.OjbectDir, objects.isBed, player, objectcoords)
				end
			end
		end
	end
end)

	RegisterNetEvent("bed:layStomach")
	AddEventHandler("bed:layStomach", function()
		oPlayer = PlayerPedId()
		local pedPos = GetEntityCoords(oPlayer)
		for k,v in pairs(Config.objects.locations) do
			local oSelectedObject = GetClosestObjectOfType(pedPos.x, pedPos.y, pedPos.z, 0.8, GetHashKey(v.object), 0, 0, 0)
			local oEntityCoords = GetEntityCoords(oSelectedObject)
			local objectexits = DoesEntityExist(oSelectedObject)
			if objectexits then
				if GetDistanceBetweenCoords(oEntityCoords.x, oEntityCoords.y, oEntityCoords.z,pedPos) < 15.0 then
					if oSelectedObject ~= 0 then
						local objects = Config.objects
						if oSelectedObject ~= objects.object then
							objects.object = oSelectedObject
							objects.ObjectVertX = v.verticalOffsetX
							objects.ObjectVertY = v.verticalOffsetY
							objects.ObjectVertZ = v.verticalOffsetZ
							objects.OjbectDir = v.direction
							objects.isBed = v.bed
						end
					end
				end
			end
		local objects = Config.objects
		if objects.object ~= nil and objects.ObjectVertX ~= nil and objects.ObjectVertY ~= nil and objects.ObjectVertZ ~= nil and objects.OjbectDir ~= nil and objects.isBed ~= nil then
			local player = oPlayer
			local getPlayerCoords = GetEntityCoords(player)
			local objectcoords = GetEntityCoords(objects.object)
			if GetDistanceBetweenCoords(objectcoords.x, objectcoords.y, objectcoords.z,getPlayerCoords) < 1.8 and not using then
				if objects.isBed == true then
							anim = "stomach"
						PlayAnimOnPlayer(objects.object,objects.ObjectVertX,objects.ObjectVertY,objects.ObjectVertZ,objects.OjbectDir, objects.isBed, player, objectcoords)
					end
				end
			end
		end
	end)

function PlayAnimOnPlayer(object,vertx,verty,vertz,dir, isBed, ped, objectcoords)
	lastPos = GetEntityCoords(ped)
	FreezeEntityPosition(object, true)
	SetEntityCoords(ped, objectcoords.x, objectcoords.y, objectcoords.z+-1.4)
	FreezeEntityPosition(ped, true)
	using = false
	if isBed == false then
		TaskStartScenarioAtPosition(ped, Config.objects.SitAnimation, objectcoords.x+vertx, objectcoords.y-verty, objectcoords.z-vertz, GetEntityHeading(object)+dir, 0, true, true)
	else
		if anim == "back" then
			TaskStartScenarioAtPosition(ped, Config.objects.LayBackAnimation, objectcoords.x+vertx, objectcoords.y+verty, objectcoords.z-vertz, GetEntityHeading(object)+dir, 0, true, true)
		elseif anim == "stomach" then
			TaskStartScenarioAtPosition(ped, Config.objects.LayStomachAnimation, objectcoords.x+vertx, objectcoords.y+verty, objectcoords.z-vertz, GetEntityHeading(object)+dir, 0, true, true)
		elseif anim == "sit" then
			TaskStartScenarioAtPosition(ped, Config.objects.SitAnimation, objectcoords.x+vertx-0.1, objectcoords.y-verty+0.4, objectcoords.z-vertz-1.0, GetEntityHeading(object)+dir-80, 0, true, true)
		end
	end
end