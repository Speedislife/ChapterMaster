function scr_shoot(weapon_count, target_object, target_type, damage_data, melee_or_ranged) {

	// weapon_count: Weapon number
	// target_object: Target object
	// target_type: Target dudes
	// damage_data: "att" or "arp" or "highest"
	// melee_or_ranged: melee or ranged

	// This massive clusterfuck of a script uses the newly determined weapon and target data to attack and assign damage




	var j;j=0;
	repeat(100){j+=1;
	    obj_ncombat.dead_ene[j]="";
	    obj_ncombat.dead_ene_n[j]=0;
	}obj_ncombat.dead_enemies=0;



	if (obj_ncombat.wall_destroyed=1) then exit;

	// target_object.hostile_men=0;

	if (weapon_count>0) and (instance_exists(target_object)) and (owner=eFACTION.Imperium){
	    var shots_fired,stop,damage_type,doom;
	    shots_fired=wep_num[weapon_count];
	    doom=0;
    	if (shots_fired!=1)and (melee_or_ranged!="melee"){
    		switch (obj_ncombat.enemy){
    			case eFACTION.Ecclesiarchy:
    			 doom=0.3;
    			 break;
     			case eFACTION.Eldar:
    			 doom=0.4;
    			 break;
     			case eFACTION.Ork:
    			 doom=0.2;
    			 break;
    			case eFACTION.Tau:
    			 doom=0.4;
    			 break;
    			case eFACTION.Tyranids:
    			 doom=0.4;
    			 break;    			     			    			    			 
    		}
    	}
	    if (obj_ncombat.enemy=11){
	    	att[weapon_count]=round(att[weapon_count]*1.15);
	    	apa[weapon_count]=round(apa[weapon_count]*1.15);
	    }
	    if (obj_ncombat.enemy=10) and (obj_ncombat.threat=7) then doom=1;
    
	    damage_type="";
	    stop=0;targeh=target_type;
    
	    if (shots_fired=0) then exit;
	    if (ammo[weapon_count]=0){
	    	stop=1;
	    	exit;
	    }
	    if (ammo[weapon_count]>0) then ammo[weapon_count]-=1;
    
    
    
    
	    if (damage_data!="medi") then damage_type=damage_data;
	    if (damage_data="medi"){
	        damage_type="att";
	        if (att[weapon_count]<apa[weapon_count]) then damage_type="arp";
	    }
	    if (wep[weapon_count]="Web Spinner") then damage_type="status";
    
    
    
    
    
	    if (damage_type="status") and (stop=0) and (shots_fired>0){
	        var a,b;a=0;b=shots_fired;
	        if (splash[weapon_count]=1) and (melee_or_ranged!="wall"){shots_fired=shots_fired*3;}
	        if (b>0) and (melee_or_ranged!="wall") and (instance_exists(target_object)){
	            target_object.hostile_shots=b;
	            if (wep_owner[weapon_count]="assorted") then target_object.hostile_shooters=999;
	            if (wep_owner[weapon_count]!="assorted") then target_object.hostile_shooters=1;
	            target_object.hostile_damage=0;
	            target_object.hostile_weapon=wep[weapon_count];
	            target_object.hostile_men=1;
	            // target_object.hostile_men=0;
	            target_object.hostile_range=range[weapon_count];
	            target_object.hostile_splash=splash[weapon_count];
	            with(target_object){scr_clean(999);}
	        }
	    }
	    if (damage_type="att") and (att[weapon_count]>0) and (stop=0) and (shots_fired>0){
	        var a,b;
	        a=att[weapon_count];
	        if (melee_or_ranged="melee"){
	            if (shots_fired>(target_object.men-target_object.dreads)*2){
	                doom=((target_object.men-target_object.dreads)*2)/shots_fired;
	            }
	        }
	        b=shots_fired;
        
	        if (doom!=0) and (shots_fired>1){
	        	a=floor((doom*a));
	        	b=floor(b*doom);
	        }
	        if (splash[weapon_count]=1) and (melee_or_ranged!="wall"){shots_fired=shots_fired*3;}
        
	        if (b>0) and (melee_or_ranged!="wall") and (instance_exists(target_object)){
	            target_object.hostile_shots=b;
	            if (wep_owner[weapon_count]="assorted") then target_object.hostile_shooters=999;
	            if (wep_owner[weapon_count]!="assorted") then target_object.hostile_shooters=1;
	            target_object.hostile_damage=a/b;
	            target_object.hostile_weapon=wep[weapon_count];
	            // target_object.hostile_men=0;
	            target_object.hostile_men=1;
	            target_object.hostile_range=range[weapon_count];
	            target_object.hostile_splash=splash[weapon_count];
	            if (target_object.hostile_splash=1) then target_object.hostile_damage+=10;
            
	            with(target_object){scr_clean(999);}
	        }
	    }
    
	    if ((damage_type="arp") or (damage_type="dread")) and (apa[weapon_count]>0) and (stop=0) and (shots_fired>0){
	        var a,b;
	        a=att[weapon_count];
	        if (att[weapon_count]=0) then a=shots_fired;
        
	        if (melee_or_ranged="melee"){
	            if (shots_fired>((target_object.veh+target_object.dreads)*5)){
	                doom=((target_object.veh+target_object.dreads)*5)/shots_fired;
	            }
	        }
	        b=shots_fired;
        
	        if (doom!=0) and (shots_fired>1){a=floor((doom*a));b=floor(b*doom);}
	        if (splash[weapon_count]=1) and (melee_or_ranged!="wall"){shots_fired=shots_fired*3;}
        
        
	        if (a=0) then a=shots_fired*doom;
        
	        if (b>0) and (melee_or_ranged!="wall") and (instance_exists(target_object)){
	            target_object.hostile_shots=b;
	            if (wep_owner[weapon_count]="assorted") then target_object.hostile_shooters=999;
	            if (wep_owner[weapon_count]!="assorted") then target_object.hostile_shooters=1;
	            target_object.hostile_damage=a/b;
	            target_object.hostile_weapon=wep[weapon_count];
            
	            // 135; this might be the problem right here
	            // this is the problem right here
	            target_object.hostile_men=0;
	            // if (damage_type="dread") then target_object.hostile_men=1;
            
	            target_object.hostile_range=range[weapon_count];
	            target_object.hostile_splash=splash[weapon_count];
	            if (target_object.hostile_splash=1) then target_object.hostile_damage+=10;
            
            
	            with(target_object){scr_clean(999);}
	        }
        
        
	        if (b>0) and (melee_or_ranged="wall") and (instance_exists(target_object)){
	            var dam2,totes_dam,dest;
	            dest=0;dam2=(a/b)-target_object.ac[1];
	            if (dam2<0) then dam2=0;totes_dam=round(dam2)*b;
	            target_object.hp[1]-=dam2;
	            target_object.hostile_shots=b;
	            target_object.hostile_weapon=wep[weapon_count];
	            target_object.hostile_range=range[weapon_count];
	            target_object.hostile_damage=dam2;
            
	            if (target_object.hp[1]<=0) then dest=1;
	            scr_flavor2(dest,"wall");
	        }
        
	    }
	}


	if (instance_exists(target_object)) and (owner  = eFACTION.Player){
	    var shots_fired,stop,damage_type;
    
	    if (weapon_count>0){shots_fired=wep_num[weapon_count];}
	    if (shots_fired=0) then exit;
	    /*if (weapon_count<-40){
	        if (weapon_count=-53){
	            if (player_silos>30) then shots_fired=30;
	            if (player_silos<30) then shots_fired=player_silos;
	        }
	        if (weapon_count=-51) or (weapon_count=-52){
	            shots_fired=round(player_silos/2);
	        }
	    }*/
    
	    damage_type="";stop=0;targeh=target_type;
    
    
	    repeat(10){if (target_object.dudes_hp[targeh]=0) then targeh+=1;}
	    if (target_object.dudes_hp[targeh]=0) then stop=1;
    
    
	    if (weapon_count>0){
	        if (ammo[weapon_count]=0) then stop=1;
	        if (ammo[weapon_count]>0) then ammo[weapon_count]-=1;
	    }
	    if (wep[weapon_count]="Missile Silo") then obj_ncombat.player_silos-=min(obj_ncombat.player_silos,30);

    
	    if (damage_data!="highest") then damage_type=damage_data;
	    if (damage_data="highest") and (weapon_count>0){
	        damage_type="att";if (att[weapon_count]>=100) and (apa[weapon_count]>0) then damage_type="arp";
	    }
	    if (damage_data="highest"){
	    	if (weapon_count=-51||weapon_count=-52||weapon_count=-53)then damage_type="att";
	    }
    
	    if (weapon_count>0) or (weapon_count<-40){// Normal shooting
	        var overkill=0,damage_remaining=0,shots_remaining=0;
	        overkill=0;damage_remaining=0;shots_remaining=0;
        
        
	        var that_works;that_works=false;
        
	        if (weapon_count>0){
	        	if (att[weapon_count]>0) and (stop=0) then that_works=true;
	        }
	        if (weapon_count<-40) and (stop=0) then that_works=true;
        
	        if (that_works=true){
	            var a,b,c,eac,ap,spla,wii;
	            a=0;b=0;c=0;eac=0;ap=0;spla=0;wii="";
            
	            if (weapon_count>0){
	                a=(att[weapon_count]/wep_num[weapon_count])*target_object.dudes_dr[targeh];
	                ap=apa[weapon_count];
	                spla=splash[weapon_count];
	            }// Average damage
	            if (weapon_count<-40){
	                wii="";spla=1;
                
	                if (weapon_count=-51){
	                	wii="Heavy Bolter Emplacement";
	                	at=160;
	                	ap=0;
	                }
	                if (weapon_count=-52){
	                	wii="Missile Launcher Emplacement";
	                	at=200;
	                	ap=1;
	                }
	                if (weapon_count=-53){wii="Missile Silo";at=250;ar=0;}
	            }
            
	            eac=target_object.dudes_ac[targeh];
	            if (target_object.dudes_vehicle[targeh]=0){
	                if (ap=1) then eac=0;
	                if (ap=-1) then eac=eac*6;
	            }
	            if (target_object.dudes_vehicle[targeh]=1){
	                if (ap=0) then eac=eac*6;
	                if (ap=-1) then eac=a;
	            }
	            b=a-eac;if (b<=0) then b=0;// Average after armour
            
	            c=b*shots_fired;// New damage
            
	            var casualties,ponies,onceh;onceh=0;ponies=0;
	            if (spla=0) then casualties=min(floor(c/target_object.dudes_hp[targeh]),shots_fired);
	            if (spla!=0) then casualties=floor(c/target_object.dudes_hp[targeh]);
            
	            ponies=target_object.dudes_num[targeh];
	            if (target_object.dudes_num[targeh]=1) and ((target_object.dudes_hp[targeh]-c)<=0){casualties=1;}
            
            
            
            
            
	            if (target_object.dudes_num[targeh]-casualties<0){
	                overkill=casualties-target_object.dudes_num[targeh];
	                damage_remaining=c-(overkill*target_object.dudes_hp[targeh]);
                
	                var proportional_shots;
	                proportional_shots=round(damage_remaining/a);
	                shots_remaining=proportional_shots;
                
	                // show_message("killed "+string(casualties)+"x "+string(target_object.dudes[targeh]));
	                // show_message("did "+string(c)+" damage with "+string(shots_fired)+" shots fired, have "+string(damage_remaining)+" damage remaining (about "+string(shots_remaining)+" shots)");
	            }
            
            
            
            
            
	            if (target_object.dudes_num[targeh]-casualties<0) then casualties=ponies;
	            if (casualties<0) then casualties=0;
            
            
	            if (casualties>=1){
	                var iii,found,openz;
	                iii=0;found=0;openz=0;
	                repeat(40){iii+=1;
	                    if (found=0){
	                        if (obj_ncombat.dead_ene[iii]="") and (openz=0) then openz=iii;
	                        if (obj_ncombat.dead_ene[iii]=target_object.dudes[targeh]) and (found=0){
	                            found=iii;obj_ncombat.dead_ene_n[obj_ncombat.dead_enemies]+=casualties;
	                        }
	                    }
	                }
	                if (found=0){
	                    obj_ncombat.dead_enemies+=1;
	                    obj_ncombat.dead_ene[openz]=string(target_object.dudes[targeh]);
	                    obj_ncombat.dead_ene_n[openz]=casualties;
	                }
                
	                // if (casualties=1) then obj_ncombat.dead_ene[obj_ncombat.dead_enemies]="1 "+string(target_object.dudes[targeh]);
	                // if (casualties>1) then obj_ncombat.dead_ene[obj_ncombat.dead_enemies]=string(casualties)+" "+string(target_object.dudes[targeh]);
	            }
            
            
	            var k;k=0;
	            if (damage_remaining>0) and (shots_remaining>0) then repeat(10){
	                if (damage_remaining>0) and (shots_remaining>0){
	                    var godd;godd=0;
	                    k=targeh;
                    
	                    // Find similar target in this same group
	                    repeat(10){k+=1;
	                        if (godd=0){
	                            if (target_object.dudes_num[k]>0) and (target_object.dudes_vehicle[k]=target_object.dudes_vehicle[targeh]){
	                                godd=k;
	                            }
	                        }
	                    }
	                    k=targeh;
	                    if (godd=0) then repeat(10){k-=1;
	                        if (godd=0) and (k>=1){
	                            if (target_object.dudes_num[k]>0) and (target_object.dudes_vehicle[k]=target_object.dudes_vehicle[targeh]){
	                                godd=k;
	                            }
	                        }
	                    }
                    
                    
	                    // Found a similar target to get the damage
	                    if (godd>0) and (damage_remaining>0) and (shots_remaining>0){
	                        var a2,b2,c2,eac2,ap2;ap2=damage_remaining;
	                        a2=a;// Average damage
                        
	                        eac2=target_object.dudes_ac[godd];
	                        if (target_object.dudes_vehicle[godd]=0){
	                            if (ap2=1) then eac2=0;
	                            if (ap2=-1) then eac2=eac2*6;
	                        }
	                        if (target_object.dudes_vehicle[godd]=1){
	                            if (ap2=0) then eac2=eac2*6;
	                            if (ap2=-1) then eac2=a;
	                        }
	                        b2=a2-eac2;if (b2<=0) then b2=0;// Average after armour
                        
	                        c2=b2*shots_remaining;// New damage
                        
	                        var casualties2,ponies2,onceh2;onceh2=0;ponies2=0;
	                        if (spla=0) then casualties2=min(floor(c2/target_object.dudes_hp[godd]),shots_remaining);
	                        if (spla!=0) then casualties2=floor(c2/target_object.dudes_hp[godd]);
                        
	                        ponies2=target_object.dudes_num[godd];
	                        if (target_object.dudes_num[godd]=1) and ((target_object.dudes_hp[godd]-c2)<=0){casualties2=1;}
	                        if (target_object.dudes_num[godd]<casualties2) then casualties2=target_object.dudes_num[godd];
	                        if (casualties2<1){casualties2=0;damage_remaining=0;overkill=0;shots_remaining=0;}
                        
	                        if (casualties2>=1) and (shots_fired>0){
	                            var iii,found,openz;
	                            iii=0;found=0;openz=0;
	                            repeat(40){iii+=1;
	                                if (found=0){
	                                    if (obj_ncombat.dead_ene[iii]="") and (openz=0) then openz=iii;
	                                    if (obj_ncombat.dead_ene[iii]=target_object.dudes[godd]) and (found=0){
	                                        found=iii;obj_ncombat.dead_ene_n[obj_ncombat.dead_enemies]+=casualties;
	                                    }
	                                }
	                            }
	                            if (found=0){
	                                obj_ncombat.dead_enemies+=1;
	                                obj_ncombat.dead_ene[openz]=string(target_object.dudes[godd]);
	                                obj_ncombat.dead_ene_n[openz]=casualties;
	                            }
                            
                            
	                            /*obj_ncombat.dead_enemies+=1;
	                            if (casualties2=1) then obj_ncombat.dead_ene[obj_ncombat.dead_enemies]="1 "+string(target_object.dudes[godd]);
	                            if (casualties2>1) then obj_ncombat.dead_ene[obj_ncombat.dead_enemies]=string(casualties2)+" "+string(target_object.dudes[godd]);
	                            obj_ncombat.dead_enemies+=1;
	                            obj_ncombat.dead_ene[obj_ncombat.dead_enemies]=string(target_object.dudes[godd]);
	                            obj_ncombat.dead_ene_n[obj_ncombat.dead_enemies]=casualties;*/
                            
	                            target_object.dudes_num[godd]-=casualties2;
	                            obj_ncombat.enemy_forces-=casualties2;
	                        }
                        
	                        if (casualties2>=1){
	                            if (target_object.dudes_num[godd]<=0){
	                                overkill=casualties2-target_object.dudes_num[godd];
	                                damage_remaining-=casualties2*target_object.dudes_hp[godd];
                                
	                                var proportional_shots;
	                                proportional_shots=round(damage_remaining/a2);
	                                shots_remaining=proportional_shots;
                                
	                                // show_message("killed "+string(casualties2)+"x "+string(target_object.dudes[godd]));
	                                // show_message("did "+string(c)+" damage with "+string(proportional_shots)+" shots fired, have "+string(damage_remaining)+" damage remaining");
	                            }
	                        }
                    
      
	                    }
	                }
	            }// End repeat 10

            
	            scr_flavor(weapon_count,target_object,target_type,shots_fired-wep_rnum[weapon_count],casualties);
            
            
            
            
            
            
	            if (target_object.dudes_num[targeh]=1) and (c>0) then target_object.dudes_hp[targeh]-=c;// Need special flavor here for just damaging
            
	            if (casualties>=1){
	                target_object.dudes_num[targeh]-=casualties;
	                obj_ncombat.enemy_forces-=casualties;
                              
	            }
	        }
	    }
    
    
	    if (stop=0) then with(target_object){
	        var j,good,open;
	        j=0;good=0;open=0;
	        repeat(20){j+=1;
	            if (dudes_num[j]<=0){
	                dudes[j]="";dudes_special[j]="";dudes_num[j]=0;dudes_ac[j]=0;
	                dudes_hp[j]=0;dudes_vehicle[j]=0;dudes_damage[j]=0;
	            }
	            if (dudes[j]="") and (dudes[j+1]!=""){
	                dudes[j]=dudes[j+1];
	                dudes_special[j]=dudes_special[j+1];
	                dudes_num[j]=dudes_num[j+1];
	                dudes_ac[j]=dudes_ac[j+1];
	                dudes_hp[j]=dudes_hp[j+1];
	                dudes_vehicle[j]=dudes_vehicle[j+1];
	                dudes_damage[j]=dudes_damage[j+1];
                
	                dudes[j+1]="";
	                dudes_special[j+1]="";
	                dudes_num[j+1]=0;dudes_ac[j+1]=0;
	                dudes_hp[j+1]=0;
	                dudes_vehicle[j+1]=0;
	                dudes_damage[j+1]=0;
	            }
	        }
	        j=0;
	    }
	    if (target_object.men+target_object.veh+target_object.medi=0) and (target_object.owner!=1) {
	        with(target_object){instance_destroy();}
	    }
    
	    if (melee_or_ranged="melee"){
	        // lololol
	    }
    
	}

}