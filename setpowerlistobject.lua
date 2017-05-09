-- works
do

local cell = cell or ""
local modcell = modcell or "0"
local remove = remove or "88"
    
_G.sell = ""
_G.remove = "88"

cell = "2"
modcell = "0"
remove = "7"

lst = file.open("powerlist.lua", "r")
if lst then
  tmpf = file.open("powers.lua", "w")
  if tmpf then
    local line
    repeat
      line = lst:read("\n")
      if line then
        local a = string.match(line, "^(%d+)")
		if a ~= remove and a~= cell then
			tmpf:write(line)
		end
	  end
    until line == nil
    if cell ~= "" then
		line = ""..cell..","..modcell.."\n"
		tmpf:write(line)
	end
	tmpf:close(); tmpf = nil
  end
  lst:close(); lst = nil
end
file.remove("powerlist.lua")
file.rename("powers.lua","powerlist.lua")

end
