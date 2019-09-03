


_state_play:



return



function state_play()
	
	state_play_init()
	
	do
		cheatcodes (Debuging, Player)
		core_input__basic()
		core_input__play()
		
		actor_player__input ()
		
		state_play_UpdateCam()
		
		Step3DPhysicsWorld()
		sync()
	loop

endfunction

function state_play_init()
	
	Global player as Player
	
	actor_player_init()
	
endfunction

function state_play_UpdateCam()
	setCameraPosition ( 1, getObjectX(Player.actor.OID), getObjectY(Player.actor.OID)+1, getObjectZ(Player.actor.OID))
	setCameraRotation ( 1, Player.CameraAngle.x, Player.CameraAngle.y, Player.CameraAngle.Z)

endfunction
