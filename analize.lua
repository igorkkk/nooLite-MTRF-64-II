do
local analize = function()
    itm = gotRAW[5]
    stateNo = 0
    local srchNo = function()
        for ks, vs in pairs(itmState) do
            if vs[1] == itm then
                stateNo = ks
            end
        end
    end
    srchNo()
    if stateNo == 0 and itm <11 then
        table.insert(itmState, {itm, 50, 100, 0})
        srchNo()    
    end
 
	local map = function(s)
		if s < 35 then return 0 end
		if s > 155 then return 100 end
		return (s-35)*(100)/(120)
	end
--
		
	if  (gotRAW[2] == 1 or gotRAW[2] == 3) then
		---[[
        if  itm > 10 then
            if gotRAW[6] == 5 then gotRAW[6] = 4 end
            if gotRAW[6] == 1 then gotRAW[6] = 0 end
            if gotRAW[6] == 3 then gotRAW[6] = 2 end
            if gotRAW[6] == 10 then 
				_G.stateNo = 0
				_G.gotRAW = {}
				return 
			end
        end
		--]]
		
		if gotRAW[6] == 4 then
			dofile('analizedesks4.lua')
			return
		end
		if gotRAW[6] == 2 or gotRAW[6] == 0 then
			dofile('analizedesks02.lua')
			return
		end
		if gotRAW[6] == 1 or gotRAW[6] == 3 or gotRAW[6] == 5 or gotRAW[6] == 10  then
			dofile('analizebrgtt.lua')
			return
		end
	end
--]]
    local itms = string.format("%02d", gotRAW[5])

	if gotRAW[3] == 0 then
		if gotRAW[6] == 0 then
			answer[itms] = 0
			if stateNo == 0 and itm > 10 then
				itmState[stateNo] = nil
			elseif stateNo then
				itmState[stateNo][2] = 0
			end
		
		elseif gotRAW[6] == 2 then
			if stateNo == 0 then
				table.insert(itmState,{itm})
			else
				answer[itms] = itmState[stateNo][3] or 100
				itmState[stateNo][2] = itmState[stateNo][3]
			end
	end
	
	elseif gotRAW[6] == 130 or gotRAW[6] == 25  then
		if gotRAW[11] == 255 then
    		answer[itms] = 100
       	    if stateNo == 0 then
           		table.insert(itmState,{itm})
	        end
		else
    	    answer[itms] = 0
    	    if stateNo ~=0 then
    		    itmState[stateNo] = nil
		    end
		end

	elseif gotRAW[6] == 6 then
		answer[itms] = string.format("%d", map(gotRAW[8]))
	
	elseif gotRAW[6] == 21 then
		local temp = 0
		local hempH = gotRAW[9]
		local hempL = gotRAW[8]
		temp = bit.lshift(bit.band(hempH, 0x0F),8) + hempL
		if (temp > 0x7FF) then
			temp = temp - 0x1000
		end
		temp = temp * 0.1
		local newitm = itms.."/temp"
		answer[newitm] = temp
		if gotRAW[10] ~= 0 then
			newitm = itms.."/humi"
			answer[newitm] = gotRAW[10]
		end
	
	elseif gotRAW[6] == 20 then
		answer.lowbat = itms
	end
    
	_G.stateNo = 0
	_G.gotRAW = {}
	if answerFlag == true then publ() end
end
analize()
end
