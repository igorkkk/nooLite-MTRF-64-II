do
local cell = "11"
local modcell = "0"
local remove = "88"
local ds = {}

ds[cell] = modcell
ds["3"] = "2"

local ex = "65"
if file.open("powerlist.lua", "r") then
    local s = file.read('\n')
    while s do
        a, b = string.match(s, "(%d+),(%d+)")
        if a ~= ex then ds[a] = b end
        s = file.read('\n')
    end
    file.close()
end 
ds[remove] = nil
if file.open("powers.lua", "w") then
    for k, v in pairs(ds) do
        local ss = ""..k..","..v
        file.writeline(ss)
    end
    file.close()
end

if file.open("powers.lua", "r") then
    local s = file.read('\n')
  while s do
    a, b = string.match(s, "(%d+),(%d+)")
    print(a, b)
    s = file.read('\n')
end
file.close()
file.remove("powerlist.lua")
file.rename("powers.lua","powerlist.lua")
end
end