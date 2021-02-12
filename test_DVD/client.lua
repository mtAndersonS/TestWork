    local screenW, screenH = guiGetScreenSize()
	local speed = 4

	--{x,y,startX,endX,startY,endY,vectorX,vectorY}
	local dvd = {
	{0,0,0,0,screenW/2-270,screenH-120,1,1,tocolor(255, 255, 255,255)},
	{screenW/2,0,0,screenW/2,screenW-270,screenH-120,1,1,tocolor(255, 255, 255,255)},
	}
	
function renderDvd()
	for i,v in ipairs(dvd) do
	
	if v[1] >=  v[5] then
        v[7] = -1;
		v[9] = tocolor(math.random(50,250), math.random(50,250), math.random(50,250), 255);
	    elseif v[1] <=  v[4] then
		v[7] = 1;
		v[9] = tocolor(math.random(50,250), math.random(50,250), math.random(50,250), 255);
	end;
	
	if  v[2] >= v[6] then
        v[8] = -1;
		v[9] = tocolor(math.random(50,250), math.random(50,250), math.random(50,250), 255);
	    elseif  v[2] <= v[3] then
		v[8] = 1;
		v[9] = tocolor(math.random(50,250), math.random(50,250), math.random(50,250), 255);
	end;
	
    v[1] = v[1] + v[7]*speed;
    v[2] = v[2] + v[8]*speed;
 
     dxDrawImage(v[1], v[2], 270, 120, "1.png", 0, 0, 0, v[9]);
end;
end;

	


function startDvd()
	addEventHandler("onClientRender",getRootElement(),renderDvd);
end
   addEventHandler( "onClientResourceStart", getRootElement( ),startDvd)

