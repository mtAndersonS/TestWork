local screenW,screenH = guiGetScreenSize()
local px,py = 1920,1080
local x,y = (screenW/px), (screenH/py)

removeCache()

font = {}
font.Bold = dxCreateFont('font/Gilroy-Bold.ttf', 12) or 'default'
font.TEXT = dxCreateFont('font/Gilroy-Black.ttf', 15) or 'default'
font.WIN = dxCreateFont('font/Gilroy-Black.ttf', 26) or 'default'
font.WIN2 = dxCreateFont('font/Gilroy-Black.ttf', 20) or 'default'



local accoutns = {}
local accoutns_cash = {}

function getAllPlayersCl(all)
    accoutns = {};
	if all then
    for i,v in ipairs(all) do
        table.insert(accoutns,{v["name"],v["surname"],v["area"],v["datatime"]})
    end
	accoutns_cash = accoutns
	else
	accoutns = {}
    accoutns_cash = {}
	end
 end

addEvent("getAllPlayersCl",true)
addEventHandler("getAllPlayersCl",root,getAllPlayersCl)

local chekStart = 0

local str = 0
local selects = 0

local name = ""
local surname = ""
local area = ""

local dellAcc = 0

function draw()
---======================================== Новый пользователь
	roundedRectangle ( 10*x, 10*y, 400*x, 290*y, tocolor( 100, 100, 100,255) );	
	dxDrawText('Новый пользователь', 40*x, 20*y, 200*x, 22*y, tocolor( 255, 255, 255, 150), 1, 1, font.WIN2)

    createEditBox (30*x, 70*y, 350*x, 40*y, 1, 1, font.Bold, 'name', 'Имя' );
	createEditBox (30*x, 120*y, 350*x, 40*y, 1, 1, font.Bold, 'surname', 'Фамилия' );
    createEditBox (30*x, 170*y, 350*x, 40*y, 1, 1, font.Bold, 'area', 'Адрес' );

	if isMousePosition (50*x, 230*y, 300*x, 40*y) then
	    roundedRectangle ( 50*x, 230*y, 300*x, 40*y, tocolor( 50, 50, 50) );	
		dxDrawText('Добавить', 90*x, 232.5*y, 300*x, 40*y, tocolor( 255, 255, 255, 255), 1, 1, font.TEXT)
		else
		roundedRectangle ( 50*x, 230*y, 300*x, 40*y, tocolor( 40, 40, 40) );	
		dxDrawText('Добавить', 90*x, 232.5*y, 300*x, 40*y, tocolor( 255, 255, 255, 150), 1, 1, font.TEXT)
	end
---========================================= Список пользователей
    roundedRectangle ( 420*x, 10*y, 800*x, 590*y, tocolor( 100, 100, 100,255) );	
	dxDrawText('Список пользователей', 440*x, 20*y, 400*x, 22*y, tocolor( 255, 255, 255, 150), 1, 1, font.WIN2)
		  
	dxDrawText((str*10).." | "..#accoutns, 840*x, 20*y, 400*x, 22*y, tocolor( 255, 255, 255, 150), 1, 1, font.WIN2)
		   
	if isMousePosition (960*x, 20*y, 40*x, 40*y) then
		roundedRectangle ( 960*x, 20*y, 40*x, 40*y,  tocolor( 50, 50, 50,255) );
		dxDrawText('<', 970*x, 20*y, 40*x, 40*y, tocolor( 255, 255, 255, 150), 1, 1, font.WIN2)
		else
		roundedRectangle ( 960*x, 20*y, 40*x, 40*y,  tocolor( 30, 30, 30,255) );
		dxDrawText('<', 970*x, 20*y, 40*x, 40*y, tocolor( 200, 200, 200, 150), 1, 1, font.WIN2)
	end
		dxDrawText((str+1), 1010*x, 20*y, 400*x, 22*y, tocolor( 255, 255, 255, 150), 1, 1, font.WIN2)
		   
	if isMousePosition (1080*x, 20*y, 40*x, 40*y) then
		roundedRectangle ( 1080*x, 20*y, 40*x, 40*y,  tocolor( 50, 50, 50,255) );
		dxDrawText('>', 1090*x, 20*y, 40*x, 40*y, tocolor( 255, 255, 255, 150), 1, 1, font.WIN2)
		else
        roundedRectangle ( 1080*x, 20*y, 40*x, 40*y,  tocolor( 30, 30, 30,255) );
		dxDrawText('>', 1090*x, 20*y, 40*x, 40*y, tocolor( 200, 200, 200, 150), 1, 1, font.WIN2)
    end
		  
		roundedRectangle ( 450*x, 70*y, 740*x, 510*y, tocolor( 50, 50, 50,255) );
		  
	local colorTexta = tocolor(100, 100, 100, 255)
    local colora = tocolor(30, 30, 30, 255)
	
	if #accoutns > 0 then
		  
	for i,v in ipairs(accoutns) do
	    if v[4] == selects then 
	        colora = tocolor(50, 150, 50, 255) 
	        colorTexta = tocolor(200, 200, 200, 255) 
	        else 	
	        colorTexta = tocolor(100, 100, 100, 255)
            colora = tocolor(30, 30, 30, 255) 
	    end
	    i=i+chekStart
	    local cheks = i*50
		    if ((40+cheks)*y) > (40*y) and ((40+cheks)*y+510*y) > ((40+cheks)*y+cheks*y)then
		        if isMousePosition(460*x, (30+cheks)*y, 720*x, 40*y) then colora = tocolor(70, 70, 70, 255) colorTexta = tocolor(255, 255, 255, 255)  end
		            roundedRectangle ( 460*x, (30+cheks)*y, 720*x, 40*y, colora );
		            dxDrawText(v[1],  500*x, (40+cheks)*y, 200*x, 40*y, colorTexta, 1, 1, font.Bold, "left","top",false,false)
		            dxDrawText(v[2],  670*x, (40+cheks)*y, 200*x, 40*y, colorTexta, 1, 1, font.Bold, "left","top",false,false)
		            dxDrawText(v[3],  870*x, (40+cheks)*y, 1200*x, 900*y, colorTexta, 1, 1, font.Bold, "left","top",true,false)
		            colorTexta = tocolor(100, 100, 100, 255)
                    colora = tocolor(30, 30, 30, 255)
		        end
	end
	else
	dxDrawText("Загрузка..." , 500*x, (40+50)*y, 200*x, 40*y, colorTexta, 1, 1, font.Bold, "left","top",false,false)
	end
		  
		dxText("Имя",470*x, 70*y, 200*x, 30*y ,255,255,255,150,1,font.Bold,"left","top",true,false,false,false) 
---========================================= Поиск пользователей
    roundedRectangle ( 10*x, 310*y, 400*x, 290*y, tocolor( 100, 100, 100,255) );	
	dxDrawText('Поиск пользователей', 40*x, 320*y, 200*x, 22*y, tocolor( 255, 255, 255, 150), 1, 1, font.WIN2)	
     
	createEditBox (30*x, 370*y, 350*x, 40*y, 1, 1, font.Bold, 'search', 'Имя,Фамилия или Адрес' );		  
		  
	if isMousePosition (50*x, 430*y, 300*x, 40*y) then
	   roundedRectangle ( 50*x, 430*y, 300*x, 40*y, tocolor( 50, 50, 50) );	
	   dxDrawText('Поиск', 90*x, 432.5*y, 300*x, 40*y, tocolor( 255, 255, 255, 255), 1, 1, font.TEXT)
	   else
	   roundedRectangle ( 50*x, 430*y, 300*x, 40*y, tocolor( 40, 40, 40) );	
	   dxDrawText('Поиск', 90*x, 432.5*y, 300*x, 40*y, tocolor( 255, 255, 255, 150), 1, 1, font.TEXT)
	end
		
---========================================= Редактирование данных
    if name ~= "" then
    roundedRectangle ( 420*x, 610*y, 800*x, 290*y, tocolor( 100, 100, 100,255) );	
    dxDrawText('Редактирование данных', 440*x, 620*y, 200*x, 22*y, tocolor( 255, 255, 255, 150), 1, 1, font.WIN2)

    createEditBox (430*x, 670*y, 400*x, 40*y, 1, 1, font.Bold, 'name_cor', 'Имя' );
    createEditBox (430*x, 720*y, 400*x, 40*y, 1, 1, font.Bold, 'surname_cor', 'Фамилия' );
    createEditBox (430*x, 770*y, 400*x, 40*y, 1, 1, font.Bold, 'area_cor', 'Адрес' );

	if isMousePosition (430*x, 830*y, 400*x, 40*y) then
	   roundedRectangle ( 430*x, 830*y, 400*x, 40*y, tocolor( 50, 50, 50) );	
	   dxDrawText('Сохранить изменения', 460*x, 832.5*y, 400*x, 40*y, tocolor( 255, 255, 255, 255), 1, 1, font.TEXT)
	   else
	   roundedRectangle ( 430*x, 830*y, 400*x, 40*y, tocolor( 40, 40, 40) );	
	   dxDrawText('Сохранить изменения', 460*x, 832.5*y, 400*x, 40*y, tocolor( 255, 255, 255, 150), 1, 1, font.TEXT)
	end
	
	if  isMousePosition (850*x, 720*y, 300*x, 50*y) then
	    roundedRectangle ( 850*x, 720*y, 300*x, 50*y, tocolor( 50, 50, 50) );	
		dxDrawText('Удалить аккаунт', 880*x, 725*y, 300*x, 50*y, tocolor( 255, 255, 255, 255), 1, 1, font.TEXT)
		else
		roundedRectangle ( 850*x, 720*y, 300*x, 50*y, tocolor( 40, 40, 40) );	
		dxDrawText('Удалить аккаунт', 880*x, 725*y, 300*x, 50*y, tocolor( 255, 255, 255, 150), 1, 1, font.TEXT)
	end
    end
---========================================= Удалить аккаунт

    if dellAcc ~= 0 then
		roundedRectangle ( (screenW/2-100)*x, (screenH/2-100)*y, 400*x, 290*y, tocolor( 120, 100, 100,255) );	
		dxDrawText('Удалить аккаунт ?', (screenW/2-80)*x, (screenH/2-80)*y, 200*x, 22*y, tocolor( 255, 255, 255, 255), 1, 1, font.WIN2)

		if isMousePosition ((screenW/2-80)*x, (screenH/2-20)*y, 100*x, 40*y) then
			roundedRectangle ( (screenW/2-80)*x, (screenH/2-20)*y, 100*x, 40*y, tocolor( 50, 50, 50) );	
			dxDrawText('ДА', (screenW/2-70)*x, (screenH/2-18)*y, 100*x, 40*y, tocolor( 255, 255, 255, 255), 1, 1, font.TEXT)
		else
			roundedRectangle ( (screenW/2-80)*x, (screenH/2-20)*y, 100*x, 40*y, tocolor( 40, 40, 40) );	
			dxDrawText('ДА', (screenW/2-70)*x, (screenH/2-18)*y, 100*x, 40*y, tocolor( 255, 255, 255, 150), 1, 1, font.TEXT)
		end
		
		if isMousePosition ((screenW/2+130)*x, (screenH/2-20)*y, 100*x, 40*y) then
			roundedRectangle ( (screenW/2+130)*x, (screenH/2-20)*y, 100*x, 40*y, tocolor( 50, 50, 50) );	
			dxDrawText('НЕТ', (screenW/2+140)*x, (screenH/2-18)*y, 100*x, 40*y, tocolor( 255, 255, 255, 255), 1, 1, font.TEXT)
		else
			roundedRectangle ( (screenW/2+130)*x, (screenH/2-20)*y, 100*x, 40*y, tocolor( 40, 40, 40) );	
			dxDrawText('НЕТ', (screenW/2+140)*x, (screenH/2-18)*y, 100*x, 40*y, tocolor( 255, 255, 255, 150), 1, 1, font.TEXT)
		end
    end
end

local timers = false

function but(button,state)
	if (button=="left" and state=="down") then
		boxClick = false
		return false
	end
	
	if dellAcc ~= 0 then
	    if isMousePosition ((screenW/2-80)*x, (screenH/2-20)*y, 100*x, 40*y) then 
	        if timers then 
				outputChatBox("не торопись")
				else
				triggerServerEvent("dellSelectsCor",localPlayer, dellAcc)
				dellAcc = 0
				editBox["name_cor"].text = ""
				editBox["surname_cor"].text = ""
				editBox["area_cor"].text = ""
				name = ""
				surname = ""
				area = ""
				selects = 0
				timers = true
				setTimer(function()
					timers = false
					end,1100,1)
			end
		else
		dellAcc = 0
		end
	end
	
	if dellAcc == 0 then
	for i,v in ipairs(accoutns) do
	    i=i+chekStart
	    local cheks = i*50
		if ((40+cheks)*y) > (40*y) and ((40+cheks)*y+510*y) > ((40+cheks)*y+cheks*y)then
			if isMousePosition(460*x, (40+cheks)*y, 720*x, 800*y) then 
			else
			editBox["name_cor"].text = ""
			editBox["surname_cor"].text = ""
			editBox["area_cor"].text = ""
			name = ""
			surname = ""
			area = ""
			selects = 0
			end
		
			if isMousePosition(460*x, (30+cheks)*y, 720*x, 40*y) then 
			selects = v[4] 
			editBox["name_cor"].text = v[1]
			editBox["surname_cor"].text = v[2]
			editBox["area_cor"].text = v[3]
			name = v[1]
			surname = v[2]
			area = v[3]
			break
			end
		end
	end
	end

	if isMousePosition (1080*x, 20*y, 40*x, 40*y) then -- >
		if #accoutns >= (-chekStart) then
		    str = str + 1
			chekStart = (-str) * 10
			selects = 0
		end
	end
		
	if isMousePosition (960*x, 20*y, 40*x, 40*y) then -- <
		if str > 0 then
		    str = str - 1
			chekStart = (-str) * 10
			selects = 0
		end
	end
		
	if isMousePosition(30*x, 70*y, 350*x, 40*y) then -- ввод 
		boxClick = "name"
	end
	if isMousePosition(30*x, 120*y, 350*x, 40*y) then -- ввод 
		boxClick = "surname"
	end
	if isMousePosition(30*x, 170*y, 350*x, 40*y) then -- ввод 
		boxClick = "area"
	end
	if isMousePosition(430*x, 670*y, 400*x, 40*y) then -- _cor
		boxClick = "name_cor"
	end
	if isMousePosition(430*x, 720*y, 400*x, 40*y) then -- _cor 
		boxClick = "surname_cor"
	end
	if isMousePosition(430*x, 770*y, 400*x, 40*y) then -- _cor 
		boxClick = "area_cor"
	end
	if isMousePosition(30*x, 375*y, 350*x, 40*y) then -- поиск 
		boxClick = "search"
	end
			
	if isMousePosition(50*x, 430*y, 300*x, 40*y) then -- поиск кнопка
		local srch = editBox["search"].text
		if srch ~= "" then
			local tbl = {}
			accoutns = accoutns_cash
			for i,v in ipairs(accoutns) do
			    if srch == v[1] or srch == v[2] or srch == v[3] then
				table.insert(tbl,{v[1],v[2],v[3],v[4]})
			    end
			end
			accoutns = tbl
		else
		accoutns = accoutns_cash
		end
	str = 0
	chekStart = 0
	selects = 0
	end
			
	if isMousePosition(430*x, 830*y, 400*x, 40*y) then -- сохранить кнопка
		local name_cor = editBox["name_cor"].text 
		local surname_cor = editBox["surname_cor"].text 
		local area_cor = editBox["area_cor"].text 
		   
        if name ~= name_cor or surname ~= surname_cor or area ~= area_cor then
		    if selects ~= 0 then
				if timers then 
				outputChatBox("не торопись")
				else
				triggerServerEvent("updateAllCor",localPlayer, name_cor ,surname_cor,area_cor,selects)
				timers = true
				setTimer(function()
				timers = false
				end,1100,1)
				end
			end
		end
	end
		
	if isMousePosition (850*x, 720*y, 300*x, 50*y) then -- удалить кнопка
		if selects ~= 0 then
		dellAcc = selects
		end
	end
		
    if isMousePosition (50*x, 230*y, 300*x, 40*y) then -- кнопка добавить
		if timers then 
		outputChatBox("не торопись")
		else

			if string.len(editBox["name"].text) < 1 then
			--triggerEvent("CreateBox",localPlayer,"error", "Имя должно быть не менее 1-го символа.")
			--elseif string.len(editBox["name"].text) >= 15 then
			--triggerEvent("CreateBox",localPlayer,"error","Имя должно быть не более 15-ти символов.")
			elseif string.len(editBox["surname"].text) < 1 then
			--triggerEvent("CreateBox",localPlayer,"error","Фамилия должна быть не менее 1-го символа.")
			--elseif string.len(editBox["surname"].text) >= 15 then
			--triggerEvent("CreateBox",localPlayer,"error","Фамилия должна быть не более 15-ти символов.")
			elseif string.len(editBox["area"].text) < 1 then
			--triggerEvent("CreateBox",localPlayer,"error", "Место жительства должно быть не менее 1-го символа.")
			--elseif string.len(editBox["area"].text) >= 15 then
			--triggerEvent("CreateBox",localPlayer,"error","Место жительства должно быть не более 15-ти символов.")
			elseif string.find(editBox["name"].text, "'") or string.find(editBox["name"].text, '"') then
			--triggerEvent("CreateBox",localPlayer,"error","В имени не должно быть ' или " .. '"')
			--elseif string.match(editBox["name"].text, "%W") then
			--triggerEvent("CreateBox",localPlayer,"error","\"!@#$\"%'^&*()\" не доступны.")
			elseif string.find(editBox["surname"].text, "'") or string.find(editBox["surname"].text, '"') then
			--triggerEvent("CreateBox",localPlayer,"error","В фамилии не должно быть ' или " .. '"')
			--elseif string.match(editBox["surname"].text, "%W") then
			--triggerEvent("CreateBox",localPlayer,"error","\"!@#$\"%'^&*()\" не доступны.")
			elseif string.find(editBox["area"].text, "'") or string.find(editBox["area"].text, '"') then
			--triggerEvent("CreateBox",localPlayer,"error","В Место жительства не должно быть ' или " .. '"')
			--elseif string.match(editBox["area"].text, "%W") then
			--triggerEvent("CreateBox",localPlayer,"error","\"!@#$\"%'^&*()\" не доступны.")
			else
			triggerServerEvent("onRequestRegister",localPlayer, editBox["name"].text ,editBox["surname"].text,editBox["area"].text)
			timers = true
			setTimer(function()
			timers = false
			end,1100,1)
			end
	    end
    end
end

local open = false

Block_Tec = { "arrow_l", "arrow_u",
 "arrow_r", "arrow_d", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k",
 "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "num_0", "num_1", "num_2", "num_3", "num_4", "num_5",
 "num_6", "num_7", "num_8", "num_9", "num_mul", "num_add", "num_sep", "num_sub", "num_div", "num_dec", "num_enter", "F1", "F2", "F3", "F4", "F5",
 "F6", "F7", "F8", "F9", "F10", "F11", "F12", "escape", "tab", "lalt", "ralt", "enter", "space", "pgup", "pgdn", "end", "home",
 "insert", "delete", "lshift", "rshift", "lctrl", "rctrl", "[", "]", "pause", "capslock", "scroll", ";", ",", "-", ".", "/", "#", "\\", "=" }
 
addEventHandler("onClientKey", root, 
    function(button, press)
		if isEventHandlerAdded("onClientRender", getRootElement(), draw) then  
			for index, keys in pairs(Block_Tec) do
                if button == keys and press then
				    if keys == "l" and not boxClick then
                    showChat(true)
                    showCursor(false)
	                removeEventHandler("onClientRender",root,draw)
	                removeEventHandler("onClientClick",root,but)
                    else
                    cancelEvent()
				    end
                end
			end
		else
			if button == "l" and press then
				showChat(false)
	            showCursor(true)
	            addEventHandler("onClientRender",root,draw)
	            addEventHandler("onClientClick",root,but)
				if #accoutns_cash ~= 0 then
					accoutns = accoutns_cash
				    else
					triggerServerEvent("getAllPlayers",localPlayer)
					end
			end
        end
    end
)		
						   
function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
	if 
		type( sEventName ) == 'string' and 
		isElement( pElementAttachedTo ) and 
		type( func ) == 'function' 
	then
		local aAttachedFunctions = getEventHandlers( sEventName, pElementAttachedTo )
		if type( aAttachedFunctions ) == 'table' and #aAttachedFunctions > 0 then
			for i, v in ipairs( aAttachedFunctions ) do
				if v == func then
					return true
				end
			end
		end
	end

	return false
end

