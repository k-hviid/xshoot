
_core_input:



	#constant KEY_BACK         8
	#constant KEY_TAB          9
	#constant KEY_ENTER        13
	#constant KEY_SHIFT        16
	#constant KEY_CONTROL      17
	#constant KEY_ALT          18
	#constant KEY_PAUSE        19
	#constant KEY_CAPSLOCK     20
	#constant KEY_ESCAPE       27
	#constant KEY_SPACE        32
	#constant KEY_PAGEUP       33
	#constant KEY_PAGEDOWN     34
	#constant KEY_END          35
	#constant KEY_HOME         36
	#constant KEY_LEFT         37
	#constant KEY_UP           38
	#constant KEY_RIGHT        39
	#constant KEY_DOWN         40
	#constant KEY_INSERT       45
	#constant KEY_DELETE       46
	#constant KEY_0            48 REM (triggered by both top row number keys and numpad keys)
	#constant KEY_1            49
	#constant KEY_2            50
	#constant KEY_3            51
	#constant KEY_4            52
	#constant KEY_5            53
	#constant KEY_6            54
	#constant KEY_7            55
	#constant KEY_8            56
	#constant KEY_9            57
	#constant KEY_A            65
	#constant KEY_B            66
	#constant KEY_C            67
	#constant KEY_D            68
	#constant KEY_E            69
	#constant KEY_F            70
	#constant KEY_G            71
	#constant KEY_H            72
	#constant KEY_I            73
	#constant KEY_J            74
	#constant KEY_K            75
	#constant KEY_L            76
	#constant KEY_M            77
	#constant KEY_N            78
	#constant KEY_O            79
	#constant KEY_P            80
	#constant KEY_Q            81
	#constant KEY_R            82
	#constant KEY_S            83
	#constant KEY_T            84
	#constant KEY_U            85
	#constant KEY_V            86
	#constant KEY_W            87
	#constant KEY_X            88
	#constant KEY_Y            89
	#constant KEY_Z            90
	#constant KEY_WIN_LEFT     91
	#constant KEY_WIN_RIGHT    92
	#constant KEY_NUMPAD_0     96
	#constant KEY_NUMPAD_1     97
	#constant KEY_NUMPAD_2     98
	#constant KEY_NUMPAD_3     99
	#constant KEY_NUMPAD_4     100
	#constant KEY_NUMPAD_5     101
	#constant KEY_NUMPAD_6     102
	#constant KEY_NUMPAD_7     103
	#constant KEY_NUMPAD_8     104
	#constant KEY_NUMPAD_9     105
	#constant KEY_ASTERISK     106
	#constant KEY_PLUS         107
	#constant KEY_SUBTRACT     109
	#constant KEY_DECIMAL      110
	#constant KEY_DIVIDE       111
	#constant KEY_F1           112
	#constant KEY_F2           113
	#constant KEY_F3           114
	#constant KEY_F4           115
	#constant KEY_F5           116
	#constant KEY_F6           117
	#constant KEY_F7           118
	#constant KEY_F8           119
	#constant KEY_F9           120
	#constant KEY_F10          121
	#constant KEY_F11          122
	#constant KEY_F12          123
	#constant KEY_NUMLOCK      144
	#constant KEY_SCROLLLOCK   145
	#constant KEY_VOLUME_MUTE  173
	#constant KEY_VOLUME_DOWN  174
	#constant KEY_VOLUME_UP    175
	#constant KEY_MEDIA_NEXT   176
	#constant KEY_MEDIA_PREV   177
	#constant KEY_MEDIA_STOP   178
	#constant KEY_MEDIA_PLAY   179
	
	#constant KEY_SEMICOLON    186 rem ;  
	#constant KEY_EQUAL        187 rem =	
	#constant KEY_COLON        188 rem ,
	#constant KEY_HYPHEN       189 rem -
	#constant KEY_DOT          190 rem .
	#constant KEY_SLASH        191 rem /
	rem #constant KEY_ '       192
	#constant KEY_LEFTSQUAREBRACKET   219 rem [
	#constant KEY_BACKSLASH           220 rem \
	#constant KEY_RIGHTSQUAREBRACKET  221 rem ]
	#constant KEY_HASH         222 rem #
	rem #constant KEY_ `       223
	
	#constant KEY_LEFT_SHIFT   257
	#constant KEY_RIGHT_SHIFT  258
	#constant KEY_LEFT_CTRL    259
	#constant KEY_RIGHT_CTRL   260
	#constant KEY_LEFT_ALT     261
	#constant KEY_RIGHT_ALT    262
	#constant KEY_TOP_0        263
	#constant KEY_TOP_1        264
	#constant KEY_TOP_2        265
	#constant KEY_TOP_3        266
	#constant KEY_TOP_4        267
	#constant KEY_TOP_5        268
	#constant KEY_TOP_6        269
	#constant KEY_TOP_7        270
	#constant KEY_TOP_8        271
	#constant KEY_TOP_9        272



	Global isItfullscreen = 1


return





function core_input__basic()
	
	rem Alt+F4 to quit
	if GetRawKeyState(KEY_ALT)
		if GetRawKeyPressed(KEY_F4)
			end
		endif
	endif
	
	rem Ctrl+W to quit
	if GetRawKeyState(KEY_LEFT_CTRL)
		if GetRawKeyPressed(KEY_W)
			end
		endif
	endif
	
	// F11 to toggle fullscreen
	if GetRawKeyPressed (KEY_F11)
		isItfullscreen = 1-isItfullscreen
		SetWindowSize( 960, 540, isItfullscreen )
	endif

	
endfunction



function core_input__play()
	
	rem esc to go to menu
	if GetRawKeyPressed(KEY_ESCAPE)

	endif

	
endfunction
