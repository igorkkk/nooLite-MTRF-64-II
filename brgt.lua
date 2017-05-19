do
local dealnow
dealnow = function()
    local stateNo = _G.stateNo
    _G.stateNo = 0
    local itm = _G.itm
   
    local dd = tonumber(comm) or 0
    _G.gotRAW = {}
    _G.comm, _G.itm, _G.func = "", "", "" 
        
    if dd > 100 then dd = 100 end
    if dd < 0 then dd = 0 end
    
    if itm > 11 then 
        return 
    end
    local map = function(s)
        if  s <= 35 then return 0 end
        local d = 35 + s*(155-35)/100
        return tonumber(string.format("%d", d))
    end
    pat[5] = itm
    pat[6] = 6
    pat[7] = 1
    pat[8] = map(dd)

    itmState[stateNo][2] = dd
    if pat[8] ~= 0 then
        itmState[stateNo][3] = dd
    end
    answer[string.format("%02d", itm)] = dd
    publ()
    dofile('writeMTRF.lua')
end
dealnow()
end
