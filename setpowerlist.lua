do
local cell = cell or ""
local modcell = modcell or "0"
local remove = remove or "88"
local ds = {}

if cell ~= ""  then
    ds[cell] = modcell
end

if file.open("powerlist.lua", "r") then
    local s = file.read('\n')
    while s do
        a, b = string.match(s, "(%d+),(%d+)")
        ds[a] = b
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