do
local dealnow
dealnow = function()
    local itm = _G.itm
    pat[5] = itm
    local stateNo = _G.stateNo
    
    if func == "comm" or func == "comf" then
        pat[2] = (func == "comm") and 0 or 2
		if comm == "ON" then 
            pat[6] = 2
            if stateNo == 0 then
                table.insert(itmState,{itm})
            elseif stateNo ~= 0 and itm < 11 then
                itmState[stateNo][2] = itmState[stateNo][3]
            end    
        elseif comm == "OFF" then
            pat[6] = 0
            if stateNo > 0 and itm > 10 then
                itmState[stateNo] = nil
            elseif stateNo > 0 and itm <11  then
				itmState[stateNo][2] = 0
			end
        end
    end

    if func == "coft" then pat[2] = 2
        pat[6] = 25
        local time = tonumber(comm) or 0
        if time < 256 then 
            pat[7] = 5
            pat[8] = time 
        elseif time < 65535 then 
            pat[7] = 6
            pat[8] = bit.band(time, 0xFF)
            pat[9] = bit.rshift(time, 8)
        else
            return
        end
    end

    if func == "askf" then
        pat[2] = 2
        pat[6] =128    
    end
    
    if func == "bitr" then 
       pat[2] = 0
       pat[3] = 0
       if comm == "ON" then pat[6] = 15 
       else pat[6] = 9
       end  
    end

    if func == "bitf" then 
       pat[2] = 2
       pat[3] = 0
       if comm == "ON" then pat[6] = 15 
       else pat[6] = 9
       end  
    end
    
    if func == "birc" then 
       pat[2] = 1 
       pat[3] = 3 
       if comm == "ON" then pat[6] = 15
       else pat[6] = 9
       end  
    end
	comm, itm, func = "", "", ""
	dofile('writeMTRF.lua')
end
dealnow()
end
