function scr_add_artifact(type, tags, identified, location, sid) {

	// type : type
	// tags : tags
	// identified : identified
	// location: location
	// argument4: sid




	var i,last_artifact;
	i=0;last_artifact=0;
	repeat(100){if (last_artifact=0){i+=1;if (obj_ini.artifact[i]="") then last_artifact=i;}}



	var rand1,rand2,good;
	rand1=floor(random(100))+1;
	rand2=floor(random(100))+1;
	good=0;

	var t1,t2,t3,t4,t5;
	t1="";t2="";t3="";t4="";t5="";


	if (type="random") or (type="random_nodemon"){
	    if (rand1<=45) and (good=0){t1="Weapon";good=1;}
	    if (rand1<=80) and (good=0){t1="Armour";good=1;}
	    if (rand1<=90) and (good=0){t1="Gear";good=1;}
	    if (rand1<=100) and (good=0){t1="Device";good=1;}
	}

	if (type="Weapon") then t1=type;
	if (type="Armour") then t1=type;
	if (type="Gear") then t1=type;
	if (type="Device") then t1=type;
	    if (type="Robot"){t1="Device";t2="Robot";}
	    if (type="Tome"){t1="Device";t2="Tome";}
	if (type="chaos_gift"){t1="Device";t2=choose("Casket","Chalice","Statue");}


	if (t1="Weapon") and (t2=""){good=0;
	    if (rand2<=30) and (good=0){t2="Bolter";good=1;}
	    if (rand2<=40) and (good=0){t2="Plasma Pistol";good=1;}
	    if (rand2<=50) and (good=0){t2="Plasma Gun";good=1;}
	    if (rand2<=70) and (good=0){t2=choose("Power Sword","Power Axe","Power Spear","Lightning Claw");good=1;}
	    if (rand2<=90) and (good=0){t2=choose("Power Fist","Power Fist","Lightning Claw");good=1;}
	    if (rand2<=100) and (good=0){t2=choose("Relic Blade","Thunder Hammer");good=1;}
	}

	if (t1="Armour") and (t2=""){good=0;
	    if (rand2<=70) and (good=0){t2="Power Armour";good=1;}
	    if (rand2<=80) and (good=0){t2="Terminator Armour";good=1;}
	    if (rand2<=90) and (good=0){t2="Dreadnought Armour";good=1;}
	    if (rand2<=100) and (good=0){t2="Artificer Armour";good=1;}
	}

	if (t1="Gear") and (t2=""){good=0;
	    if (rand2<=20) and (good=0){t2="Rosarius";good=1;}
	    if (rand2<=45) and (good=0){t2="Psychic Hood";good=1;}
	    if (rand2<=80) and (good=0){t2="Jump Pack";good=1;}
	    if (rand2<=100) and (good=0){t2="Servo Arms";good=1;}
	}

	if (t1="Device") and (t2=""){good=0;
	    if (rand2<=30) and (good=0){t2="Casket";good=1;}
	    if (rand2<=50) and (good=0){t2="Chalice";good=1;}
	    if (rand2<=70) and (good=0){t2="Statue";good=1;}
	    if (rand2<=90) and (good=0){t2="Tome";good=1;}
	    if (rand2<=100) and (good=0){t2="Robot";good=1;}
	}

	if (type="good"){
	    var haha;haha=choose(1,2,3,4);
	    if (haha=1){t1="Weapon";t2="Relic Blade";}
	    if (haha=2){t1="Weapon";t2="Plasma Gun";}
	    if (haha=3){t1="Gear";t2="Rosarius";}
	    if (haha=4){t1="Armour";t2="Terminator Armour";}
	}



	rand2=floor(random(100))+1;good=0;
	if (string_count("Shit",obj_ini.strin2)>0){rand2=min(rand2+20,100);}
	if (rand2<=70) and (good=0){t3="";good=1;}
	if (rand2<=90) and (good=0) and (type!="random_nodemon"){t3="Chaos";good=1;}
	if (rand2<=100) and (good=0) and (type!="random_nodemon"){t3="Daemonic";good=1;}

	if (t1="Weapon"){
	    // gold, glowing, underslung bolter, underslung flamer
	    t5=choose("GLD","GLO","UBL","UFL");
	    // Runes, scope, adamantium, void
	    t4=choose("RUN","SCO","ADA","VOI");
	    if ((t2="Power Sword") or (t2="Power Axe") or (t2="Power Spear")) and (t4="SCO") then t4="CHB";// chainblade
	    if ((t2="Power Fist") or (t2="Power Claw")) and (t4="SCO") then t4="DUB";// doubled up
		if (t2="Thunder Hammer") and (t4="RUN") then t4="GLO";//glowing runed
	    if (t2="Relic Blade") and (t4="SCO") then t4="UFL";// underslung flamer
	}
	if (t1="Armour"){
	    // golden filigree, glowing optics, purity seals
	    t5=choose("GLD","GLO","PUR");
	    // articulated plates, spikes, runes, drake scales
	    t4=choose("ART","SPI","RUN","DRA");
	}
	if (t1="Gear"){
	    // supreme construction, adamantium, gold
	    t4=choose("SUP","ADA","GOLD");// bur = ever burning
	    if (t2="Rosarius") then t5=choose("GLD","GLO","BIG","BUR");
	    if (t2="Bionics") then t5=choose("GLD","GLO","RUN","SOO");// Soothing appearance
	    if (t2="Psychic Hood") then t5=choose("FIN","GLD","BUR","MASK");// fine cloth, gold, ever burning, mask
	    if (t2="Jump Pack") then t5=choose("SPI","SKRE","WHI","SIL");// spikes, screaming, white flame, silent
	    if (t2="Servo Arms") then t5=choose("GLD","TEN","GOR","SOO");// gold, tentacles, gorilla build, soothing appearance
	}
	if (t1="Device") and (t2!="Robot"){
	    t4=choose("GOLD","CRU","GLO","ADA");// skulls, falling angel, thin, tentacle, mindfuck
	    if (t2!="Statue") then t5=choose("SKU","FAL","THI","TEN","MIN");
	    // goat, speechless, dying angel, jumping into magma, cheshire grunx
	    if (t2="Statue") then t5=choose("GOAT","SPE","DYI","JUM","CHE");
	    // Gold, glowing, preserved flesh, adamantium
	    if (t2="Tome") then t4=choose("GOLD","GLO","PRE","ADA","SAL","BUR");
	    if (t4="PRE") and (t3="") then t3=choose("","Chaos","Daemonic");
	}
	if (t1="Device") and (t2="Robot"){// human/robutt/shivarah
	    t4=choose("HU","RO","SHI");
	    t5=choose("ADA","JAD","BRO","RUNE");
	}

	var big;big=choose(1,2);
	// if (big=1) or (tags="minor") then t5="";
	if (tags="minor"){t4="";t5="";t3+="|mnr";}
	if (tags="inquisition") then t3+="|inq";
	if ((tags="daemonic") or (tags="Daemonic")) and (t2!="Tome") then t3="Daemonic"+choose("1a","2a","3a","4a");
	if ((tags="daemonic") or (tags="Daemonic")) and (t2="Tome") then t3="Daemonic"+choose("2a","3a","4a");
	if (type="chaos_gift") then t3="|cgfDaemonic3a";
	// show_message(string(t3));

	obj_ini.artifact[last_artifact]=t2;
	obj_ini.artifact_tags[last_artifact]=string(t4)+"|"+string(t5)+"|"+string(t3)+"|";

	// show_message(string(obj_ini.artifact_tags[last_artifact]));

	obj_ini.artifact_identified[last_artifact]=identified;
	obj_ini.artifact_condition[last_artifact]=100;
	obj_ini.artifact_loc[last_artifact]=location;
	obj_ini.artifact_sid[last_artifact]=sid;

	obj_controller.artifacts+=1;


	scr_recent("artifact_acquired",string(obj_ini.artifact_tags[last_artifact]),last_artifact);


}
