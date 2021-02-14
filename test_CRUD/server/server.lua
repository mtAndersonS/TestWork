local mysql = exports.mysql

function addPlayer( name, surname, area)
local serverTime = getRealTime()
local time = string.format("[%02d:%02d:%02d]", serverTime.hour, serverTime.minute, serverTime.second)
	if name == "" then
		triggerClientEvent(source,"CreateBox", source, "info", "Введите Имя персонажа. Пример: Иван")
		return
	end	
	if surname == "" then
				triggerClientEvent(source,"CreateBox", source, "info", "Введите вашу Фамилию персонажа. Пример: Иванов")
		return
	end	
	if area == "" then
		triggerClientEvent(source,"CreateBox", source, "info", "Введите адрес проживания персонажа. Пример: Ростов")
		return
	end	
	
	local time = getRealTime()
	local hours = time.hour
	local minutes = time.minute
	local seconds = time.second
	local monthday = time.monthday
	local month = 1 + (time.month)
	local year = 1900 + (time.year)
	
	local datatime = tonumber(year..month..monthday..hours..minutes..seconds)

	local id = mysql:query_insert_free("INSERT INTO `account_settings` SET `name`=?, `surname`=?,`area`=? , `datatime`=?;", name, surname,area,datatime)
	   if id then
	   -- outputChatBox(" "..name.." "..surname.." из "..area.." успешно записан в бд")
		getAllPlayers()
	    else
		--outputChatBox(""..time.." Отказ базы данных.")
	   end
end
addEvent("onRequestRegister",true)
addEventHandler("onRequestRegister",getRootElement(),addPlayer)

function getAllPlayers()
    local all = mysql:getAllPlr()
	if all then
	  --  outputChatBox(#all.." записей получено")
		triggerClientEvent( root, "getAllPlayersCl", root ,all);
	    else
		triggerClientEvent( root, "getAllPlayersCl", root ,false);
	--	outputChatBox(" Отказ базы данных.")
	end	
end
addEvent("getAllPlayers",true)
addEventHandler("getAllPlayers",getRootElement(),getAllPlayers)

function updateAllCor(name_cor ,surname_cor,area_cor,selects)
    local upd = mysql:updateCorPlr(name_cor ,surname_cor,area_cor,selects)
	if upd then
        getAllPlayers()
	end		
end
addEvent("updateAllCor",true)
addEventHandler("updateAllCor",getRootElement(),updateAllCor)

function dellSelectsCor(selects)
    local del = mysql:deletePlr(selects)
	if del then
    getAllPlayers()
	end	
end
addEvent("dellSelectsCor",true)
addEventHandler("dellSelectsCor",getRootElement(),dellSelectsCor)

