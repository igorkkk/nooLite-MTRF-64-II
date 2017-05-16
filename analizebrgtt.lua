do
local setbrgt = function(startbrgt, direction)
    local stateNo = stateNo
    local brgtnow = startbrgt or 50
    local incr = (direction == 1) and 5 or -5
    local iitm = _G.itmState[stateNo][1] 
    local sendcom = function(br)
        _G.itmState[stateNo][2] = br
        if br >=5 then
            _G.itmState[stateNo][3] = br
        end
        comm = br
        func = "brgt"
        _G.gotRAW = {}
        newdeal()
    end

    return function(call)
        tmr.create():alarm(1000, 1, function(t)
            brgtnow = brgtnow + incr
            if brgtnow > 100 or brgtnow < 0 or runbrt[iitm].stopbr == 1 then
                tmr.stop(t)
                tmr.unregister(t)
				_G.itmState[stateNo][2] = brgtnow
			if brgtnow >=5 then
				brgtnow = (brgtnow < 100) and brgtnow or 100
				_G.itmState[stateNo][3] = brgtnow
			end
                brgtnow, incr, sendcom, iitm = nil, nil, nil, nil
				if call then call() end
            else
                sendcom(brgtnow)
            end
        end)
    end
end

local z = function()
    comm = ""
	if gotRAW[6] == 10 then
		if _G.runbrt[itm] then
		   _G.runbrt[itm].stopbr = 1
		end
		_G.gotRAW = {}
		_G.stateNo = 0
	else
		_G.runbrt[itm] = {}
		_G.runbrt[itm].stopbr = 0
		local zz = itm
		local r = function()
			_G.runbrt[zz].func = nil
			_G.runbrt[zz].stopbr = nil
			_G.runbrt[zz] = nil
			_G.stateNo = 0
			_G.gotRAW = {}
		end
		
		local strt = _G.itmState[stateNo][2]
		local dir = 1
		
		if gotRAW[6] == 1 then
			dir = 0
		elseif gotRAW[6] == 5 then
			if strt < 5 then dir = 1
			elseif strt > 90 then dir = 0
			else dir = (_G.itmState[stateNo][4] == 0) and 1 or 0
			end
		end
	_G.itmState[stateNo][4] = dir
	_G.runbrt[itm].func = setbrgt(strt, dir)
	_G.runbrt[itm].func(r)
        end
end
z()
end
