do
local analize = function()
 	itm = string.format("%02d", gotRAW[5])
	if itmState.gotRAW[5][1] == 0 or itmState.gotRAW[5][1] == 2 then
		dofile('analizeold.lua')
		return
	end
	if itmState.gotRAW[5][1] == 1 then
		dofile('analizebrgt.lua')
		return
	end

	if gotRAW[6] == 0x82 or gotRAW[6] == 25  then
        if gotRAW[11] == 255 then
            answer[itm] = "ON"
        else
            answer[itm] = "OFF"
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
        local newitm = itm.."/temp"
        answer[newitm] = temp
        if gotRAW[10] ~= 0 then
            newitm = itm.."/humi"
            answer[newitm] = gotRAW[10]
        end
    elseif gotRAW[6] == 20 then
        answer.lowbat = itm
    end
    gotRAW = {}
    publ()
end
analize()
end
