do
local analize = function()
	if gotRAW[6] == 4 or gotRAW[6] == 1 or gotRAW[6] == 3 or gotRAW[6] == 5   then
		if itmState.gotRAW[5][2] == 0 then
			itmState.gotRAW[5][2] = itmState.gotRAW[5][3]
			comm = "ON"
		else
			itmState.gotRAW[5][2] = 0
			comm = "OFF"
		end
	elseif gotRAW[6] == 0 then
		itmState.gotRAW[5][2] = 0
		comm = "OFF"
	elseif gotRAW[6] == 2 then 
		itmState.gotRAW[5][2] = itmState.gotRAW[5][3]
		comm = "ON"
	end
	if itmState.gotRAW[5][1] == 2 then
		func = "comf"
	else
		func = "comm"
	end
	newdeal()
end
	analize()		
end