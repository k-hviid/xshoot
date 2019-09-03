
_actor_player:

	type Player
		actor as actor
		CameraPosition	as vec3
		CameraAngle	as vec3
		ShootDelay		as float
		alive				as integer
	endtype
	
	Global previousMouseX# as float 
	Global previousMouseY# as float 
	Global mouseXDistance# as float
	Global mouseYDistance# as float
	Global mouseBoost# as float = 0.4
	Global distFromEdge# as float = 30.0

return



function actor_player_init()
		
	Player.actor.OID = CreateObjectBox( 0.4, 0.4, 0.4 )
	
	setObjectPosition (Player.actor.OID, 0.0, 5.0, 0.0)
	Create3DPhysicsDynamicBody( Player.actor.OID ) 
		
endfunction


function actor_player__input ()
	
	///////////////////////////////////////////////////////////////////////////////
	// MOUSE
	///////////////////////////////////////////////////////////////////////////////
	
	
	if GetRawMouseY() < distFromEdge#                                                  // if too close to the bottom of the screen
	  SetRawMousePosition (getRawMouseX(), GetRawMouseY() + 0.5*GetDeviceHeight() )    // Move the mouse ½ screenlength up
	  previousMouseY# = previousMouseY# + 0.5*GetDeviceHeight()                        // move the previous mouse position ½ screenlength up
	endif

	if GetRawMouseY() > GetDeviceHeight()-distFromEdge#                               // if too close to the top of the screen
	  SetRawMousePosition (getRawMouseX(), GetRawMouseY() - 0.5*GetDeviceHeight())    // Move the mouse ½ screenlength down
	  previousMouseY# = previousMouseY# - 0.5*GetDeviceHeight()                       // move the previous mouse position ½ screenlength down
	endif

	if GetRawMouseX() < distFromEdge#                                                  // if too close to the left of the screen
	  SetRawMousePosition (  GetRawMouseX() + 0.5*GetDeviceWidth(), getRawMouseY())    // Move the mouse ½ screenlength right
	  previousMouseX# = previousMouseX# + 0.5*GetDeviceWidth()                         // Move the previous mouse position ½ screenlength right
	endif

	if GetRawMouseX() > GetDeviceWidth()-distFromEdge#                                // if too close to the right of the screen
	  SetRawMousePosition ( GetRawMouseX() - 0.5*GetDeviceWidth(), getRawMouseY())    // Move the mouse ½ screenlength left
	  previousMouseX# = previousMouseX# - 0.5*GetDeviceWidth()                        // Move the previous mouse position ½ screenlength left
	endif
	

	mouseXDistance# =  GetRawMouseX() - previousMouseX#
	mouseYDistance# =  GetRawMouseY() - previousMouseY#

	previousMouseX# = GetRawMouseX()
	previousMouseY# = GetRawMouseY()

	
	Player.CameraAngle.y = Player.CameraAngle.y + (mouseXDistance#*mouseBoost#)
	Player.CameraAngle.x = Player.CameraAngle.x + (mouseYDistance#*mouseBoost#)
	
	if Player.CameraAngle.x > 400.0 then Player.CameraAngle.x = 400.0
	if Player.CameraAngle.x < 310.0 then Player.CameraAngle.x = 310.0
	
	///////////////////////////////////////////////////////////////////////////////
	// WASD
	///////////////////////////////////////////////////////////////////////////////
	
	If GetRawKeyState (KEY_W)
		print ("xW")
		SetObject3DPhysicsLinearVelocity(player.actor.OID, 0, 10, 0, 10)
	endif

endfunction
