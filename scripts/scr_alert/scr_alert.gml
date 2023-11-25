function scr_alert(color, type, text, xx, yy) 
	{

		// color / type / text /x/y

		// Quenes up one of the ALERT lines of text to be displayed by the obj_turn_end object
		// If the Y argument is >0 then the exclamation popup (obj_alert) is also created on the map



		// if (obj_turn_end.alerts>0){
		if (instance_exists(obj_turn_end)){
		    if (obj_turn_end.alert_type[obj_turn_end.alerts]!="-"+string(text)) and (type!="blank") and (color!="blank"){
		        obj_turn_end.alerts+=1;
		        obj_turn_end.alert[obj_turn_end.alerts]=1;
		        obj_turn_end.alert_color[obj_turn_end.alerts]=color;
		        // if (argument0="purple") then obj_turn_end.alert_color[obj_turn_end.alerts]="red";
		        obj_turn_end.alert_type[obj_turn_end.alerts]=type;
		        obj_turn_end.alert_text[obj_turn_end.alerts]="-"+string(text);
		        obj_turn_end.alert[obj_turn_end.alerts]=1;
		    }
		}
		// }

		/*
		if (instance_exists(obj_star_event)){
		    var blah, new_obj;
		    blah=0;
		    blah=instance_nearest(x,y,obj_star_event);
    
		    if (point_distance(x,y,blah.x,blah.y)>40){
		        new_obj=instance_create(x+32,y-48,obj_star_event);
		        new_obj.col=argument0;
		    }
		}
		if (!instance_exists(obj_star_event)){
		    var new_obj;
		    new_obj=instance_create(x+16,y-24,obj_star_event);
		    new_obj.col=argument0;
		}
		*/

		if (yy > 0) or (yy <- 10000)
			{
			    var new_obj;

			    if (xx<-15000){xx+=20000;yy+=20000;}
			    if (xx<-15000){xx+=20000;yy+=20000;}
			    if (xx<-15000){xx+=20000;yy+=20000;}
			    if (xx<-15000){xx+=20000;yy+=20000;}
			    if (xx<-15000){xx+=20000;yy+=20000;}
			    if (xx<-15000){xx+=20000;yy+=20000;}
			    if (xx<-15000){xx+=20000;yy+=20000;}
			    if (xx<-15000){xx+=20000;yy+=20000;}
    
			    new_obj=instance_create(xx+16,yy-24,obj_star_event);
			    new_obj.col = color;
			}
	}
