local color = tocolor(0,0,0,255)

local playerTarget = false
local timeTarget = 0

function tt ()
if timeTarget == 0 then
timeTarget = 0
playerTarget = false
else
timeTarget = timeTarget - 1
end
end
setTimer (tt,1000,0)

function targetingActivated(target)
	if (target) and getElementType(target) == "player" then
		playerTarget = target
		timeTarget = 5
	end
end
addEventHandler("onClientPlayerTarget",getRootElement(),targetingActivated)

function vorNameTag()
  if not playerTarget then return end
local Px,Py,Pz = getCameraMatrix( )
 if isElement(playerTarget) and playerTarget ~= localPlayer then
local Zx,Zy,Zz = getElementPosition( playerTarget )
local dis = getDistanceBetweenPoints3D(Px, Py, Pz, Zx, Zy, Zz)
  -- if(dis <= 30)then
     local sxx,syy = getScreenFromWorldPosition(Zx,Zy,Zz)
     if sxx then
        local sx,sy = sxx+60,syy
        local blood = getElementData(playerTarget,"blood") or 0
		local armor = getElementData(playerTarget,"Armor") or 0
		if blood >0 then
		   dxDrawRectangle(sx-27, sy-18, 27, 27,tocolor(255,255,255,255),false)
		   dxDrawRectangle(sx-1,sy-1,102,10,tocolor(255,255,255,255),false)
		   dxDrawRectangle(sx,sy,100,8,tocolor(10,10,10,255),false)
		   local name = string.gsub( getPlayerName( playerTarget ), "#%x%x%x%x%x%x", "" )
		   local frakc = getElementData(playerTarget,"Фракция")
		   local stars = getElementData(playerTarget,"stars")
		      if frakc == 1 then
			     color = tocolor(10,125,255,255)
              elseif frakc == 2 then
			     color = tocolor(255,10,10,255)
			  elseif frakc == 3 then
			     color = tocolor(66,0,255,255)
			  elseif frakc == 4 then
			     color = tocolor(0,0,0,255)
			  elseif frakc == 5 then
			     color = tocolor(255,150,0,255)
			  elseif frakc == 6 then
			     color = tocolor(235,226,0,255)
			  else
			     color = tocolor(10,200,10,255)
			  end
			     
			     dxDrawRectangle(sx-26, sy-17, 25, 25,color,false)
				 dxDrawImage(sx-26, sy-17, 25, 25, "1.png", 0, 0, 0)
		         dxDrawImage(sx-55, sy-18, 27, 27, "a1.png", 0, 0, 0)
		         dxDrawText(stars,sx-16,sy-10,10,10,tocolor(0,0,0,255),1.0,"default-bold","left","top",false,false,false) 
                 dxDrawText(name,sx+3,sy-15,100,10,tocolor(255,255,255,255),1.0,"default-bold","left","top",false,false,false) 
				 dxDrawRectangle(sx+1,sy+1,blood/240,6,tocolor(255,10,10,255),false) -- health
				 dxDrawRectangle(sx+50,sy+1,armor/240,6,tocolor(100,200,230,255),false) -- armor


end
end
end
end
--end
addEventHandler("onClientRender",getRootElement(),vorNameTag)

local blips = {}

addEventHandler("onClientResourceStart",resourceRoot,
function()
	setTimer(function()
		if getElementData(localPlayer,"logedin") then
			for i, v in ipairs(blips) do
				if isElement(v) then
					destroyElement(v)
				end	
			end
			blips = {}
			local players = getElementsByType ("player") or {}
			for i, plr in ipairs(players) do
				--local x,y,z = getElementPosition(plr)
				if plr ~= localPlayer then
				local plrFr = getElementData(plr,"Фракция")
				local localPlrFr = getElementData(localPlayer,"Фракция")
				 -- if plrFr == 0 then
				 -- local blip = createBlipAttachedTo ( plr, 0,2,10,200,10,255,0,99999)
					-- --local blip = createBlip(x,y,z,0,2,10,200,10,255,0,99999.0)
					-- table.insert(blips,blip)
				if plrFr == localPlrFr and plrFr == 1 then
						   local blip = createBlipAttachedTo ( plr, 0,2,10,125,255,255,0,99999)
					       table.insert(blips,blip)
				elseif plrFr == localPlrFr and plrFr == 5 then
						   local blip = createBlipAttachedTo ( plr, 0,2,10,125,255,255,0,99999)
					       table.insert(blips,blip)
				elseif plrFr == localPlrFr and plrFr == 6 then
						   local blip = createBlipAttachedTo ( plr, 0,2,10,125,255,255,0,99999)
					       table.insert(blips,blip)
				elseif plrFr == 2 and getElementData(plr,"stars") > 4 then
					 local blip = createBlipAttachedTo ( plr, 0,2,255,0,0,255,0,99999)
					       table.insert(blips,blip)
			    elseif plrFr == 3 and getElementData(plr,"stars") > 4 then
					 local blip = createBlipAttachedTo ( plr, 0,2,200,0,255,255,0,99999)
					       table.insert(blips,blip)
				elseif plrFr == 4 and getElementData(plr,"stars") > 4 then
					 local blip = createBlipAttachedTo ( plr, 0,2,0,0,0,255,0,99999)
					       table.insert(blips,blip)
				end
				end
				end	
			end
	end,1000,0)
end)

-- tableBlip = {
-- --{№ квеста, x, y , z, icon, size ,r,g,b,a,ordering = 0, float visibleDistance = 16383.0},
  -- {3,2117.5607910156,2402.4736328125,23.60156251,18,1}, --оружие ТЦ
   -- {3,364.11367797852,5750.3168945313,119.17008972168,18,1}, --оружие ТЦ
  -- {3,2280.7509765625,2446.1860351563,46.977523803711,18,1}, --оружие ЛВ пд
    -- {3,363.64492797852,5787.9306640625,119.03245544434,55,1}, --тс ТЦ
	 -- {3,434.56619262695,5843.6591796875,123.55541992188,29,1}, --пица ТЦ
	 	 -- {3,424.75762939453,5739.6088867188,125.43578338623,45,1}, --одежда ТЦ
		 	 -- {3,2253.8039550781,2383.4931640625,19.659206390381,29,1}, --пица на против ЛВПД
			 	 -- {3,2084.5004882813,2175.32421875,10.89999961853,58,1}, --Нонэйм 
				 	 -- {3,2498.2644042969,2365.6030273438,4.2178993225098,59,1}, --Красный пед
-- }

-- function MarBlip()
-- for i, v in ipairs(tableBlip) do
  -- local blip = createBlip( v[2], v[3], v[4], v[5], v[6],255,255,255,255,0,300)
-- end
-- end
-- addEventHandler ( "onClientResourceStart", getResourceRootElement(getThisResource()), MarBlip )
