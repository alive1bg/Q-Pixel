QBShared = QBShared or {}
QBShared.ForceJobDefaultDutyAtLogin = true -- true: Force duty state to jobdefaultDuty | false: set duty state from database last saved
QBShared.Jobs = {
	['unemployed'] = {
		label = 'Civilian',
		defaultDuty = true,
		offDutyPay = true,
		grades = {
            ['0'] = {
                name = 'Civilian',
                payment = 30
            },
        },
	},
    ['mayor'] = {
		label = 'Mayor',
		defaultDuty = true,
		offDutyPay = true,
		grades = {
            ['0'] = {
                name = 'Los Santos Mayor',
                payment = 350
            },
        },
	},
    ["noodle"] = {
        label = "Noodle",
        defaultDuty = true,
        grades = {
            ['0'] = {
                label = 'Worker',
                payment = 30,
            },
            ['1'] = {
                label = 'Vice Boss',
                payment = 70,
            },
            ['2'] = {
                label = 'Boss',
                isboss = true,
                payment = 130,
            },
        }
    },
    ["icecream"] = {
        label = "IceCream",
        offDutyPay = false,
        defaultDuty = false,
        grades = {
            ['0'] = {
                name = 'Worker',
                payment = 30,
            },
            ['1'] = {
                name = 'Vice Boss',
                payment = 70,
            },
            ['2'] = {
                name = 'Boss',
                isboss = true,
                payment = 130,
            },
        }
    },
    ['beanmachine'] = {
		label = 'Bean Machine',
		defaultDuty = true,
		grades = {
            ['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 150 },
        },
	},
    ['billiard'] = {
        label = 'Billiard Bar',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Employee',
                payment = 50
            },
            ['2'] = {
                name = 'Boss',
                payment = 100
            },
        },
    },
    ['pizzathis'] = {
		label = 'Maldinis Pizza',
		defaultDuty = true,
		grades = {
            ['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 65 },
			['2'] = { name = 'Experienced', payment = 75 },
			['3'] = { name = 'True Cook', payment = 85 },
			['4'] = { name = 'Manager', isboss = true, payment = 95 },
        },
	},
    ['burgershot'] = {
		label = 'BurgerShot',
		defaultDuty = true,
		grades = {
            ['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 65 },
			['2'] = { name = 'Experienced', payment = 75 },
			['3'] = { name = 'Assistant Manager', payment = 85 },
			['4'] = { name = 'Senior Manager', isboss = true, payment = 95 },
        },
	},
    ['cerberus'] = {
		label = 'Cerberus Business Incorporated',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Employee',
                payment = 50
            },
            ['1'] = {
                name = 'Boss',
                isboss = true,
                payment = 95
            },
        },
	},
    ['oilwell'] = {
        label = 'Oil Company',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Oilwell Operator',
                payment = 50
            },
            ['1'] = {
                name = 'Oilwell Operator tier 2',
                payment = 75
            },
            ['2'] = {
                name = 'Event Driver tier 2',
                payment = 100
            },
            ['3'] = {
                name = 'Sales',
                payment = 125
            },
            ['4'] = {
                name = 'CEO',
                isboss = true,
                payment = 150
            },
        },
    },
    ['weedshop'] = {
        label = 'Weed Dispensary',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Trainee',
                payment = 500
            },
            ['1'] = {
                name = 'Employee',
                payment = 650
            },
            ['2'] = {
                name = 'Sales Manager',
                payment = 850
            },
            ['3'] = {
                name = 'Manager',
                payment = 1000
            },
            ['4'] = {
                name = 'Boss',
                isboss = true,
                payment = 1500
            },
        },
    },
    ['casino'] = {
		label = 'Diamond Casino',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Employee',
                payment = 55
            },
            ['1'] = {
                name = 'Manager',
                isboss = true,
                payment = 75
            },
            ['2'] = {
                name = 'Casino Owner',
                isboss = true,
                payment = 100
            },
        },
	},
    ['cardshop'] = {
		label = 'Card Shop',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Trainee',
                payment = 30
            },
            ['1'] = {
                name = 'Employee',
                payment = 40
            },
            ['2'] = {
                name = 'Mobile Van Driver',
                payment = 60
            },
            ['3'] = {
                name = 'Assistant Manager',
                isboss = true,
                payment = 85
            },
            ['4'] = {
                name = 'Shop Owner',
                isboss = true,
                payment = 120
            },
        },
	},
    ['vanilla'] = {
		label = 'Vanilla Unicorn',
		defaultDuty = true,
		grades = {
            ['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 150 },
        },
	},
    ["records"] = {
        label = "Records",
        offDutyPay = false,
        defaultDuty = false,
        grades = {
            ['0'] = {
                name = 'Worker',
                payment = 30,
            },
            ['1'] = {
                name = 'Vice Boss',
                payment = 70,
            },
            ['2'] = {
                name = 'Boss',
                isboss = true,
                payment = 130,
            },
        }
    },
    ['popsdiner'] = {
		label = 'Pop\'s Diner',
		defaultDuty = true,
		grades = {
            ['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 150 },
        },
	},
    ['gallery'] = {
		label = 'Viva le Cultur',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Freelancer',
                payment = 30
            },
            ['1'] = {
                name = 'Owner',
                isboss = true,
                payment = 60
            },
        },
	},
    ['uwu'] = {
		label = 'uWu Cafe',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = {
				name = 'Recruit',
				payment = 65
			},
			['1'] = {
				name = 'Crew Member',
				payment = 75
			},
			['2'] = {
				name = 'Shift Manager',
				payment = 95
			},
			['3'] = {
				name = 'Manager',
				payment = 110
			},
			['4'] = {
				name = 'Owner',
				isboss = true,
				payment = 120
			},
		},
	},
	['police'] = { -- start of police departments
		label = 'Los Santos Police Department',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Cadet',
                payment = 30
            },
			['1'] = {
                name = 'Solo Cadet',
                payment = 50
            },
			['2'] = {
                name = 'Officer',
                payment = 80
            },
			['3'] = {
                name = 'Sr. Officer',
                payment = 90
            },
            ['4'] = {
                name = 'Corporal',
                payment = 100
            },
            ['5'] = {
                name = 'Sergeant',
                payment = 105
            },
            ['6'] = {
                name = 'Lieutenant',
                payment = 125
            },
            ['7'] = {
                name = 'Captain',
                payment = 135
            },
			['8'] = {
                name = 'Assistant Chief of Police',
				isboss = true,
                payment = 145
            },
            ['9'] = {
                name = 'Chief of Police',
				isboss = true,
                payment = 155
            },
        },
	},
    ['sasp'] = {
		label = 'San Andreas State Police',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Trooper',
                payment = 105
            },
			['1'] = {
                name = 'Trooper',
                payment = 105
            },
			['2'] = {
                name = 'Trooper',
                payment = 105
            },
			['3'] = {
                name = 'Trooper',
                payment = 105
            },
            ['4'] = {
                name = 'Trooper',
                payment = 105
            },
            ['5'] = {
                name = 'Trooper',
                payment = 105
            },
            ['6'] = {
                name = 'Trooper',
                payment = 105
            },
            ['7'] = {
                name = 'Trooper',
                payment = 105
            },
			['8'] = {
                name = 'Assistant Chief',
				isboss = true,
                payment = 145
            },
            ['9'] = {
                name = 'Chief of SASP',
				isboss = true,
                payment = 155
            },
        },
	},
	['saspr'] = {
		label = 'San Andreas State Park Rangers',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Junior Ranger',
                payment = 30
            },
			['1'] = {
                name = 'Ranger',
                payment = 50
            },
			['2'] = {
                name = 'Senior Ranger 2',
                payment = 80
            },
			['3'] = {
                name = 'Senior Ranger 1',
                payment = 90
            },
            ['4'] = {
                name = 'Corporal 2',
                payment = 100
            },
            ['5'] = {
                name = 'Corporal 1',
                payment = 105
            },
            ['6'] = {
                name = 'Trooper Ranger',
                payment = 125
            },
            ['7'] = {
                name = 'Sergeant 2',
                payment = 135
            },
			['8'] = {
                name = 'Sergeant 1',
				isboss = true,
                payment = 145
            },
            ['9'] = {
                name = 'Lieutenant',
				isboss = true,
                payment = 155
            },
        },
	},
    ['bcso'] = {
		label = 'Blaine County Sheriffs Office',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Cadet',
                payment = 30
            },
			['1'] = {
                name = 'Solo Cadet',
                payment = 50
            },
			['2'] = {
                name = 'Deputy',
                payment = 80
            },
			['3'] = {
                name = 'Senior Deputy',
                payment = 90
            },
            ['4'] = {
                name = 'Corporal',
                payment = 100
            },
            ['5'] = {
                name = 'Sergeant',
                payment = 105
            },
            ['6'] = {
                name = 'Lieutenant',
                payment = 125
            },
            ['7'] = {
                name = 'Captain',
                payment = 135
            },
			['8'] = {
                name = 'Undersheriff',
				isboss = true,
                payment = 145
            },
            ['9'] = {
                name = 'Sheriff',
				isboss = true,
                payment = 155
            },
        },
	},
    ['sdso'] = {
		label = 'Senora Desert Sheriffs Office',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Cadet',
                payment = 30
            },
			['1'] = {
                name = 'Solo Cadet',
                payment = 50
            },
			['2'] = {
                name = 'Deputy',
                payment = 80
            },
			['3'] = {
                name = 'Senior Deputy',
                payment = 90
            },
            ['4'] = {
                name = 'Corporal',
                payment = 100
            },
            ['5'] = {
                name = 'Sergeant',
                payment = 105
            },
            ['6'] = {
                name = 'Lieutenant',
                payment = 125
            },
            ['7'] = {
                name = 'Captain',
                payment = 135
            },
			['8'] = {
                name = 'Undersheriff',
				isboss = true,
                payment = 145
            },
            ['9'] = {
                name = 'Sheriff',
				isboss = true,
                payment = 155
            },
        },
	},
    ['pbso'] = {
		label = 'Paleto Bay Sheriffs Office',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Cadet',
                payment = 30
            },
			['1'] = {
                name = 'Solo Cadet',
                payment = 50
            },
			['2'] = {
                name = 'Deputy',
                payment = 80
            },
			['3'] = {
                name = 'Senior Deputy',
                payment = 90
            },
            ['4'] = {
                name = 'Corporal',
                payment = 100
            },
            ['5'] = {
                name = 'Sergeant',
                payment = 105
            },
            ['6'] = {
                name = 'Lieutenant',
                payment = 125
            },
            ['7'] = {
                name = 'Captain',
                payment = 135
            },
			['8'] = {
                name = 'Undersheriff',
				isboss = true,
                payment = 145
            },
            ['9'] = {
                name = 'Sheriff',
				isboss = true,
                payment = 155
            },
        },
	}, -- end police departments
	['ambulance'] = {
		label = 'EMS',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
			['1'] = {
                name = 'Paramedic',
                payment = 75
            },
			['2'] = {
                name = 'Doctor',
                payment = 100
            },
			['3'] = {
                name = 'Surgeon',
                payment = 115
            },
			['4'] = {
                name = 'Chief',
				isboss = true,
                payment = 135
            },
        },
	},
	['realestate'] = {
		label = 'Real Estate',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
			['1'] = {
                name = 'House Sales',
                payment = 75
            },
			['2'] = {
                name = 'Business Sales',
                payment = 90
            },
			['3'] = {
                name = 'Broker',
                payment = 105
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                payment = 125
            },
        },
	},
	['taxi'] = {
		label = 'Taxi',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit Driver',
                payment = 50
            },
			['1'] = {
                name = 'Driver',
                payment = 75
            },
			['2'] = {
                name = 'Event Driver',
                payment = 85
            },
			['3'] = {
                name = 'Executive Driver',
                payment = 105
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                payment = 115
            },
        },
	},
     ['bus'] = {
		label = 'Bus',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Driver',
                payment = 50
            },
		},
	},
	['cardealer'] = {
		label = 'Vehicle Dealer',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
			['1'] = {
                name = 'Showroom Sales',
                payment = 75
            },
			['2'] = {
                name = 'Business Sales',
                payment = 100
            },
			['3'] = {
                name = 'Finance',
                payment = 125
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                payment = 150
            },
        },
	},
	['mechanic'] = {
		label = 'Mechanic',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
			['1'] = {
                name = 'Novice',
                payment = 75
            },
			['2'] = {
                name = 'Experienced',
                payment = 100
            },
			['3'] = {
                name = 'Advanced',
                payment = 125
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                payment = 150
            },
        },
	},
	['judge'] = {
		label = 'Honorary',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Judge',
                isboss = true,
                payment = 110
            },
        },
	},
	['lawyer'] = {
		label = 'Law Firm',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Associate',
                isboss = true,
                payment = 105
            },
        },
	},
	['reporter'] = {
		label = 'LSBN News',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Journalist',
                payment = 45
            },
            ['1'] = {
                name = 'Reporter',
                payment = 55
            },
            ['2'] = {
                name = 'News Anchor',
                payment = 65
            },
            ['3'] = {
                name = 'Ron Burgundy',
                isboss = true,
                payment = 95
            },
        },
	},
	['trucker'] = {
		label = 'Trucker',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Driver',
                payment = 40
            },
        },
	},
	['tow'] = {
		label = 'Towing',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Driver',
                payment = 50
            },
        },
	},
	['garbage'] = {
		label = 'Garbage',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Collector',
                payment = 50
            },
        },
	},
	['vineyard'] = {
		label = 'Vineyard',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Picker',
                payment = 50
            },
        },
	},
	['hotdog'] = {
		label = 'Hotdog',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Sales',
                payment = 50
            },
        },
	},
-- CUSTOM ADDED JOBS
['tuner'] = {
    label = '6STR Tuner Shop',
    defaultDuty = true,
    offDutyPay = false,
    grades = {
        ['0'] = {
            name = 'Recruit',
            payment = 50
        },
        ['1'] = {
            name = 'Mechanic',
            payment = 75
        },
        ['2'] = {
            name = 'Vehicle Sales',
            payment = 100
        },
        ['3'] = {
            name = 'Manager',
            isboss = true,
            payment = 125
        },
        ['4'] = {
            name = 'CEO',
            isboss = true,
            payment = 150
        },
    },
},
['hayesauto'] = {
    label = 'Hayes Auto',
    defaultDuty = true,
    offDutyPay = false,
    grades = {
        ['0'] = {
            name = 'Apprentice',
            payment = 50
        },
        ['1'] = {
            name = 'Mechanic',
            payment = 75
        },
        ['2'] = {
            name = 'Assistant Manager',
            payment = 100
        },
        ['3'] = {
            name = 'Boss',
            isboss = true,
            payment = 125
        },
        ['4'] = {
            name = 'CEO',
            isboss = true,
            payment = 135
        },
    },
},
}