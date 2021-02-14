-- editBox = {
    -- ["username"] = {text = "", masq = false},
    -- ["password"] = {text = "", masq = false},
    -- ["area"] = {text = "", masq = false},

-- }

editBox = {
    ["name"] = {text = ""},
    ["surname"] = {text = ""},
    ["area"] = {text = ""},
	["search"] = {text = ""},
	["name_cor"] = {text = ""},
    ["surname_cor"] = {text = ""},
    ["area_cor"] = {text = ""},

}

function removeCache()
    text = {}
    for i,_ in ipairs(editBox) do
	    table.insert(text,{})
    end
    boxClick = false
end


function roundedRectangle(x, y, w, h, borderColor, bgColor, postGUI)
	if (x and y and w and h) then
		if (not borderColor) then
			borderColor = tocolor(0, 0, 0, 200);
		end
		if (not bgColor) then
			bgColor = borderColor;
		end
		dxDrawRectangle(x, y, w, h, bgColor, postGUI);
		dxDrawRectangle(x + 2, y - 1, w - 4, 1, borderColor, postGUI);
		dxDrawRectangle(x + 2, y + h, w - 4, 1, borderColor, postGUI);
		dxDrawRectangle(x - 1, y + 2, 1, h - 4, borderColor, postGUI);
		dxDrawRectangle(x + w, y + 2, 1, h - 4, borderColor, postGUI);
	end
end

function createEditBox(posX,posY,sizeX,sizeY,alpha,scale,font,boxName,complement)
	if isMousePosition ( posX, posY + 5, sizeX, sizeY ) then
	roundedRectangle(posX, posY + 5, sizeX, sizeY, tocolor(40, 40, 40))	
	else
    roundedRectangle(posX, posY + 5, sizeX, sizeY, tocolor(50, 50, 50))	
	end
	local data = editBox[boxName]
	local tDraw = data.text
	
	local width = dxGetTextWidth(tDraw,scale,font,false)

	if boxClick == boxName then
		if width <= (sizeX-4) then
			dxDrawRectangle(posX + width + 10, posY + 7 , 1 , sizeY - 2,tocolor(255,255,255,255))
		else
			dxDrawRectangle(posX + sizeX + 10, posY + 7 , 1 , sizeY - 2 ,tocolor(255,255,255,255))
		end
	end
	
		if boxClick ~= boxName and data.text == "" then
			dxText(complement, posX + 17, posY ,posX + sizeX,posY+sizeY+10,255,255,255,150,scale,font,"left","center",true,false,false,false)
		end
	
	if data.text ~= "" then
		if width <= sizeX then
			dxText(tDraw,posX + 10,posY,posX+sizeX - 2,posY+sizeY + 12,255,255,255,150,scale,font,"left","center",true,false,false,false)
		else
			dxText(tDraw,posX + 10,posY,posX+sizeX - 2,posY+sizeY + 12,255,255,255,150,scale,font,"right","center",true,false,false,false)
		end
	end
end


function backSpace(key,keyState)
    if ( keyState == "up" ) then
	    if isTimer(_backSpace) then
		    killTimer(_backSpace)
		end
	elseif ( keyState == "down" ) then
        if boxClick then
			local text = editBox[boxClick].text
			editBox[boxClick].text = utf8.sub (text, 0, utf8.len(text)-1)
			_backSpace = setTimer (function() 
				local text = editBox[boxClick].text 
				editBox[boxClick].text = utf8.sub (text, 0, utf8.len(text)-1) 
			end, 100, 0)
        end
	end
end
bindKey("backspace", "up", backSpace)
bindKey("backspace", "down", backSpace)

addEventHandler("onClientCharacter", getRootElement(),
function (character)
	if not boxClick then return end
	editBox[boxClick].text = editBox[boxClick].text..character
end
)

function dxText(text,x,y,w,h,red,green,blue,alpha,scale,font,a,b,c,d,e,f)
    dxDrawText(string.gsub(text,"(#%x%x%x%x%x%x)",""),x+1,y+1,w+1,h+1,tocolor(0,0,0,alpha),scale,font,a,b,c,d,e,f)
	dxDrawText(text,x,y,w,h,tocolor(red,green,blue,alpha),scale,font,a,b,c,d,e,f)
end

function isMousePosition ( x, y, width, heigth)
    if ( not isCursorShowing() ) then
        return false
    end
	local px, py = guiGetScreenSize()
	local mx,my = getCursorPosition()
    local cX, cY = mx*px,my*py
    if ( cX >= x and cX <= x+width and cY >= y and cY <= y + heigth ) then	    
        return true
    else
        return false
    end
end