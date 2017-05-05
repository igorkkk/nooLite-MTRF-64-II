-- itmState = {} - table contains power blocks state
-- no record - power block is switched OFF
-- {%d} - d - cell number, switched ON
-- {%d,%d,%d} - cell number, brghtness now, brightness at block memory

-- blocks No<10 run brightness
-- blocks No>20 are new F type
-- You can change that order

-- comm = "" 
-- itm = "" 
-- func = ""

do
local gotRAW = {1,2,3,4,8,4,7,8,9,}
local itmState = {
    {11},
    {9,15,15}
} 

itmn = gotRAW[5]
func = ""
local z = function()

    local state
    if itmn > 10 then
        func = itmn > 20 and "comf" or "comm"
        print("func = "..func)
        for k, v in pairs(itmState) do
            if v[1] == itmn then
                state = "ON"
                comm = "OFF" 
                print("Switch OFF NOW!")
                itmState[k] = nil
            end
        end
        if not state then
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
                if v[2] ~= v[3] and v[3] > 4 then
                    v[2] = v[3]
                    print("Cell "..itmn.." Switched ON at "..v[2])
                    comm = "ON"

                elseif v[3] < 5 then 
                    v[2] = 100
                    v[3] = 100
                    print("Cell "..itmn.." Switched ON at "..v[2])
                    comm = "ON"
                else 
                    v[2] = 0
                    print("Cell "..itmn.." Switched OFF ")
                    comm = "OFF"
                end
                break
            end
        end
        if not state then
            table.insert(itmState,{itmn,100,100})
            print("Cell "..itmn.." is new and Switched ON")
            comm = "ON"
        end 
   --]]
    end
print(itm, func, comm)
 -- newdeal()
end

z()
tmr.create():alarm(3000, 0, function() z() end)
end