do
local dealnow
dealnow = function()
    if itm > 11 then 
        _G.gotRAW = {}
        _G.stateNo = 0
        return 
    end
    local map = function(s)
        if  s == 0 then return s end
        local d = 35 + s*(155-35)/100
        return tonumber(string.format("%d", d))
    end
    pat[5] = itm
    local dd = tonumber(comm)
    if type(dd) ~= "number" or dd > 100 then 
        comm, itm, func = "", "", "" 
        _G.gotRAW = {}
        _G.stateNo = 0
        return 
    end
    pat[6] = 6
    pat[7] = 1
    pat[8] = map(dd)
    itmState[stateNo][2] = dd
    if pat[8] ~= 0 then
        itmState[stateNo][3] = dd
    else
		itmState[stateNo][3] = 5
	end
    _G.gotRAW = {}
    dofile('writeMTRF.lua')
end
dealnow()
end
