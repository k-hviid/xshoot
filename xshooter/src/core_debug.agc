
_core_debug:

	type Debuging
		Enabled        	as integer
		PathEnabled			as integer
		globalLightEnabled		as integer
		ShaderEnabled		as integer
		FogEnabled    	as integer
		FogMin    			as float
		FogMax    			as float
	endtype
	
	global debuging as debuging

return


function cheatcodes (Debuging ref as Debuging, Player ref as player)
	
	clipget$ as String
					
	if GetRawKeyPressed (KEY_F1)        // toggle cheat console and input with F1
		Debuging.Enabled = 1 - Debuging.Enabled 
	endif
	
	if Debuging.Enabled = 1
	 player.actor.life = 100.0
	 
		if GetRawKeyPressed (KEY_F3)    // F3 to toggle fog
			Debuging.FogEnabled = 1 - Debuging.FogEnabled
			SetFogMode( Debuging.FogEnabled ) 
		endif		 
	 
			if GetRawKeyPressed (KEY_F4)    // F4 to toggle path
					Debuging.PathEnabled = 1 - Debuging.PathEnabled
			endif
					
			if GetRawKeyPressed (KEY_F5)    // F5 to toggle path
					Debuging.ShaderEnabled = 1 - Debuging.ShaderEnabled
			endif
			
			if GetRawKeyPressed (KEY_F6)    // F6 to toggle global light
					Debuging.globalLightEnabled = 1 - Debuging.globalLightEnabled
					SetSunActive( Debuging.globalLightEnabled ) 
			endif
			
			if GetRawKeyPressed (KEY_F8)		// F8 to paste hex color into fogcolor
			 clipGet$ = GetClipboardText()
			 clipGet$ = ReplaceString( clipGet$, "#", "", -1 ) 
			 setFogColor(Val(Mid(clipGet$,1, 2 ) ,16), Val(Mid(clipGet$,3, 2 ) ,16), Val(Mid(clipGet$,5, 2 ) ,16) )
		endif
			
			if GetRawKeyPressed (KEY_F9)    // F9 to paste hex color into suncolor
			 clipGet$ = GetClipboardText()
			 clipGet$ = ReplaceString( clipGet$, "#", "", -1 ) 
					SetSunColor(Val(Mid(clipGet$,1, 2 ) ,16), Val(Mid(clipGet$,3, 2 ) ,16), Val(Mid(clipGet$,5, 2 ) ,16) ) 
			endif
			
			if GetRawKeyPressed (KEY_F10)		// F10 to paste hex color into clearcolor
			 clipGet$ = GetClipboardText()
			 clipGet$ = ReplaceString( clipGet$, "#", "", -1 ) 
			 setClearColor(Val(Mid(clipGet$,1, 2 ) ,16), Val(Mid(clipGet$,3, 2 ) ,16), Val(Mid(clipGet$,5, 2 ) ,16) )
	endif
			
			if GetRawKeyPressed (KEY_F12)		// F12 to paste hex color into ambientcolor
			 clipGet$ = GetClipboardText()
			 clipGet$ = ReplaceString( clipGet$, "#", "", -1 ) 
			 SetAmbientColor(Val(Mid(clipGet$,1, 2 ) ,16), Val(Mid(clipGet$,3, 2 ) ,16), Val(Mid(clipGet$,5, 2 ) ,16) )
		endif
		
			if GetRawKeyState (KEY_1)        // 1 is held down
					Debuging.FogMin = Debuging.FogMin + debug_mousewheel (10.0)
					SetFogRange( Debuging.FogMin, Debuging.FogMax ) 
			endif
			
			if GetRawKeyState (KEY_2)        // 2 is held down
					Debuging.FogMax = Debuging.FogMax + debug_mousewheel (10.0)
					SetFogRange( Debuging.FogMin, Debuging.FogMax )
			endif
			

			print ("  DEBUG CONSOLE" + chr(10))
			print ("  FogMode=" + str(Debuging.fogEnabled) + "     F3 to toggle")
			print ("  FogMin=" + str(Debuging.FogMin) + "     1 + mouse wheel (shift=increase, ctrl=decrease)")
			print ("  FogMax=" + str(Debuging.FogMax) + "     2 + mouse wheel")
			//print ("  PathMode=" + str(Debug.PathEnabled) + "     F4 to toggle")
			print ("  ShaderMode=" + str(Debuging.ShaderEnabled) + "     F5 to toggle")
			print ("  sun=" + str(Debuging.globalLightEnabled) + "F6 to toggle")
			print ("  F8 to paste hex color value into fogColor")        
			print ("  F9 to paste hex color value into suncolor")
			print ("  F10 to paste hex color value into clearcolor")
			print ("  F12 to paste hex color value into ambientColor")
			print ("  Mouse X: " + str(GetRawMouseX()))
			print ("  Mouse Y: " + str(GetRawMouseY()))
			print ("  camera angle X: " + str(Player.CameraAngle.x))
			print ("  camera angle Y: " + str(Player.CameraAngle.y))
	endif
endfunction

function debug_mousewheel (wheelMultiplier# as float)
	out# as float
	out# = GetRawMouseWheelDelta() * wheelMultiplier# 
	if GetRawKeyState (257) = 1 then out# = out# * 10.0 // left shift is down = increase
	if GetRawKeyState (258) = 1 then out# = out# * 10.0 // right shift is down = increase
	if GetRawKeyState (259) = 1 then out# = out# * 0.1 // left ctrl is down = decrease
	if GetRawKeyState (260) = 1 then out# = out# * 0.1 // left ctrl is down = decrease
endfunction out#

/*
function DebugPath(Debug ref as Debuging, Grid ref as PathGrid[][], GridSize)
	if Debug.Enabled and Debug.PathEnabled
		for x=0 to Grid.length
			for y=0 to Grid[0].length
				TextID=x+y*48
				DeleteText(TextID)
				startx#=GetScreenXFrom3D(x*GridSize,0,y*GridSize)
				starty#=GetScreenYFrom3D(x*GridSize,0,y*GridSize)
				if startx#>GetScreenBoundsLeft() and starty#>GetScreenBoundsTop() and startx#<ScreenWidth() and starty#<ScreenHeight()
					CreateText(TextID,str(Grid[x,y].Number))
					SetTextPosition(TextID,startx#,starty#)
					SetTextSize(TextID,3)
					SetTextAlignment(TextID,1)
					if Grid[x,y].Position.x<>0 or Grid[x,y].Position.y<>0
						endx#=GetScreenXFrom3D(Grid[x,y].Position.x*GridSize,0,Grid[x,y].Position.y*GridSize)
						endy#=GetScreenYFrom3D(Grid[x,y].Position.x*GridSize,0,Grid[x,y].Position.y*GridSize)
						DrawLine(endx#,endy#,startx#,starty#,MakeColor(255,255,255),MakeColor(0,0,255))
					endif
				endif
			next y
		next x
	else
		for TextID=0 to Grid.length*Grid[0].length
			DeleteText(TextID)
		next TextID
	endif



endfunction
*/
