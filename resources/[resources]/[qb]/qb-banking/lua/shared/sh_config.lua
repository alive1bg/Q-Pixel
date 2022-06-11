SimpleBanking = SimpleBanking or {} 
SimpleBanking.Config = SimpleBanking.Config or {}


SimpleBanking.Config["Days_Transaction_History"] = 7 -- How many days should the transaction history go back in the bank?

SimpleBanking.Config["business_ranks"] = { -- what ranks can see the management_funds accounts in the menu, and deposit/withdraw/transfer from them?
    ['mayor'] = true,
    ['Manager'] = true,
    ['owner'] = true,
    ['chief'] = true,
    ['director'] = true,
    ['ceo'] = true,
}

SimpleBanking.Config["business_ranks_overrides"] = {
    ['mayor'] = {
        ['mayor'] = true,
    }, 
    ['police'] = {
        ['chief of police'] = true,
        ['assistant chief of police'] = true,
        ['captain'] = true,
    },
    ['sasp'] = {
        ['chief of sasp'] = true,
        ['assistant chief'] = true,
    },
    ['saspr'] = {
        ['lieutenant'] = true,
        ['sergeant 1'] = true,
    },
    ['bcso'] = {
        ['sheriff'] = true,
        ['undersheriff'] = true,
    },
    ['sdso'] = {
        ['sheriff'] = true,
        ['undersheriff'] = true,
    },
    ['pbso'] = {
        ['sheriff'] = true,
        ['undersheriff'] = true,
    },
    ['ambulance'] = {
        ['chief'] = true,
    },
    ['realestate'] = {
        ['manager'] = true,
    },
    ['taxi'] = {
        ['manager'] = true,
    },
    ['cardealer'] = {
        ['manager'] = true,
        ['finance'] = true,
    },
    ['mechanic'] = {
        ['advanced'] = true,
        ['manager'] = true,
    },
    ['judge'] = {
        ['judge'] = true,
    },
    ['lawyer'] = {
        ['associate'] = true,
    },
    ['reporter'] = {
        ['ron burgundy'] = true,
    },
    ['tuner'] = {
        ['ceo'] = true,
        ['manager'] = true,
        ['vehicle sales'] = true,
    },
    ['hayesauto'] = {
        ['ceo'] = true,
        ['boss'] = true,
    },
    ['uwu'] = {
        ['owner'] = true,
        ['manager'] = true,
    },
    ['gallery'] = {
        ['owner'] = true,
    },
    ['cardshop'] = {
        ['shop owner'] = true,
        ['assistant manager'] = true,
    },
    ['casino'] = {
        ['casino owner'] = true,
        ['manager'] = true,
    },
    ['cerberus'] = {
        ['boss'] = true,
    }, 
    ['burgershot'] = {
        ['senior manager'] = true,
        ['assistant manager'] = true,
    },
    ['maldinis'] = {
        ['manager'] = true,
        ['true cook'] = true,
    },
}

SimpleBanking.Config["gang_ranks"] = {
    ['boss'] = true,

}

SimpleBanking.Config["gang_ranks_overrides"] = {
    ['lostmc'] = {
        ['boss'] = true,
    },
    ['roguetoamc'] = {
        ['national president'] = true,
        ['president'] = true,
        ['vice president'] = true,
        ['sgt at arms'] = true,
    },
    ['cg'] = {
        ['og'] = true,
    },
    ['ballas'] = {
        ['boss'] = true,
        ['shot caller'] = true,
    },
    ['vagos'] = {
        ['boss'] = true,
        ['shot caller'] = true,
    },
    ['cartel'] = {
        ['boss'] = true,
        ['shot caller'] = true,
    },
    ['families'] = {
        ['boss'] = true,
        ['shot caller'] = true,
    },
    ['triads'] = {
        ['boss'] = true,
        ['shot caller'] = true,
    },
}
