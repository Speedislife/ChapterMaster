function macros() {
#macro GM_build_date 41914.3660453472
#macro GM_version "1.0.0.4"


	enum CHAPTER_LUCK 
		{
			BAD = -1,
			NEUTRAL = 0,
			GOOD = 1
		}
	
	enum GOD_MISSION{
		artifact
	}

	#macro MAX_STC_PER_SUBCATEGORY 6

	enum INQUISITION_MISSION {
		purge,
		inquisitor,
		spyrer,
		artifact,
		tomb_world,
		tyranid_organism,
		ethereal

	}
	enum MECHANICUS_MISSION {
		bionics,
		land_raider,
		mars_voyage,
		necron_study
	}
	enum EVENT 
	{
		//good
		space_hulk,
		promotion,
		strange_building,
		sororitas,
		rogue_trader,
		inquisition_mission,
		inquisition_planet,
		mechanicus_mission,

		//neutral
		strange_behavior,
		fleet_delay,
		harlequins,
		succession_war,
		random_fun,

		//bad
		warp_storms,
		enemy_forces,
		crusade,
		enemy,
		mutation,
		ship_lost,
		chaos_invasion,
		necron_awaken,
		fallen,


		none
	}
}
