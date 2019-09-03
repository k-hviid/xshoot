
_env:

	SetFogMode(1)
	SetSunActive(1)
	SetFogRange(-9.0,69.0)
	SetSunColor(182,54,51)
	setClearColor(0,10,87)
	setFogColor(0,10,87)
	SetAmbientColor(145,145,145)

/*
	//Create Skybox
	SetSkyBoxHorizonColor( 200, 200, 255 )
	SetSkyBoxHorizonSize( 10, 2 )
	SetSkyBoxSkyColor( 50, 50, 255)
	SetSkyBoxSunColor( 255,255,255 )
	SetSkyBoxVisible( 1 )
	SetSkyBoxSunSize( 1, 3.0 )
	SetSkyBoxSunVisible( 1 )
	*/
	
	
	// Create the ground
	floorOID as integer
	floorOID = createObjectPlane (200.0, 200.0)
	rotateObjectLocalX (floorOID, 90.0)
	
	floorIID as integer
	floorIID = loadImage("a_dif.png")
	floorNrmIID as integer
	floorNrmIID = loadImage("a_nrm.png")
	
	SetObjectMeshUVScale( floorOID, 1, 0, 50.0, 50.0 )
	SetImageWrapU(floorIID, 1)
	SetImageWrapV(floorIID, 1)
	SetImageWrapU(floorNrmIID, 1)
	SetImageWrapV(floorNrmIID, 1)
	setObjectImage (floorOID, floorIID, 0)
	SetObjectNormalMap (floorOID, floorNrmIID)
	
	Create3DPhysicsStaticBody( floorOID ) 

return


function env_init()




endfunction
