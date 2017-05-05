
1 - понижать яркость
3 - повышать яркость
5 - изменять яркость
10- стоп изменениям яркости 


do
local gotRAW = {1,2,3,4,29,0,7,8,9,}
local itmState = {
    {11},
    {9,0,15}
} 

itmn = gotRAW[5]
func = ""

local flaggg = false
local cellNo

for k, v in pairs(gotRAW) do
    if v[1] == itmn then
        cellNo = k
    end
end
if not cellNo and itmn <11 then
    cellNo = #gotRAW+1
    gotRAW[cellNo] = {itmn, 0, 100, 0}
end


local z = function()
    
    local state
    if itmn > 10 then
        flaggg  = true
        itmState[itmn] = nil
        
        func = itmn > 20 and "comf" or "comm"
        print("func = "..func)
        
        if gotRAW[6] == 0 then
            comm = "OFF" 
            print("Switch OFF NOW!")
        else
            table.insert(itmState,{itmn})
            print("Switch ON, just NOW!")
            comm = "ON"
         end
    -- for blocks that run brightness
    else
        func = "comm"
        print("func = "..func)
        for k, v in pairs(itmState) do
            if v[1] == itmn then
                state = true
                flaggg = true
                if v[2] ~= v[3] and v[3] > 4 and gotRAW[6] == 2 then
                    v[2] = v[3]
                    print("Cell "..itmn.." Switched ON at "..v[2])
                    comm = "ON"

                elseif v[3] < 5 and gotRAW[6] == 2 then 
                    v[2] = 100
                    v[3] = 100
                    print("Cell "..itmn.." Switched ON at "..v[2])
                    comm = "ON"
                elseif v[2] == v[3] and gotRAW[6] == 0  then
                    v[2] = 0
                    print("Cell "..itmn.." Switched OFF ")
                    comm = "OFF"
                else
                    flaggg = false
                end
                -- break
            end
        end
        if not state then
            print("Cell "..itmn.." is new, made record")
            if gotRAW[6] == 2 then 
                table.insert(itmState,{itmn,100,100})
                comm = "ON"
            else
                table.insert(itmState,{itmn,0,100})
                comm = "OFF"
            end
            flaggg = true
        end 
   --]]
    end
    print(itmn, func, comm, flaggg)
-- if flaggg then newdeal() end
end

z()
end