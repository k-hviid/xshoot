


_core_init:

	#option_explicit
	#constant TITLE "shooter"
	#constant VERSION "0.001"
	
	#constant FALSE 0
	#constant TRUE 1

	SetErrorMode(2)






	// show all errors
	SetErrorMode(2)

	// set window properties
	SetWindowTitle( TITLE + " " + VERSION )
	SetWindowSize( 1024, 768, TRUE )
	SetWindowAllowResize( 0 ) // allow the user to resize the window

	// set display properties
	SetVirtualResolution( GetDeviceWidth(), GetDeviceHeight() ) // doesn't have to match the window
	SetOrientationAllowed( 1, 1, 1, 1 ) // allow both portrait and landscape on mobile devices
	SetVSync(TRUE)
	SetScissor( 0,0,0,0 ) // use the maximum available screen space, no black borders
	UseNewDefaultFonts( 1 ) // since version 2.0.22 we can use nicer default fonts

	SetDefaultMagFilter(1) // 0 nearest  1 liniar
	SetDefaultMinFilter(1)
	
	SetRawMouseVisible( FALSE ) 

return

