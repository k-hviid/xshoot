
// Project: xshooter 
// Created: 2019-09-03

#include "src\actor.agc"
gosub _actor
#include "src\actor_player.agc"
gosub _actor_player
#include "src\core_debug.agc"
gosub _core_debug
#include "src\core_init.agc"
gosub _core_init
#include "src\core_input.agc"
gosub _core_input
#include "src\core_structure.agc"
gosub _core_structure
#include "src\physics.agc"				rem loaded before environment which use physics
gosub _physics
#include "src\env.agc"
gosub _env
#include "src\state_intro.agc"
gosub _state_intro
#include "src\state_menu.agc"
gosub _state_menu
#include "src\state_play.agc"
gosub _state_play


do
	Select GameState
		case GAMESTATE_INTRO
			
		endcase
		case GAMESTATE_MENU
			state_menu()
		endcase
		case GAMESTATE_PLAY
			state_play()
		endcase
	endselect
loop


