do
local itmn = gotRAW[5]
local z = function()
    if itmn > 10 then
        func = itmn > 20 and "comf" or "comm"
		if  stateNo ~= 0 then
			comm = "OFF" 
			itmState[stateNo] = nil
		else
            table.insert(itmState,{itmn})
            comm = "ON"
        end
    else
        func = "comm"
		if itmState[stateNo][2] ~= itmState[stateNo][3] and itmState[stateNo][3] > 4 then
			itmState[stateNo][2] = itmState[stateNo][3]
			comm = "ON"
		elseif itmState[stateNo][3] < 5 then 
			itmState[stateNo][2] = 100
			itmState[stateNo][3] = 100
			comm = "ON"
		else 
			itmState[stateNo][2] = 0
			comm = "OFF"
		end
    end
    stateNo = 0
	gotRAW = {}
    newdeal()
end
z()
end
