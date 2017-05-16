do
local z = function()
    if itm > 10 then
        func = itm > 20 and "comf" or "comm"
        if gotRAW[6] == 0 then
            comm = "OFF"
			if stateNo ~= 0 then
				itmState[stateNo] = nil
			end
		else
            if stateNo == 0 then
				table.insert(itmState,{itm})
            end
			comm = "ON"
         end
     else
        func = "comm"
		if v[1] == itm then
			if itmState[stateNo][2] ~= itmState[stateNo][3] and itmState[stateNo][3] > 4 and gotRAW[6] == 2 then
				itmState[stateNo][2] = itmState[stateNo][3]
				comm = "ON"
			elseif itmState[stateNo][3] < 5 and gotRAW[6] == 2 then 
				itmState[stateNo][2] = 100
				itmState[stateNo][3] = 100
				comm = "ON"
			elseif itmState[stateNo][2] == itmState[stateNo][3] and gotRAW[6] == 0  then
				itmState[stateNo][2] = 0
				comm = "OFF"
			end
		end
    end
	gotRAW = {}
	stateNo = 0
	newdeal() 
end
z()
end
