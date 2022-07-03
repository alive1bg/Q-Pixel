function HighEnd(entradaCoords)	
	local coord = entradaCoords
	local heading = GetEntityHeading(PlayerPedId())
	local modelo = 'shell_highend'
	local items = {}
	local obj = {}
	local x = 1
	DoScreenFadeOut(1000)
	Citizen.Wait(1500)
	SetEntityCoords(PlayerPedId(),305.66970825195,-993.61737060547,-94.195129394531)
	FreezeEntityPosition(PlayerPedId(),true)	
	Citizen.Wait(1000)	
	local generator = { x = coord.x , y = coord.y, z = coord.z - 60}
	RequestModel(GetHashKey(modelo))
	while not HasModelLoaded(GetHashKey(modelo)) do
		Citizen.Wait(5)
	end
	local building = CreateObject(GetHashKey(modelo),generator.x+3.62430500,generator.y-1.55553200,generator.z+0.0,false,true,false)
	FreezeEntityPosition(building,true)
	while not DoesEntityExist(building) do
		Citizen.Wait(50)
	end
	obj[x] = building
	x = x + 1 
	SetEntityCoords(PlayerPedId(), generator.x - 13.56113,generator.y - 1.84,generator.z+8.00)
	SetEntityHeading(PlayerPedId(), GetEntityHeading(building)-90.0)

	obj[x] = CreateObject(`V_16_bed_mesh_windows`,generator.x+0.30707600,generator.y-5.44994300,generator.z+0.0,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`V_16_bed_mesh_delta`,generator.x-1.76030900,generator.y-0.67466500,generator.z-0.0,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`V_16_bed_mesh_delta`,generator.x-1.76030900,generator.y-0.67466500,generator.z+0.02,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`V_16_high_bed_over_normal`,generator.x-1.75513100,generator.y+1.65130700,generator.z-0.0,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`V_16_bdrm_mesh_bath`,generator.x+5.70348400,generator.y-0.86338900,generator.z+0.0,false,false,false)	
	x = x + 1
	obj[x] = CreateObject(`V_16_bdRm_paintings002`,generator.x-0.41010200,generator.y-0.58682690,generator.z+0.15,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`V_16_high_bed_mesh_lights`,generator.x+0.59020600,generator.y+2.21927200,generator.z-0.01,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`V_16_high_bed_over_shadow`,generator.x+2.22250100,generator.y+1.72320200,generator.z-0.12,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`V_16_lgb_rock001`,generator.x+0.30704400,generator.y-5.44356400,generator.z+2.65031600,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`hei_int_heist_lnb_coffee`,generator.x+0.55458700,generator.y-2.51553800,generator.z+0.0,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`V_16_high_bed_over_dirt`,generator.x+3.62430500,generator.y-1.55553200,generator.z+0.0,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`V_16_lng_mesh_stairGlass`,generator.x-7.56569000,generator.y-0.83904900,generator.z+5.030,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`V_16_lng_mesh_delta`,generator.x-5.13722400,generator.y+0.09224100,generator.z+2.580,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`V_16_lng_over_normal`,generator.x-1.36473800,generator.y+0.80418800,generator.z+2.580,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`V_16_lng_mesh_blinds`,generator.x+4.04209900,generator.y-0.44575400,generator.z+7.680,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`V_16_lng_mesh_windows`,generator.x+4.13028000,generator.y-0.57411700,generator.z+4.800,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`V_16_high_lng_details`,generator.x+8.45114900,generator.y-0.81883400,generator.z+5.390,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`V_16_lgb_mesh_lngProp`,generator.x+8.37186000,generator.y-1.07978700,generator.z+4.880,false,false,false)	
	x = x + 1
	obj[x] = CreateObject(`V_16_knt_c`,generator.x+6.42180800,generator.y-0.99209900,generator.z+4.810,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`V_16_rpt_mesh_pictures`,generator.x-8.01097500,generator.y-2.66429500,generator.z+5.450,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`V_16_high_lng_mesh_delta`,generator.x-9.39279700,generator.y+0.07170800,generator.z+2.380,false,false,false)	
	x = x + 1
	obj[x] = CreateObject(`hei_int_heist_bed_unit`,generator.x+3.64581600,generator.y+2.85395100,generator.z+0.0,false,false,false)	
	x = x + 1
	obj[x] = CreateObject(`V_16_high_lng_mesh_plant`,generator.x-3.68126800,generator.y+4.03672500,generator.z+4.590,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`V_16_high_lng_mesh_tvUnit`,generator.x+9.03048800,generator.y-4.68231400,generator.z+4.900,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`V_16_high_lng_over_shadow`,generator.x+10.16043000,generator.y-4.83294600,generator.z+4.840,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`V_16_high_lng_over_shadow2`,generator.x-8.00688600,generator.y-1.29692100,generator.z+3.6,false,false,false)	
	x = x + 1
	obj[x] = CreateObject(`V_16_high_stp_mesh_unit`,generator.x-13.39290000,generator.y-0.17506300,generator.z+2.35,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`v_16_v_sofa`,generator.x+7.80983000,generator.y+0.06534800,generator.z+4.85,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`V_16_lng_mesh_stairGlassB`,generator.x-9.96113500,generator.y-2.60950900,generator.z+6.39,false,false,false)		
	x = x + 1
	obj[x] = CreateObject(`V_16_dnr_a`,generator.x+9.33427000,generator.y+12.73493000,generator.z+6.25,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`V_16_high_ktn_over_decal`,generator.x+1.23671000,generator.y+8.76967200,generator.z+4.82,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`V_16_high_ktn_over_shadow`,generator.x+9.23939100,generator.y+12.44786000,generator.z+4.82,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`V_16_high_kit_mesh_unit`,generator.x-1.81104800,generator.y+9.17513200,generator.z+4.82,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`V_16_lnb_mesh_tableCenter001`,generator.x+9.90664500,generator.y+6.71798600,generator.z+5.7,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`V_16_high_ktn_mesh_delta`,generator.x+4.43419300,generator.y+9.17583700,generator.z+4.81,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`V_16_high_ktn_mesh_windows`,generator.x+4.12927300,generator.y+12.89458000,generator.z+4.81,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`V_16_high_ktn_mesh_fire`,generator.x+6.25015900,generator.y+5.34384200,generator.z+5.1,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`V_16_dnr_c`,generator.x+9.99221000,generator.y+12.55397000,generator.z+4.84,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`V_16_lngAS_mesh_delta003`,generator.x+0.69565000,generator.y+13.05990000,generator.z+4.84,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`V_16_hiigh_ktn_over_normal`,generator.x+3.76106900,generator.y+9.03640600,generator.z+4.84,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`V_16_high_hall_mesh_delta`,generator.x-18.46974000,generator.y-0.07385800,generator.z+6.2,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`V_16_high_hall_over_normal`,generator.x-18.30516000,generator.y+1.78606500,generator.z+6.2,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`V_16_high_hall_over_dirt`,generator.x-18.19183000,generator.y-0.05498100,generator.z+6.2,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`V_16_high_hall_over_shadow`,generator.x-16.98634000,generator.y-0.46674400,generator.z+6.2,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`V_16_high_hal_mesh_plant`,generator.x-15.28974000,generator.y+4.79591600,generator.z+6.0,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`V_16_high_bath_mesh_mirror`,generator.x-4.29534100,generator.y+3.74431100,generator.z+1.2,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`V_16_high_bath_over_shadow`,generator.x-4.25607300,generator.y+6.22950200,generator.z+0.0,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`V_16_high_bath_over_normals`,generator.x-4.32515600,generator.y+5.55146000,generator.z+0.0,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`V_16_high_bath_delta`,generator.x-4.32213500,generator.y+6.22829300,generator.z+0.0,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`V_16_mags`,generator.x-10.44022000,generator.y+8.14852500,generator.z+6.23,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`V_16_HIFI`,generator.x-10.23440000,generator.y+8.07973100,generator.z+6.23,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`V_16_goldRecords`,generator.x-6.60447500,generator.y+8.12033200,generator.z+7.6,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`V_16_BasketBall`,generator.x-9.66279400,generator.y+5.33664100,generator.z+7.0,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`V_16_study_rug`,generator.x-10.4173000,generator.y+8.21256100,generator.z+6.23,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`V_16_study_sofa`,generator.x-8.57377800,generator.y+6.95918400,generator.z+6.23,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`V_16_hi_apt_S_Books`,generator.x-10.46981000,generator.y+7.54295200,generator.z+6.62,false,false,false)	
	x = x + 1
	obj[x] = CreateObject(`V_16_Wardrobe`,generator.x+4.04197800,generator.y+6.41092600,generator.z+0.0,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`V_16_high_ward_over_decal`,generator.x+3.53625300,generator.y+6.29680900,generator.z+0.0,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`V_16_high_ward_over_shadow`,generator.x+3.89552500,generator.y+6.29853200,generator.z+0.0,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`V_16_high_ward_over_normal`,generator.x+3.70096300,generator.y+6.29901000,generator.z+0.0,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`v_res_fh_benchshort`,generator.x-3.74095700,generator.y-4.90060600,generator.z+0.1,false,false,false)
	x = x + 1
	obj[x] = CreateObject(`V_16_shitbench`,generator.x-0.45795000,generator.y+8.45196000,generator.z+0.1,false,false,false)
	local cama = CreateObject(`hei_int_heist_bdr_bed`,generator.x+4.96819100,generator.y-0.72599610,generator.z+0.0,false,false,false)
	x = x + 1
	obj[x] = cama
	local door = CreateObject(`V_ILev_MP_high_FrontDoor`,generator.x-14.59187000,generator.y-1.30682500,generator.z+6.25,false,false,true)
	x = x + 1
	obj[x] = door
	local lamp = CreateObject(`v_res_fh_lampa_on`,generator.x+5.86731700,generator.y-2.72296000,generator.z+0.5,true,false,false)
	table.insert(items,{objeto = lamp, robado = false, anim = 'mesa', borrar = false, dist = 1.00})
	local chair1 = CreateObject(`v_res_fh_easychair`,generator.x+0.64114900,generator.y-4.38969100,generator.z+0.1,false,false,false)	
	x = x + 1
	obj[x] = chair1
	local pouf = CreateObject(`v_res_fh_pouf`,generator.x+2.76928800,generator.y-1.43858200,generator.z+0.05,false,false,false)
	x = x + 1
	obj[x] = pouf
	local tv = CreateObject(`Prop_TV_Flat_01`,generator.x+10.30526000,generator.y-4.7350230,generator.z+5.8,true,false,false)
	table.insert(items,{objeto = tv, robado = false, anim = 'tv', borrar = true, dist = 1.00})
	local table2 = CreateObject(`V_Res_FH_CofTblDisp`,generator.x+8.42698100,generator.y-0.80205100,generator.z+4.9,false,false,false)
	x = x + 1
	obj[x] = table2
	local scope = CreateObject(`Prop_T_Telescope_01b`,generator.x+11.87588000,generator.y+3.78066000,generator.z+4.8,true,false,false)
	table.insert(items,{objeto = scope, robado = false, anim = 'telescopio', borrar = true, dist = 1.30})
	local plant = CreateObject(`v_res_mplanttongue`,generator.x-0.89350100,generator.y+12.45097000,generator.z+4.8,false,false,false)
	x = x + 1
	obj[x] = plant
	local stool = CreateObject(`v_res_fh_kitnstool`,generator.x+1.50922800,generator.y+5.23503600,generator.z+4.8,false,false,false)
	x = x + 1
	obj[x] = stool
	local stool2 = CreateObject(`v_res_fh_kitnstool`,generator.x+0.71056300,generator.y+5.23717500,generator.z+4.8,false,false,false)
	x = x + 1
	obj[x] = stool2
	local stool3 = CreateObject(`v_res_fh_kitnstool`,generator.x+0.00570800,generator.y+5.23717500,generator.z+4.8,false,false,false)
	x = x + 1
	obj[x] = stool3
	local table3 = CreateObject(`v_res_fh_sidebrddine`,generator.x+10.23037000,generator.y+12.51273000,generator.z+4.8,false,false,false)
	x = x + 1
	obj[x] = table3
	local radio1 = CreateObject(`as_prop_as_speakerdock`,generator.x+9.122064,generator.y+12.52006,generator.z+5.65,true,false,false)
	table.insert(items,{objeto = radio1, robado = false, anim = 'normal', borrar = true, dist = 1.40})
	local radio2 = CreateObject(`as_prop_as_speakerdock`,generator.x+3.64,generator.y+2.943,generator.z+1.00,true,false,false)
	table.insert(items,{objeto = radio2, robado = false, anim = 'normal', borrar = true, dist = 1.40})
	local jugos = CreateObject(`prop_kitch_juicer`,generator.x-4.688541,generator.y+6.830099,generator.z+5.80,true,false,false)
	table.insert(items,{objeto = jugos, robado = false, anim = 'normal', borrar = true, dist = 1.40})
	local tableDin = CreateObject(`v_res_fh_diningtable`,generator.x+9.90193900,generator.y+6.85432300,generator.z+4.84,false,false,false)
	x = x + 1
	obj[x] = tableDin
	local pintura = CreateObject(`hei_int_heist_rpt_pictures3`,generator.x+12.47420000,generator.y+6.88947700,generator.z+5.76,true,false,false)
	table.insert(items,{objeto = pintura, robado = false, anim = 'pintura', borrar = true, dist = 1.60})
	local kitchenShadow = CreateObject(`V_16_high_ktn_over_shadows`,generator.x+5.58696700,generator.y+5.58839800,generator.z+4.85,false,false,false)
	x = x + 1
	obj[x] = kitchenShadow
	local kitchenStuff = CreateObject(`V_16_knt_mesh_stuff`,generator.x-4.19894500,generator.y+8.82334300,generator.z+4.9,false,false,false)
	x = x + 1
	obj[x] = kitchenStuff
	local armChairs = CreateObject(`hei_int_heist_lng_armchairs`,generator.x+1.49934300,generator.y-1.34954600,generator.z+4.85,false,false,false)
	x = x + 1
	obj[x] = armChairs
	local mesa = CreateObject(`hei_int_heist_fh_sidebrdlngb`,generator.x+5.00673200,generator.y-0.30080600,generator.z+4.890,false,false,false)
	x = x + 1
	obj[x] = mesa
	local librero = CreateObject(`hei_int_heist_lng_shelf`,generator.x-1.95027700,generator.y-3.14528700,generator.z+5.300,true,false,false)
	table.insert(items,{objeto = librero, robado = false, anim = 'normal', borrar = false, dist = 2.0})
	FreezeEntityPosition(PlayerPedId(),false)
	FreezeEntityPosition(tableDin,true)
	FreezeEntityPosition(door,true)
	FreezeEntityPosition(lamp,true)
	FreezeEntityPosition(chair1,true)
	FreezeEntityPosition(pouf,true)
	FreezeEntityPosition(table2,true)
	FreezeEntityPosition(plant,true)
	FreezeEntityPosition(stool,true)
	FreezeEntityPosition(stool2,true)
	FreezeEntityPosition(stool3,true)
	FreezeEntityPosition(table3,true)
	FreezeEntityPosition(radio1,true)
	FreezeEntityPosition(radio2,true)
	FreezeEntityPosition(cama,true)
	FreezeEntityPosition(jugos,true)
	SetEntityHeading(mesa,GetEntityHeading(mesa)-90)
	SetEntityHeading(armChairs,GetEntityHeading(armChairs)-25)
	SetEntityHeading(kitchenShadow,GetEntityHeading(kitchenShadow)+90)
	SetEntityHeading(kitchenStuff,GetEntityHeading(kitchenStuff)-34)
	SetEntityHeading(door,GetEntityHeading(door)+90)
	SetEntityHeading(lamp,GetEntityHeading(lamp)+90)
	SetEntityHeading(chair1,GetEntityHeading(chair1)+180)
	SetEntityHeading(pouf,GetEntityHeading(pouf)+15)
	SetEntityHeading(tv,GetEntityHeading(tv)+180)
	SetEntityHeading(table2,GetEntityHeading(table2)+90)
	SetEntityHeading(scope,GetEntityHeading(scope)+180)
	SetEntityHeading(jugos,GetEntityHeading(jugos)+180)
	if Config.SpawnSafe then
		local suerte = math.random(1,5)
		if suerte == 2 then
			local caja = CreateObject(`prop_ld_int_safe_01`,generator.x+5.536987,generator.y+6.348022,generator.z+0.05,false,false,false)
			table.insert(items,{objeto = caja, robado = false, anim = 'cajafuerte', borrar = false, dist = 1.0})
			FreezeEntityPosition(caja,true)
			SetEntityHeading(caja,GetEntityHeading(caja)-90)
		end
	end
	SetModelAsNoLongerNeeded(GetHashKey(modelo))
	Citizen.Wait(2500)
	DoScreenFadeIn(1500)
	local coords = GetEntityCoords(PlayerPedId())
	local h = GetEntityHeading(PlayerPedId())
	return coords, h, items, obj
end

-----------------------------------------------------------------------------------------------------------------------------------------------------

function MidApt(entradaCoords)
	local coord = entradaCoords
	local heading = GetEntityHeading(PlayerPedId())
	local modelo = 'shell_v16mid'
	local items = {}
	local obj = {}
	local x = 1
	DoScreenFadeOut(1000)
	Citizen.Wait(1500)
	SetEntityCoords(PlayerPedId(), 347.04724121094, -1000.2844848633, -99.194671630859)
	FreezeEntityPosition(PlayerPedId(),true)	
	Citizen.Wait(1000)	
	local generator = { x = coord.x , y = coord.y, z = coord.z - 50.0}
	RequestModel(GetHashKey(modelo))
	while not HasModelLoaded(GetHashKey(modelo)) do
		Citizen.Wait(5)
	end
	local building = CreateObject(GetHashKey(modelo), generator.x+2.30,generator.y-1.35553200,generator.z+1.16253700,false,true,false)
	while not DoesEntityExist(building) do
		Citizen.Wait(50)
	end
	FreezeEntityPosition(building,true)
	Citizen.Wait(2000)
	SetEntityCoords(PlayerPedId(), generator.x+3.6, generator.y-14.8, generator.z+2.9)
	SetEntityHeading(PlayerPedId(), 358.106)	
	obj[x] = building
	x = x + 1
	local dt = CreateObject(GetHashKey("V_16_DT"), generator.x-1.21854400, generator.y-1.04389600, generator.z+1.39068600, false, false, false)
	obj[x] = dt
	x = x + 1
	local mpmid09 = CreateObject(GetHashKey("V_16_mpmidapart09"), generator.x+0.82202150, generator.y+2.29612000, generator.z+1.88, false, false, false)
	obj[x] = mpmid09
	x = x + 1
	local mpmid07 = CreateObject(GetHashKey("V_16_mpmidapart07"), generator.x-1.91445900, generator.y-6.61911300, generator.z+1.45, false, false, false)
	obj[x] = mpmid07
	x = x + 1
	local mpmid03 = CreateObject(GetHashKey("V_16_mpmidapart03"), generator.x-4.82565300, generator.y-6.86803900, generator.z+1.14, false, false, false)
	obj[x] = mpmid03
	x = x + 1
	local midData = CreateObject(GetHashKey("V_16_midapartdeta"), generator.x+2.28558400, generator.y-1.94082100, generator.z+1.32, false, false, false) -- sala
	obj[x] = midData
	x = x + 1
	local glow = CreateObject(GetHashKey("V_16_treeglow"), generator.x-1.37408500, generator.y-0.95420070, generator.z+1.135, false, false, false)
	obj[x] = glow
	x = x + 1
	local curtins = CreateObject(GetHashKey("V_16_midapt_curts"), generator.x-1.96423300, generator.y-0.95958710, generator.z+1.280, false, false, false)
	obj[x] = curtins
	x = x + 1
	local mpmid13 = CreateObject(GetHashKey("V_16_mpmidapart13"), generator.x-4.65580700, generator.y-6.61684000, generator.z+1.259, false, false, false)
	obj[x] = mpmid13
	x = x + 1
	local mpcab = CreateObject(GetHashKey("V_16_midapt_cabinet"), generator.x-1.16177400, generator.y-0.97333810, generator.z+1.27, false, false, false)
	obj[x] = mpcab
	x = x + 1
	local mpdecal = CreateObject(GetHashKey("V_16_midapt_deca"), generator.x+2.311386000, generator.y-2.05385900, generator.z+1.297, false, false, false)
	obj[x] = mpdecal
	x = x + 1
	local mpdelta = CreateObject(GetHashKey("V_16_mid_hall_mesh_delta"), generator.x+3.69693000, generator.y-5.80020100, generator.z+1.293, false, false, false)
	obj[x] = mpdelta
	x = x + 1
	local beddelta = CreateObject(GetHashKey("V_16_mid_bed_delta"), generator.x+7.95187400, generator.y+1.04246500, generator.z+1.28402300, false, false, false) -- habitacion
	obj[x] = beddelta
	x = x + 1
	local bed = CreateObject(GetHashKey("v_res_tre_bed2"), generator.x+6.86376900, generator.y+1.20651200, generator.z+1.33589100, false, false, false)
	obj[x] = bed
	x = x + 1
	local beddecal = CreateObject(GetHashKey("V_16_MID_bed_over_decal"), generator.x+7.82861300, generator.y+1.04696700, generator.z+1.34753700, false, false, false)
	obj[x] = beddecal
	x = x + 1
--	local bathDelta = CreateObject(GetHashKey("V_16_mid_bath_mesh_delta"), generator.x+4.45460500, generator.y+3.21322800, generator.z+1.21116100, false, false, false)
	local bathmirror = CreateObject(GetHashKey("V_16_mid_bath_mesh_mirror"), generator.x+3.57740800, generator.y+3.25032000, generator.z+1.48871300, false, false, false)
	obj[x] = bathmirror
	x = x + 1
	--props
	local beerbot = CreateObject(GetHashKey("Prop_CS_Beer_Bot_01"), generator.x+1.73134600, generator.y-4.88520200, generator.z+1.91083000, false, false, false)
	obj[x] = beerbot
	x = x + 1
	local couch = CreateObject(GetHashKey("v_res_mp_sofa"), generator.x-1.48765600, generator.y+1.68100600, generator.z+1.33640500, false, false, false)
	obj[x] = couch
	x = x + 1
	local chair = CreateObject(GetHashKey("v_res_mp_stripchair"), generator.x-4.44770800, generator.y-1.78048800, generator.z+1.21640500, false, false, false)
	obj[x] = chair
	x = x + 1
	local chair2 = CreateObject(GetHashKey("v_res_tre_chair"), generator.x+2.91325400, generator.y-5.27835100, generator.z+1.22746400, false, false, false)
	obj[x] = chair2
	x = x + 1
	local plant = CreateObject(GetHashKey("Prop_Plant_Int_04a"), generator.x+2.78941300, generator.y-4.39133900, generator.z+2.12746400, false, false, false)
	obj[x] = plant
	x = x + 1
	local lamp = CreateObject(GetHashKey("v_res_d_lampa"), generator.x-3.61473100, generator.y-6.61465100, generator.z+2.09373700, false, false, false)
	obj[x] = lamp
	x = x + 1
	local fridge = CreateObject(GetHashKey("v_res_fridgemodsml"), generator.x+1.90339700, generator.y-3.80026800, generator.z+1.29917900, false, false, false)
	obj[x] = fridge
	x = x + 1
	local micro = CreateObject(GetHashKey("prop_micro_01"), generator.x+2.03442400, generator.y-4.64585100, generator.z+2.28995600, true, false, false)
	table.insert(items,{objeto = micro, robado = false, anim = 'prop_micro_01', borrar = true, dist = 1.10})
	local sideBoard = CreateObject(GetHashKey("V_Res_Tre_SideBoard"), generator.x+2.84053000, generator.y-4.30947100, generator.z+1.24577300, false, false, false)
	obj[x] = sideBoard
	x = x + 1
	local bedSide = CreateObject(GetHashKey("V_Res_Tre_BedSideTable"), generator.x-3.50363200, generator.y-6.55289400, generator.z+1.30625800, true, false, false)
	table.insert(items,{objeto = bedSide, robado = false, anim = 'normal', borrar = false, dist = 1.5})
	local lamp2 = CreateObject(GetHashKey("v_res_d_lampa"), generator.x+2.69674700, generator.y-3.83123500, generator.z+2.09373700, false, false, false)
	obj[x] = lamp2
	x = x + 1
	local plant2 = CreateObject(GetHashKey("v_res_tre_tree"), generator.x-4.96064800, generator.y-6.09898500, generator.z+1.31631400, false, false, false)
	obj[x] = plant2
	x = x + 1
	local mesa = CreateObject(GetHashKey("V_Res_M_DineTble_replace"), generator.x-3.50712600, generator.y-4.13621600, generator.z+1.29625800, false, false, false)
	obj[x] = mesa
	x = x + 1
	local tv = CreateObject(GetHashKey("Prop_TV_Flat_01"), generator.x-5.53120400, generator.y+0.76299670, generator.z+2.17236000, true, false, false)
	table.insert(items,{objeto = tv, robado = false, anim = 'tv', borrar = true, dist = 1.20})
	local plant3 = CreateObject(GetHashKey("v_res_tre_plant"), generator.x-5.14112800, generator.y-2.78951000, generator.z+1.25950800, false, false, false)
	obj[x] = plant3
	x = x + 1
	local chair3 = CreateObject(GetHashKey("v_res_m_dinechair"), generator.x-3.04652400, generator.y-4.95971200, generator.z+1.19625800, false, false, false)
	obj[x] = chair3
	x = x + 1
	local lampStand = CreateObject(GetHashKey("v_res_m_lampstand"), generator.x+1.26588400, generator.y+3.68883900, generator.z+1.35556700, false, false, false)
	obj[x] = lampStand
	x = x + 1
	local stool = CreateObject(GetHashKey("V_Res_M_Stool_REPLACED"), generator.x-3.23216300, generator.y+2.06159000, generator.z+1.20556700, false, false, false)
	obj[x] = stool
	x = x + 1
	local chair4 = CreateObject(GetHashKey("v_res_m_dinechair"), generator.x-2.82237200, generator.y-3.59831300, generator.z+1.25950800, false, false, false)
	obj[x] = chair4
	x = x + 1
	local chair5 = CreateObject(GetHashKey("v_res_m_dinechair"), generator.x-4.14955100, generator.y-4.71316600, generator.z+1.19625800, false, false, false)
	obj[x] = chair5
	x = x + 1
	local chair6 = CreateObject(GetHashKey("v_res_m_dinechair"), generator.x-3.80622900, generator.y-3.37648300, generator.z+1.19625800, false, false, false)
	obj[x] = chair6
	x = x + 1
	local plant4 = CreateObject(GetHashKey("v_res_fa_plant01"), generator.x+2.97859200, generator.y+2.55307400, generator.z+1.85796300, false, false, false)
	obj[x] = plant4
	x = x + 1
	local storage = CreateObject(GetHashKey("v_res_tre_storageunit"), generator.x+8.47819500, generator.y-2.50979300, generator.z+1.19712300, true, false, false)
	table.insert(items,{objeto = storage, robado = false, anim = 'normal', borrar = false, dist = 1.50})
	local storage2 = CreateObject(GetHashKey("v_res_tre_storagebox"), generator.x+9.75982700, generator.y-1.35874100, generator.z+1.29625800, true, false, false)
	table.insert(items,{objeto = storage2, robado = false, anim = 'normal', borrar = false, dist = 1.50})
	local basketmess = CreateObject(GetHashKey("v_res_tre_basketmess"), generator.x+8.70730600, generator.y-2.55503600, generator.z+1.94059590, false, false, false)
	obj[x] = basketmess
	x = x + 1
	local lampStand2 = CreateObject(GetHashKey("v_res_m_lampstand"), generator.x+9.54306000, generator.y-2.50427700, generator.z+1.30556700, false, false, false)
	obj[x] = lampStand2
	x = x + 1
	local plant4 = CreateObject(GetHashKey("Prop_Plant_Int_03a"), generator.x+9.87521400, generator.y+3.90917400, generator.z+1.20829700, false, false, false)
	obj[x] = plant4
	x = x + 1
	local basket = CreateObject(GetHashKey("v_res_tre_washbasket"), generator.x+9.39091500, generator.y+4.49676300, generator.z+1.19625800, false, false, false)
	obj[x] = basket
	x = x + 1
	local wardrobe = CreateObject(GetHashKey("V_Res_Tre_Wardrobe"), generator.x+8.46626300, generator.y+4.53223600, generator.z+1.19425800, true, false, false)
	table.insert(items,{objeto = wardrobe, robado = false, anim = 'normal', borrar = false, dist = 1.8})
	local basket2 = CreateObject(GetHashKey("v_res_tre_flatbasket"), generator.x+8.51593000, generator.y+4.55647300, generator.z+3.46737300, false, false, false)
	obj[x] = basket2
	x = x + 1
	local basket3 = CreateObject(GetHashKey("v_res_tre_basketmess"), generator.x+7.57797200, generator.y+4.55198800, generator.z+3.46737300, false, false, false)
	obj[x] = basket3
	x = x + 1
	local basket4 = CreateObject(GetHashKey("v_res_tre_flatbasket"), generator.x+7.12286400, generator.y+4.54689200, generator.z+3.46737300, false, false, false)
	obj[x] = basket4
	x = x + 1
	local wardrobe2 = CreateObject(GetHashKey("V_Res_Tre_Wardrobe"), generator.x+7.24382000, generator.y+4.53423500, generator.z+1.19625800, false, false, false)
	obj[x] = wardrobe2
	x = x + 1
	local basket5 = CreateObject(GetHashKey("v_res_tre_flatbasket"), generator.x+8.03364600, generator.y+4.54835500, generator.z+3.46737300, false, false, false)
	obj[x] = basket5
	x = x + 1
	local switch = CreateObject(GetHashKey("v_serv_switch_2"), generator.x+6.28086900, generator.y-0.68169880, generator.z+2.30326000, false, false, false)
	obj[x] = switch
	x = x + 1
	local table2 = CreateObject(GetHashKey("V_Res_Tre_BedSideTable"), generator.x+5.84416200, generator.y+2.57377400, generator.z+1.22089100, true, false, false)
	table.insert(items,{objeto = table2, robado = false, anim = 'normal', borrar = false, dist = 1.3})
	local lamp3 = CreateObject(GetHashKey("v_res_d_lampa"), generator.x+5.84912100, generator.y+2.58001100, generator.z+1.95311890, false, false, false)
	obj[x] = lamp3
	x = x + 1
	local ashtray = CreateObject(GetHashKey("Prop_ashtray_01"), generator.x-1.24716200, generator.y+1.07820500, generator.z+1.87089300, false, false, false)
	obj[x] = ashtray
	x = x + 1
	local candle1 = CreateObject(GetHashKey("v_res_fa_candle03"), generator.x-2.89289900, generator.y-4.35329700, generator.z+2.02881310, false, false, false)
	obj[x] = candle1
	x = x + 1
	local candle2 = CreateObject(GetHashKey("v_res_fa_candle02"), generator.x-3.99865700, generator.y-4.06048500, generator.z+2.02530190, false, false, false)
	obj[x] = candle2
	x = x + 1
	local candle3 = CreateObject(GetHashKey("v_res_fa_candle01"), generator.x-3.37733400, generator.y-3.66639800, generator.z+2.02526200, false, false, false)
	obj[x] = candle3
	x = x + 1
	local woodbowl = CreateObject(GetHashKey("v_res_m_woodbowl"), generator.x-3.50787400, generator.y-4.11983000, generator.z+2.02589900, false, false, false)
	obj[x] = woodbowl
	x = x + 1
	local tablod = CreateObject(GetHashKey("V_Res_TabloidsA"), generator.x-0.80513000, generator.y+0.51389600, generator.z+1.18418800, false, false, false)
	obj[x] = tablod
	x = x + 1
	local tapeplayer = CreateObject(GetHashKey("Prop_Tapeplayer_01"), generator.x-1.26010100, generator.y-3.62966400, generator.z+2.37883200, false, false, false)
	obj[x] = tapeplayer
	x = x + 1
	local woodbowl2 = CreateObject(GetHashKey("v_res_tre_fruitbowl"), generator.x+2.77764900, generator.y-4.138297000, generator.z+2.10340100, false, false, false)
	obj[x] = woodbowl2
	x = x + 1
	local sculpt = CreateObject(GetHashKey("v_res_sculpt_dec"), generator.x+3.03932200, generator.y+1.62726400, generator.z+3.58363900, false, false, false)
	obj[x] = sculpt
	x = x + 1
	local jewlry = CreateObject(GetHashKey("v_res_jewelbox"), generator.x+3.04164100, generator.y+0.31671810, generator.z+3.58363900, false, false, false)
	obj[x] = jewlry
	x = x + 1
	local basket6 = CreateObject(GetHashKey("v_res_tre_basketmess"), generator.x-1.64906300, generator.y+1.62675900, generator.z+1.39038500, false, false, false)
	obj[x] = basket6
	x = x + 1
	local basket7 = CreateObject(GetHashKey("v_res_tre_flatbasket"), generator.x-1.63938900, generator.y+0.91133310, generator.z+1.39038500, false, false, false)
	obj[x] = basket7
	x = x + 1
	local basket8 = CreateObject(GetHashKey("v_res_tre_flatbasket"), generator.x-1.19923400, generator.y+1.69598600, generator.z+1.39038500, false, false, false)
	obj[x] = basket8
	x = x + 1
	local basket9 = CreateObject(GetHashKey("v_res_tre_basketmess"), generator.x-1.18293800, generator.y+0.91436380, generator.z+1.39038500, false, false, false)
	obj[x] = basket9
	x = x + 1
	local bowl = CreateObject(GetHashKey("v_res_r_sugarbowl"), generator.x-0.26029210, generator.y-6.66716800, generator.z+3.77324900, false, false, false)
	obj[x] = bowl
	x = x + 1
	local breadbin = CreateObject(GetHashKey("Prop_Breadbin_01"), generator.x+2.09788500, generator.y-6.57634000, generator.z+2.24041900, false, false, false)
	obj[x] = breadbin
	x = x + 1
	local knifeblock = CreateObject(GetHashKey("v_res_mknifeblock"), generator.x+1.82084700, generator.y-6.58438500, generator.z+2.27399500, false, false, false)
	obj[x] = knifeblock
	x = x + 1
	local toaster = CreateObject(GetHashKey("prop_toaster_01"), generator.x-1.05790700, generator.y-6.59017400, generator.z+2.26793200, false, false, false)
	obj[x] = toaster
	x = x + 1
	local cafetera = CreateObject(GetHashKey("prop_coffee_mac_02"), generator.x-0.04710700, generator.y-6.59617400, generator.z+2.26793200, true, false, false)	
	table.insert(items,{objeto = cafetera, robado = false, anim = 'prop_coffee_mac_02', borrar = false, dist = 1.8})
	local suerte = math.random(1,3)
	if suerte == 2 then
		local laptop = CreateObject(GetHashKey("prop_laptop_02_closed"), generator.x-0.522, generator.y+3.1421, generator.z+1.80013400, false, false, false)	
		table.insert(items,{objeto = laptop, robado = false, anim = 'laptop', borrar = true, dist = 1.8})
	end
	local wok = CreateObject(GetHashKey("prop_wok"), generator.x+2.01728800, generator.y-5.57091500, generator.z+2.31793200, false, false, false)
	obj[x] = wok
	x = x + 1
	local plant5 = CreateObject(GetHashKey("Prop_Plant_Int_03a"), generator.x+2.55015600, generator.y+4.60183900, generator.z+1.20829700, false, false, false)
	obj[x] = plant5
	x = x + 1
	local tumbler = CreateObject(GetHashKey("p_tumbler_cs2_s"), generator.x-0.90916440, generator.y-4.24099100, generator.z+2.24693200, false, false, false)
	obj[x] = tumbler
	x = x + 1
	local wisky = CreateObject(GetHashKey("p_whiskey_bottle_s"), generator.x-0.92809300, generator.y-3.99099100, generator.z+2.24693200, false, false, false)
	obj[x] = wisky
	x = x + 1
	local tissue = CreateObject(GetHashKey("v_res_tissues"), generator.x+7.95889300, generator.y-2.54847100, generator.z+1.94013400, false, false, false)
	obj[x] = tissue
	x = x + 1
	local pants = CreateObject(GetHashKey("V_16_Ap_Mid_Pants4"), generator.x+7.55366500, generator.y-0.25457100, generator.z+1.33009200, false, false, false)
	obj[x] = pants
	x = x + 1
	local pants2 = CreateObject(GetHashKey("V_16_Ap_Mid_Pants5"), generator.x+7.76753200, generator.y+3.00476500, generator.z+1.33052800, false, false, false)
	obj[x] = pants2
	x = x + 1
	local hairdryer = CreateObject(GetHashKey("v_club_vuhairdryer"), generator.x+8.12616000, generator.y-2.50562000, generator.z+1.96009390, false, false, false)
	obj[x] = hairdryer
	x = x + 1
	if Config.SpawnSafe then
		local suerte = math.random(1,5)
		if suerte == 2 then
			local caja = CreateObject(`prop_ld_int_safe_01`,generator.x+6.2,generator.y+4.52972300,generator.z+1.32609800,false,false,false)
			table.insert(items,{objeto = caja, robado = false, anim = 'cajafuerte', borrar = false, dist = 1.0})
			FreezeEntityPosition(caja,true)
		end
	end
	
	FreezeEntityPosition(dt,true)
	FreezeEntityPosition(mpmid09,true)
	FreezeEntityPosition(mpmid07,true)
	FreezeEntityPosition(mpmid03,true)
	FreezeEntityPosition(midData,true)
	FreezeEntityPosition(glow,true)
	FreezeEntityPosition(curtins,true)
	FreezeEntityPosition(mpmid13,true)
	FreezeEntityPosition(mpcab,true)
	FreezeEntityPosition(mpdecal,true)
	FreezeEntityPosition(mpdelta,true)
	FreezeEntityPosition(couch,true)
	FreezeEntityPosition(chair,true)
	FreezeEntityPosition(chair2,true)
	FreezeEntityPosition(plant,true)
	FreezeEntityPosition(lamp,true)
	FreezeEntityPosition(fridge,true)
	FreezeEntityPosition(micro,true)
	FreezeEntityPosition(sideBoard,true)
	FreezeEntityPosition(bedSide,true)
	FreezeEntityPosition(plant2,true)
	FreezeEntityPosition(mesa,true)
	FreezeEntityPosition(tv,true)
	FreezeEntityPosition(plant3,true)
	FreezeEntityPosition(chair3,true)
	FreezeEntityPosition(lampStand,true)
	FreezeEntityPosition(chair4,true)
	FreezeEntityPosition(chair5,true)
	FreezeEntityPosition(chair6,true)
	FreezeEntityPosition(plant4,true)
	FreezeEntityPosition(storage,true)
	FreezeEntityPosition(storage2,true)
	FreezeEntityPosition(basket,true)
	FreezeEntityPosition(wardrobe,true)
	FreezeEntityPosition(wardrobe2,true)
	FreezeEntityPosition(table2,true)
	FreezeEntityPosition(lamp3,true)
	FreezeEntityPosition(cafetera,true)
	FreezeEntityPosition(beddelta,true)
	FreezeEntityPosition(bed,true)
	FreezeEntityPosition(beddecal,true)
	FreezeEntityPosition(tapeplayer,true)
	FreezeEntityPosition(basket7,true)
	FreezeEntityPosition(basket6,true)
	FreezeEntityPosition(basket8,true)
	FreezeEntityPosition(basket9,true)
	SetEntityHeading(beerbot,GetEntityHeading(beerbot)+90)
	SetEntityHeading(bed,GetEntityHeading(bed)+90)
	SetEntityHeading(couch,GetEntityHeading(couch)-90)
	SetEntityHeading(chair,GetEntityHeading(chair)+getRotation(0.28045480))
	SetEntityHeading(chair2,GetEntityHeading(chair2)+getRotation(0.3276100))
	SetEntityHeading(fridge,GetEntityHeading(chair2)+160)
	SetEntityHeading(micro,GetEntityHeading(micro)-90)
	SetEntityHeading(sideBoard,GetEntityHeading(sideBoard)+90)
	SetEntityHeading(bedSide,GetEntityHeading(bedSide)+180)
	SetEntityHeading(tv,GetEntityHeading(tv)+90)
	SetEntityHeading(plant3,GetEntityHeading(plant3)+90)
	SetEntityHeading(chair3,GetEntityHeading(chair3)+200)
	SetEntityHeading(chair4,GetEntityHeading(chair3)+100)
	SetEntityHeading(chair5,GetEntityHeading(chair5)+135)
	SetEntityHeading(chair6,GetEntityHeading(chair6)+10)
	SetEntityHeading(storage,GetEntityHeading(storage)+180)
	SetEntityHeading(storage2,GetEntityHeading(storage2)-90)
	SetEntityHeading(table2,GetEntityHeading(table2)+90)
	SetEntityHeading(tapeplayer,GetEntityHeading(tapeplayer)+90)
	SetEntityHeading(knifeblock,GetEntityHeading(knifeblock)+180)
	SetEntityHeading(cafetera,GetEntityHeading(cafetera)+180)
	FreezeEntityPosition(PlayerPedId(),false)
	SetModelAsNoLongerNeeded(GetHashKey(modelo))
	Citizen.Wait(2500)
	DoScreenFadeIn(1500)
	local coords = GetEntityCoords(PlayerPedId())
	local h = GetEntityHeading(PlayerPedId())
	return coords, h, items, obj
end

function getRotation(input)
    return 360 / (10 * input)
end