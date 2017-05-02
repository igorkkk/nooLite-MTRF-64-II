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
	