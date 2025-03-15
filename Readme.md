<div align="center">
    <img width="100%" height = "100px" src="https://github.com/gjayz099/gjayz099/blob/main/img/pic.jpg" alt="cover" />
</div>


## Dependencies:
- [GNotify](https://github.com/Gjayz/GNotify) --- Notify
- [ox_target](https://github.com/overextended/ox_target/releases) --- Target Function
- [ox_lib](https://github.com/overextended/ox_lib/releases) --- Bar ui and Menu ui
- [ox_inventory](https://github.com/overextended/ox_inventory/releases) --- Inventory
- [PolyZone](https://github.com/mkafrin/PolyZone/releases) --- Zone  Function
- [ox_core](https://github.com/overextended/ox_core/releases) --- ox_Core
- [esx_core](https://github.com/esx-framework/esx_core/releases) --- esx_Core





## Put This ox_inventory/data/item.lua
--------------------------------------Side Job ------------------------------------------------

	['apple'] = {
		label = 'Apple',
		weight = 50,
		client = {
			status = { hunger = 2000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	},
	['orange'] = {
		label = 'Orange',
		weight = 50,
		client = {
			status = { hunger = 2000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	},
	['gauva'] = {
		label = 'Gauva',
		weight = 50,
		client = {
			status = { hunger = 2000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	},
	['mango'] = {
		label = 'Mango',
		weight = 50,
		client = {
			status = { hunger = 2000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
		},
	},
	['tomato'] = {
		label = 'Tomato',
		weight = 50,
	},
	['lumber'] = {
		label = 'Lumber',
		weight = 2000,
	},
	['woodplank'] = {
		label = 'Woodplank',
		weight = 700,
	},
	['treebark'] = {
		label = 'Treebark',
		weight = 700,
	},
	['yellowfin'] = {
		label = 'Yellowfin',
		weight = 1700,
	},
	['salmon'] = {
		label = 'Salmon',
		weight = 1700,
	},
	['pigfish'] = {
		label = 'Pigfish',
		weight = 1700,
	},	
	['stripedbass'] = {
		label = 'Stripedbass',
		weight = 1700,
	},
	['stone'] = {
		label = 'Stone',
		weight = 900,
	},
	['washstone'] = {
		label = 'WashStone',
		weight = 200,
	},
	['copper'] = {
		label = 'Copper',
		weight = 200,
	},
	['steel'] = {
		label = 'Steel',
		weight = 200,
	},
	['iron'] = {
		label = 'Iron',
		weight = 200,
	},
	['emerald'] = {
		label = 'Emerald',
		weight = 200,
	},
	['diamond'] = {
		label = 'Diamond',
		weight = 200,
	},
	['axe'] = {
		label = 'Axe',
		weight = 1060,

	},
	['fishingrod'] = {
		label = 'Fishingrod',
		weight = 2060,

	},
	['fishbait'] = {
		label = 'Fishingrod',
		weight = 260,

	},

	['pickaxe'] = {
		label = 'Pickaxe',
		weight = 1060,

	},

	['shortknife'] = {
		label = 'Short Knife',
		weight = 460,
	},
	['axe'] = {
		label = 'Axe',
		weight = 860,
	},

## Put This /ox_inventory/data/shop.lua
    SideJobShop = {
        name = 'SideJob Shop',
        blip = {
            id = 256, colour =39, scale = 0.8
        }, inventory = {
            { name = 'shortknife', price = 1550 },
            { name = 'axe', price = 2000 },
            { name = 'fishingrod', price = 1900 },
            { name = 'fishbait', price = 500 },
            { name = 'pickaxe', price = 1900 },
        }, locations = {
            vec3(2746.10, 3463.50, 55.70)
        }, targets = {
            { loc = vec3(2746.10, 3463.50, 55.70), length = 0.6, width = 3.0, heading = 65.0, minZ = 55.0, maxZ = 56.8, distance = 3.0 }
        }
    },

## Put image /ox_inventory/web/images
