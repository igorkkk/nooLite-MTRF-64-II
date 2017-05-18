do
local setbrgt = function(brgtnow, direction, iitm, stateNo)
    local patt = {171,0,0,0,0,6,1,0,0,0,0,0,0,0,0,0,172}
    patt[5] = iitm
    patt[8] = brgtnow
    local incr = (direction == 1) and 6 or -6
    
    local sendcom = function(brgtnow)
        patt[8] = brgtnow
        local cr = 0
        local i
        for i = 1, 15 do
            cr = cr + patt[i]     
        end
        patt[16] = bit.band(cr, 0xFF)
		for i=1,17 do
            uart.write(0, patt[i])
        end
    end
    
    sendcom(brgtnow)
    
    return function(call)
        tmr.create():alarm(1000, 1, function(t)
 			brgtnow = brgtnow + incr
            if brgtnow > 155 or brgtnow < 35 or runbrt[iitm].stopbr == 1 then
				tmr.stop(t)
                tmr.unregister(t)
                brgtnow = tonumber(string.format("%d", (patt[8]-35)*100/120))
                _G.itmState[stateNo][2] = brgtnow
                if brgtnow > 5 then
                    _G.itmState[stateNo][3] = (brgtnow < 100) and brgtnow or 100
                else
                    _G.itmState[stateNo][3] = 5
                end
                answer[string.format("%02d",iitm)] = brgtnow
                publ()
                brgtnow, incr, sendcom, iitm = nil, nil, nil, nil
                if call then call() end
            else
                sendcom(brgtnow)
            end
        end)
    end
end

local z = function()
    local litm = itm
	local stateNo = _G.stateNo
	local com = gotRAW[6]
    _G.stateNo = 0
	_G.gotRAW = {}
	if stateNo == 0 then return end
	
	if com == 10 then
		if _G.runbrt[litm] then
           print("got Stop!")
		   _G.runbrt[litm].stopbr = 1
		   print("_G.runbrt[litm].stopbr = ", _G.runbrt[litm].stopbr)
        end
    else
		_G.runbrt[litm] = {}
        _G.runbrt[litm].stopbr = 0
        local r = function()
            _G.runbrt[litm].func = nil
            _G.runbrt[litm].stopbr = nil
            _G.runbrt[litm] = nil
        end
        
        local strt = tonumber(string.format("%d", (35 + _G.itmState[stateNo][2]*(120)/100)))
        local dir = 1
        if com == 1 then
            dir = 0
        elseif com == 5 then
            if strt < 5 then dir = 1
            elseif strt > 90 then dir = 0
            else dir = (_G.itmState[stateNo][4] == 0) and 1 or 0
            end
        end
        _G.itmState[stateNo][4] = dir
        _G.runbrt[litm].func = setbrgt(strt, dir, litm, stateNo)
        _G.runbrt[litm].func(r)
     end
end
z()
end
