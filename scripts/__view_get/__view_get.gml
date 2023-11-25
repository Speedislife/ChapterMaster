function __view_get(__prop, __index) 
	{

		var __res = -1;
		var __cam = undefined;

		switch(__prop)
			{
				case E__VW.XVIEW: 
					__cam = view_get_camera(__index); 
					__res = camera_get_view_x(__cam); 
				break;
			
				case E__VW.YVIEW: 
					__cam = view_get_camera(__index);
					__res = camera_get_view_y(__cam);
				break;
			
				case E__VW.WVIEW: 
					__cam = view_get_camera(__index); 
					__res = camera_get_view_width(__cam); 
				break;
			
				case E__VW.HVIEW: 
					__cam = view_get_camera(__index); 
					__res = camera_get_view_height(__cam); 
				break;
			
				case E__VW.ANGLE: 
					__cam = view_get_camera(__index); 
					__res = camera_get_view_angle(__cam); 
				break;
			
				case E__VW.HBORDER: 
					__cam = view_get_camera(__index); 
					__res = camera_get_view_border_x(__cam); 
				break;
				
				case E__VW.VBORDER: 
					__cam = view_get_camera(__index); 
					__res = camera_get_view_border_y(__cam); 
					break;
				
				case E__VW.HSPEED: __cam = view_get_camera(__index); 
					__res = camera_get_view_speed_x(__cam);
					break;
				
				case E__VW.VSPEED: __cam = view_get_camera(__index); 
					__res = camera_get_view_speed_y(__cam);
					break;
				
				case E__VW.OBJECT: __cam = view_get_camera(__index);
					__res = camera_get_view_target(__cam); 
					break;
				
				case E__VW.VISIBLE: 
					__res = view_get_visible(__index); 
				break;
				
				case E__VW.XPORT: 
					__res = view_get_xport(__index); 
				break;
				
				case E__VW.YPORT: 
					__res = view_get_yport(__index); 
				break;
				
				case E__VW.WPORT: 
					__res = view_get_wport(__index); 
				break;
				
				case E__VW.HPORT: 
					__res = view_get_hport(__index); 
				break;
				
				case E__VW.CAMERA: 
					__res = view_get_camera(__index); 
				break;
				
				case E__VW.SURFACEID: __res = view_get_surface_id(__index); 
				break;
				default: break;
			};

		return __res;


	}
