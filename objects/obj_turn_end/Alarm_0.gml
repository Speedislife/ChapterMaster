
// show_message("biiiiiIIIng");

instance_activate_object(obj_star);
combating=0;

var i;

/*repeat(10){
    i=0;
    repeat(20){
        i+=1;
        if (battle[i]=1) and (battle[i+1]=1) and (battle_world[i]<5) and (battle_world[i+1]=-50){
            battle[999]=battle[i];battle_location[999]=battle[i];battle_world[999]=battle_world[i];
            battle_opponent[999]=battle_opponent[i];battle_object[999]=battle_object[i];battle_pobject[999]=battle_pobject[i];// Store current
            
            battle[i]=battle[i+1];battle_location[i]=battle[i+1];battle_world[i]=battle_world[i+1];
            battle_opponent[i]=battle_opponent[i+1];battle_object[i]=battle_object[i+1];battle_pobject[i]=battle_pobject[i+1];// Current = Current +1
            
            battle[i+1]=battle[999];battle_location[i+1]=battle[999];battle_world[i+1]=battle_world[999];
            battle_opponent[i+1]=battle_opponent[999];battle_object[i+1]=battle_object[999];battle_pobject[i+1]=battle_pobject[999];// Current +1 = Stored
        }
    }
}*/

i=50;
repeat(50){
    i-=1;
    
    if (battles<=i) and (i>=2){
        if (battle[i]!=0) and (battle[i-1]!=0) and (battle_world[i]=-50) and (battle_world[i-1]>0){
            var tem1 = battle[i-1];
            var tem2 = battle_location[i-1];
            var tem3 = battle_world[i-1];
            var tem4 = battle_opponent[i-1];
            var tem5 = battle_object[i-1];
            var tem6 = battle_pobject[i-1];
            var tem7 = battle_special[i-1];
            
            battle[i-1]=battle[i];
            battle_location[i-1]=battle_location[i];
            battle_world[i-1]=battle_world[i];
            battle_opponent[i-1]=battle_opponent[i];
            // battle_object[i-1]=battle_object[i];
            battle_pobject[i-1]=battle_pobject[i];
            battle_special[i-1]=battle_special[i];
            
            battle[i]=tem1;
            battle_location[i]=tem2;
            battle_world[i]=tem3;
            battle_opponent[i]=tem4;
            battle_object[i]=tem5;
            battle_pobject[i]=tem6;
            battle_special[i]=tem7;
        }
    }
}



// Probably want something right here to organize the battle just in case
// Space battles first
// Ground battles after




if (battles>0) and (current_battle<=battles){
    var ii, xx, yy, good;
    ii=0;good=0;
    
    with(obj_star){if (name=obj_turn_end.battle_location[obj_turn_end.current_battle]) then instance_create(x,y,obj_temp3);}
    
    if (instance_exists(obj_temp3)){
        ii=instance_nearest(obj_temp3.x,obj_temp3.y,obj_star);
        if (instance_exists(ii)){
            if (ii.name=battle_location[current_battle]) then good=1;
            // ii.present_fleets-=1;
        }
    }
    with(obj_temp3){instance_destroy();}
    
    /*repeat(200){
        if (good=0){
            xx=random(room_width);
            yy=random(room_height);
            ii=instance_nearest(xx,yy,obj_star);
            
            if (instance_exists(ii)){if (ii.name=battle_location[current_battle]) then good=1;}
            if (instance_exists(ii)){if (ii.name!=battle_location[current_battle]){good=0;instance_deactivate_object(ii);}}
            ii.present_fleets-=1;
        }
    }*/
    
    if (good=1){// trying to find the star
        instance_activate_object(obj_star);
        obj_controller.x=ii.x;obj_controller.y=ii.y;show=current_battle;
        
        if (battle_world[current_battle]=-50){
            strin[1]=string(round(battle_pobject[current_battle].capital_number));
            strin[2]=string(round(battle_pobject[current_battle].frigate_number));
            strin[3]=string(round(battle_pobject[current_battle].escort_number));
            // pull health values here
            strin[4]=string(round(battle_pobject[current_battle].capital_health));
            strin[5]=string(round(battle_pobject[current_battle].frigate_health));
            strin[6]=string(round(battle_pobject[current_battle].escort_health));
            
            // pull enemy ships here
            
            var e;e=1;
            repeat(10){e+=1;if (e=11) then e=13;
                if (ii.present_fleet[e]>0){
                    obj_controller.temp[1070]=ii.id;
                    obj_controller.temp[1071]=e;
                    obj_controller.temp[1072]=0;
                    obj_controller.temp[1073]=0;
                    obj_controller.temp[1074]=0;
                    
                    with(obj_en_fleet){
                        if (orbiting=obj_controller.temp[1070]) and (owner=obj_controller.temp[1071]){
                            obj_controller.temp[1072]+=round(capital_number);
                            obj_controller.temp[1073]+=round(frigate_number);
                            obj_controller.temp[1074]+=round(escort_number);
                        }
                    }                   

					var l1 = 0;
					var l2 = 0;
                    if (obj_controller.faction_status[e]!="War"){
                        repeat(10){l1+=1;if (allied_fleet[l1]=0) and (l2=0) then l2=l1;}
                        allied_fleet[l2]=e;
                        acap[l2]=obj_controller.temp[1072];
                        afri[l2]=obj_controller.temp[1073];
                        aesc[l2]=obj_controller.temp[1074];
                    }
                    if (obj_controller.faction_status[e]="War") or (e=9) or (e=13){
                        repeat(10){l1+=1;if (enemy_fleet[l1]=0) and (l2=0) then l2=l1;}
                        enemy_fleet[l2]=e;
                        ecap[l2]=obj_controller.temp[1072];
                        efri[l2]=obj_controller.temp[1073];
                        eesc[l2]=obj_controller.temp[1074];
                    }
                }
            }
            
        }
        
        if (battle_world[current_battle]>=1){
            scr_count_forces(string(battle_location[current_battle]),battle_world[current_battle],true);
            
            strin[1]=info_mahreens;
            strin[2]=info_vehicles;
            
            if (info_mahreens+info_vehicles=0){
                if (battles>current_battle) then alarm[4]=1;
                if (battles=current_battle) then alarm[1]=1;
            }
            
            strin[3]="";
            
            var tempy;tempy=0;
            tempy=battle_object[current_battle].p_owner[battle_world[current_battle]];
            
            if (tempy=1) or (tempy=2) or (tempy=3){
                if (battle_object[current_battle].p_fortified[battle_world[current_battle]]=1) then strin[3]="Minimally";
                if (battle_object[current_battle].p_fortified[battle_world[current_battle]]=2) then strin[3]="Lightly";
                if (battle_object[current_battle].p_fortified[battle_world[current_battle]]=3) then strin[3]="Moderately";
                if (battle_object[current_battle].p_fortified[battle_world[current_battle]]=4) then strin[3]="Highly";
                if (battle_object[current_battle].p_fortified[battle_world[current_battle]]=5) then strin[3]="Extremely";
                if (battle_object[current_battle].p_fortified[battle_world[current_battle]]=6) then strin[3]="Maximally";
            }
            
            tempy=0;
            if (battle_opponent[current_battle]=7) then tempy=battle_object[current_battle].p_orks[battle_world[current_battle]];
            if (battle_opponent[current_battle]=8) then tempy=battle_object[current_battle].p_tau[battle_world[current_battle]];
            if (battle_opponent[current_battle]=9) then tempy=battle_object[current_battle].p_tyranids[battle_world[current_battle]];
            if (battle_opponent[current_battle]=10) then tempy=battle_object[current_battle].p_traitors[battle_world[current_battle]];
            if (battle_opponent[current_battle]=13) then tempy=battle_object[current_battle].p_necrons[battle_world[current_battle]];
            
            if (tempy=1) then strin[4]="Minimal Forces";
            if (tempy=2) then strin[4]="Sparse Forces";
            if (tempy=3) then strin[4]="Moderate Forces";
            if (tempy=4) then strin[4]="Numerous Forces";
            if (tempy=5) then strin[4]="Very Numerous";
            if (tempy=6) then strin[4]="Overwhelming";
            
            // if (battle_opponent[current_battle]=2) then obj_controller.alarm[7]=1;
            obj_controller.cooldown=9999;
        }
        
        if (obj_controller.zoomed=1) then with(obj_controller){scr_zoom();}
    }
    instance_activate_object(obj_star);
    
}

instance_activate_object(obj_star);




if (battle[1]=0) or (current_battle>battles){//                         This is temporary for the sake of testing
    if (battle[1]=0){obj_controller.x=first_x;obj_controller.y=first_y;}
    alarm[1]=1;
}

/* */
/*  */
