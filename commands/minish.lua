function minish(arg)
	if memory.readbyte(0x0300116C) ~= 0x09 then
		memory.writebyte(0x0300116C, 0x09)
		memory.writebyte(0x03003FB0, 0x80)
	elseif memory.readbyte(0x0300116C) == 0x09 then
		memory.writebyte(0x0300116C, 0x01)
		memory.writebyte(0x03003FB0, 0x00)
	end
end
function m(arg)
	minish(arg)
end