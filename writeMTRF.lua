do
 local cr = 0
    
    for i = 1, 15 do
        cr = cr + pat[i]     
    end
    cr = bit.band(cr, 0xFF)
    pat[16] = cr
    pat[17] = 172
    -- uart.alt(1)
    -- uart.setup(0, 9600, 8, uart.PARITY_NONE, uart.STOPBITS_1, 0)
    for i=1,17 do
        uart.write(0, pat[i])
    end
    comm, itm, func = "", "", ""
    _G.gotRAW = {}
    _G.stateNo = 0
end
