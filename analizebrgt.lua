--[[
1 - понижать яркость
3 - повышать яркость
5 - изменять яркость
10- стоп изменениям яркости 
--]]
do
local gotRAW = {1,2,3,4,9,3,7,8,9,}
local itmState = {
    {11},
    {9,0,15,true},
	{8,50,50,true}
} 

local itmn = gotRAW[5]
print("get cell "..itmn)
func = ""
local cellNo
for k, v in pairs(itmState) do
    if v[1] == itmn then
        cellNo = k
    end
end

if not cellNo and itmn <11 then
    cellNo = #gotRAW+1
    itmState[cellNo] = {itmn, 0, 50, true}
end
--
stopbr = false -- global var
local setbrgt = function(ceNo, cell, startbrgt, direction)
	local brgtnow = startbrgt or 50
	local incr = direction and 5 or -5
	itmState[ceNo][4] = direction
	local sendcom = function(br)
		print( "cell: "..cell.." set at "..br)
		itmState[ceNo][2] = br
		itmState[ceNo][3] = br
		comm = br
		func = "brgt"
		item = ""..cell
		-- newdeal()
	end
	return function(call)
		tmr.create():alarm(1000, 1, function(t) 
			brgtnow = brgtnow + incr
			if brgtnow > 100 or brgtnow < 0 or stopbr then 
				tmr.stop(t)
				tmr.unregister(t) 
				if call then 
					brgtnow, incr, sendcom = nil, nil, nil 
					call() 
				end
			else
				sendcom(brgtnow)
			end
		end)
	end
end
--]]
local z = function()
    local state
    if itmn > 10 then
        func = itmn > 20 and "comf" or "comm"
        print("func = "..func)
        if gotRAW[6] == 1 and cellNo >= 0 then
			itmState[cellNo] = nil
			comm = "OFF" 
			print("Switch OFF NOW!")
		elseif gotRAW[6] == 3 and not cellNo then
            table.insert(itmState,{itmn})
            print("Switch ON, just NOW!")
            comm = "ON"
        elseif gotRAW[6] == 5 then
            if not cellNo then
                table.insert(itmState,{itmn})
                print("Switch ON, just NOW!")
                comm = "ON"
            else
                itmState[cellNo] = nil
                comm = "OFF" 
                print("Switch OFF NOW!")
            end
        end
        print(itmn, func, comm)
		-- newdeal()
	else
		if gotRAW[6] == 10 then 
			stopbr = true 
		else
			local wr
			local r = function()
				wr = nil
			end
			if gotRAW[6] == 1 then
				wr = setbrgt(cellNo, itmn, itmState[cellNo][2], false)
			elseif gotRAW[6] == 3 then
				wr = setbrgt(cellNo, itmn, itmState[cellNo][2], true)
			elseif gotRAW[6] == 5 then
				local dir = not itmState[cellNo][4]
				wr = setbrgt(cellNo, itmn, itmState[cellNo][2], dir)
			end
		wr(r)
		end
	end 
   --]]
end
z()
end
