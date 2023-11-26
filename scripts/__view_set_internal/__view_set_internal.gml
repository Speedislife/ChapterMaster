function __view_set_internal(__prop, __index, __val) 
	{
		var __cam = view_get_camera(__index); 
		
		switch(__prop)
			{
				case E__VW.XVIEW: 				
					camera_set_view_pos(__cam, __val, camera_get_view_y(__cam)); 
				break;
			
				case E__VW.YVIEW:
					camera_set_view_pos(__cam, camera_get_view_x(__cam), __val); 
				break;
			
				case E__VW.WVIEW:
					camera_set_view_size(__cam, __val, camera_get_view_height(__cam)); 
				break;
			
				case E__VW.HVIEW:
					camera_set_view_size(__cam, camera_get_view_width(__cam), __val); 
				break;
			
				case E__VW.ANGLE:
					camera_set_view_angle(__cam, __val); 
				break;
			
				case E__VW.HBORDER:
					camera_set_view_border(__cam, __val, camera_get_view_border_y(__cam)); 
				break;
			
				case E__VW.VBORDER:
					camera_set_view_border(__cam, camera_get_view_border_x(__cam), __val); 
				break;
			
				case E__VW.HSPEED:
					camera_set_view_speed(__cam, __val, camera_get_view_speed_y(__cam)); 
				break;
			
				case E__VW.VSPEED:		
					camera_set_view_speed(__cam, camera_get_view_speed_x(__cam), __val); 
				break;
			
				case E__VW.OBJECT:
					camera_set_view_target(__cam, __val); 
				break;
			
				case E__VW.VISIBLE:
					__res = view_set_visible(__index, __val);
				break;
			
				case E__VW.XPORT:			
					__res = view_set_xport(__index, __val); 
				break;
			
				case E__VW.YPORT:
					__res = view_set_yport(__index, __val); 
				break;
			
				case E__VW.WPORT:
					__res = view_set_wport(__index, __val); 
				break;
			
				case E__VW.HPORT:
					__res = view_set_hport(__index, __val); 
				break;
			
				case E__VW.CAMERA:
					__res = view_set_camera(__index, __val); 
				break;
			
				case E__VW.SURFACEID:
					__res = view_set_surface_id(__index, __val); 
				break;
			
				default:
					debug_event("Default result in __view_set_internal did something go wrong?")
				break;
			};

		return 0;
	}
