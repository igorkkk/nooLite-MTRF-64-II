do
local analize = function()
    local item = string.format("%02d", gotRAW[5])
    if gotRAW[6] == 0 or gotRAW[6] == 2 or gotRAW[6] == 4 then
		if itmState.item == nil  then
			-- 0 - no dimmed, 0 - light now, 100 - bright state, not F
			itmState.item = {0,0,100,0} 
		end
	
		if gotRAW[6] == 4 then
			if itmState.gotRAW[5][1] == 0 then
				if itmState.gotRAW[5][2] == 0 then
					itmState.gotRAW[5][2] = itmState.gotRAW[5][3]
					comm = "ON"
				else
					itmState.gotRAW[5][2] = 0
					comm = "OFF"
				end
			else
				if itmState.gotRAW[5][2] == 0 then
					itmState.gotRAW[5][2] = itmState.gotRAW[5][3]
					comm = tostring(itmState.gotRAW[5][2])
				else
					itmState.gotRAW[5][2] = 0
					comm = "0"
				end
			end
		elseif gotRAW[6] == 0 then
		
			itmState.gotRAW[5][2] = 0
			comm = "OFF"
		
		
		elseif gotRAW[6] == 2 then 
			itmState.gotRAW[5][2] = itmState.gotRAW[5][3]
			comm = "ON"
		end
		_G.itm = item
		
		
		
		
		if itmState.gotRAW[5][1] == 1 then
			func = "brgt"
		elseif itmState.gotRAW[5][4] == 0 then
			func = "comm"
		elseif
			func = "comf"
		end
		
		
		
		
		newdeal()
		return
	
	
	elseif gotRAW[6] == 0x82 or gotRAW[6] == 25  then
        if gotRAW[11] == 255 then
            answer[item] = "ON"
        else
            answer[item] = "OFF"
        end
    
	
	elseif gotRAW[6] == 0x15 then
        local temp = 0
        local hempH = gotRAW[9]
        local hempL = gotRAW[8]
        temp = bit.lshift(bit.band(hempH, 0x0F),8) + hempL
        if (temp > 0x7FF) then
            temp = temp - 0x1000
        end
        temp = temp * 0.1
        local newitm = item.."/temp"
        answer[newitm] = temp
        if gotRAW[10] ~= 0 then
            newitm = item.."/humi"
            answer[newitm] = gotRAW[10]
        end
    elseif gotRAW[6] == 20 then
        answer.lowbat = item
    end
    gotRAW = {}
    publ()
end
analize()
end
