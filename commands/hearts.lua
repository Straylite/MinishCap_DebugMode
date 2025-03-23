function hearts(arg)
    local str = table.concat(arg," ")
	if str == "all" then
		memory.writebyte(0x02002AEB, 0xA0)
		memory.writebyte(0x02002AEA, 0xA0)
	elseif tonumber(str) then
		if tonumber(str)>=20 then
			str=tonumber(20)
		end
		if tonumber(str)<=1 then
			str=tonumber(1)
		end
		if tonumber(str)>=1 and tonumber(str)<=20 then
			str = tonumber(str) * 8
			--str = string.format('0x%02x',str)
			--print(str)
			memory.writebyte(0x02002AEB, str)
			memory.writebyte(0x02002AEA, str)
		end
	end
end
function heart(arg)
	hearts(arg)
end
function h(arg)
	hearts(arg)
end