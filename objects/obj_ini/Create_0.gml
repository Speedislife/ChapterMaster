//Sector setup
sector_name = ""

// Chapter Setup
use_custom_icon = 0;
icon = 0;
icon_name = "";

specials = 0;
firsts = 0;
seconds = 0;
thirds = 0;
fourths = 0;
fifths = 0;
sixths = 0;
sevenths = 0;
eighths = 0;
ninths = 0;
tenths = 0;
commands = 0;

heh1=0;heh2=0;


strin = "";
strin2 = "";
tolerant = 0;
companies = 10;
squads = [];
progenitor = 0;
stability = 0;
purity = 0;

home_name = "";
home_type = "";
recruiting_name = "";
recruiting_type = "";
chapter_name = "";
flagship_name = "";
psy_powers = "";
battle_cry = "";
skin_color = 0;


//chapter leadership
master_name = "";
chief_librarian_name = "";
high_chaplain_name = "";
high_apothecary_name = "";
forge_master_name = "";
lord_admiral_name = "";

// geenseed mutations 
preomnor = 0;
voice = 0;
doomed = 0;
lyman = 0;
omophagea = 0;
ossmodula = 0;
membrane = 0;
zygote = 0;
betchers = 0;
catalepsean = 0;
secretions = 0;
occulobe = 0;
mucranoid = 0;

adv = [""];
dis = [""];

// enemys killed by chapter master
master_autarch = 0;
master_avatar = 0;
master_farseer = 0;
master_aspect = 0;
master_eldar = 0;
master_eldar_vehicles = 0;
master_tau = 0;
master_battlesuits = 0;
master_kroot = 0;
master_tau_vehicles = 0;
master_ork_boyz = 0;
master_ork_nobz = 0;
master_ork_warboss = 0;
master_ork_vehicles = 0;
master_heretics = 0;
master_chaos_marines = 0;
master_lesser_demons = 0;
master_greater_demons = 0;
master_chaos_vehicles = 0;
master_gaunts = 0;
master_warriors = 0;
master_carnifex = 0;
master_synapse = 0;
master_tyrant = 0;
master_gene = 0;
master_necron_overlord = 0;
master_destroyer = 0;
master_necron = 0;
master_wraith = 0;
master_necron_vehicles = 0;
master_monolith = 0;
master_special_killed = 0;

load_to_ships = [2, 0, 0];
if (instance_exists(obj_creation)){load_to_ships=obj_creation.load_to_ships;}

penitent = 0;
penitent_max = 0;
penitent_current = 0;
penitent_end = 0;
man_size = 0;

// Equipment- maybe the bikes should go here or something?          yes they should
i=-1;
repeat(200){i+=1;
    equipment[i]="";
    equipment_type[i]="";
    equipment_number[i]=0;
    equipment_condition[i]=100;
    equipment_quality[i]=[];
    artifact[i]="";
    artifact_tags[i]=[];
    artifact_identified[i]=0;
    artifact_condition[i]=100;
    artifact_quality[i]=[];
    other_artifact_data = {};
    artifact_loc[i]="";
    artifact_sid[i]=0;// Over 500 : ship
    // Weapon           Unidentified            
}

var i=-1,v=0;
repeat(210){i+=1;
    ship[i]="";
    ship_uid[i]=0;
    ship_owner[i]=0;
    ship_class[i]="";
    ship_size[i]=0;
    ship_uid[i]=0;
    ship_leadership[i]=0;
    ship_hp[i]=0;
    ship_maxhp[i]=0;
    ship_location[i]="";
    ship_shields[i]=0;
    ship_conditions[i]="";
    ship_speed[i]=0;
    ship_turning[i]=0;
    ship_front_armour[i]=0;
    ship_other_armour[i]=0;
    ship_weapons[i]=0;
    ship_shields[i]=0;
    for (var s=0;s<6;s++){
         ship_wep[i,s]="";
         ship_wep_facing[i,s]="";
         ship_wep_condition[i,s]="";
    }
    ship_capacity[i]=0;ship_carrying[i]=0;ship_contents[i]="";ship_turrets[i]=0;
}

repeat(210)
	{
		i += 1;
	    ship[i] = "";
		ship_uid[i] = 0;
		ship_owner[i] = 0;
		ship_class[i] = "";
		ship_size[i] = 0;
		ship_uid[i] = 0;
	    ship_leadership[i] = 0;
		ship_hp[i] = 0;
		ship_maxhp[i] = 0;
		ship_location[i] = "";
		ship_shields[i] = 0;
	    ship_conditions[i] = "";
		ship_speed[i] = 0;
		ship_turning[i] = 0;
	    ship_front_armour[i] = 0;
		ship_other_armour[i] = 0;
		ship_weapons[i] = 0;
		ship_shields[i] = 0;
	    ship_wep[i,0] = "";
		ship_wep_facing[i,0] = "";
		ship_wep_condition[i,0] = "";
	    ship_wep[i,1] = "";
		ship_wep_facing[i,1] = "";
		ship_wep_condition[i,1] = "";
	    ship_wep[i,2] = "";
		ship_wep_facing[i,2] = "";
		ship_wep_condition[i,2] = "";
	    ship_wep[i,3] = "";
		ship_wep_facing[i,3] = "";
		ship_wep_condition[i,3] = "";
	    ship_wep[i,4] = "";
		ship_wep_facing[i,4] = "";
		ship_wep_condition[i,4] =" ";
	    ship_wep[i,5] = "";
		ship_wep_facing[i,5] = "";
		ship_wep_condition[i,5] = "";
	    ship_capacity[i] = 0;
		ship_carrying[i] = 0;
		ship_contents[i] = "";
		ship_turrets[i] = 0;
	}

var company=-1;
repeat(11)
{
    company += 1;
	v = -1;// show_message("v company: "+string(company));
    repeat(205)
		{
			v += 1;// show_message(string(company)+"."+string(v));
	        veh_race[company, v] = 0;
			veh_loc[company, v] = "";
			veh_name[company, v] = "";
			veh_role[company, v] = "";
			veh_wep1[company, v] = "";
			veh_wep2[company, v] = "";
			veh_wep3[company, v] = "";
	        veh_upgrade[company, v] = "";
			veh_acc[company, v] = "";
			veh_hp[company, v] = 100;
			veh_chaos[company, v] = 0;
			veh_pilots[company, v] = 0;
			veh_lid[company, i] = 0;
			veh_wid[company, v] = 2;
	        veh_uid[company, v] = 0;
	    }
}

v=0;company=0;

/*if (obj_creation.fleet_type=3){
    obj_controller.penitent=1;
    obj_controller.penitent_max=(obj_creation.maximum_size*1000)+300;
    if (obj_creation.chapter_name="Lamenters") then obj_controller.penitent_max=100300;
    obj_controller.penitent_current=300;
}*/

check_number=0;
year_fraction=0;
year=0;
millenium=0;
company_spawn_buffs = [];
role_spawn_buffs ={};

/* if (global.load=0){
    if (obj_creation.custom>0) then scr_initialize_custom();
    if (obj_creation.custom=0) then scr_initialize_standard();
}*/

if (instance_exists(obj_creation)) then custom=obj_creation.custom;

if (global.load=0) then scr_initialize_custom();




// 135;
// with(obj_creation){instance_destroy();}

/* */
/*  */
