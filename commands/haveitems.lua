function item(arg)
    local str = table.concat(arg," ")

	if str == "carlov" or str == "c" or str == "all" then
		if (bit.band(memory.readbyte(0x2002b41), 0x10) == 0x10) then
			memory.writebyte(0x2002b41, memory.readbyte(0x2002b41) - 0x10)
		else
			memory.writebyte(0x2002b41, memory.readbyte(0x2002b41) + 0x10)
		end
	end
	if str == "trophy" or str == "t" or str == "all" then
		if (bit.band(memory.readbyte(0x2002b41), 0x04) == 0x04) then
			memory.writebyte(0x2002b41, memory.readbyte(0x2002b41) - 0x04)
		else
			memory.writebyte(0x2002b41, memory.readbyte(0x2002b41) + 0x04)
		end
	end
	if str == "jabber" or str == "j" or str == "all" then
		if (bit.band(memory.readbyte(0x2002b48), 0x40) == 0x40) then
			memory.writebyte(0x2002b48, memory.readbyte(0x2002b48) - 0x40)
		else
			memory.writebyte(0x2002b48, memory.readbyte(0x2002b48) + 0x40)
		end
	end
	if str == "mushroom" or str == "m" or str == "all" then
		if (bit.band(memory.readbyte(0x2002b40), 0x01) == 0x01) then
			memory.writebyte(0x2002b40, memory.readbyte(0x2002b40) - 0x01)
		else
			memory.writebyte(0x2002b40, memory.readbyte(0x2002b40) + 0x01)
		end
	end
	if str == "lonlonkey" or str == "llk" or str == "all" then
		if (bit.band(memory.readbyte(0x2002b3f), 0x40) == 0x40) then
			memory.writebyte(0x2002b3f, memory.readbyte(0x2002b3f) - 0x40)
		else
			memory.writebyte(0x2002b3f, memory.readbyte(0x2002b3f) + 0x40)
		end
	end
	if str == "gravekey" or str == "gk" or str == "all" then
		if (bit.band(memory.readbyte(0x2002b41), 0x01) == 0x01) then
			memory.writebyte(0x2002b41, memory.readbyte(0x2002b41) - 0x01)
		else
			memory.writebyte(0x2002b41, memory.readbyte(0x2002b41) + 0x01)
		end
	end
	if str == "dogfood" or str == "d" or str == "all" then
		if (bit.band(memory.readbyte(0x2002b3f), 0x10) == 0x10) then
			memory.writebyte(0x2002b3f, memory.readbyte(0x2002b3f) - 0x10)
		else
			memory.writebyte(0x2002b3f, memory.readbyte(0x2002b3f) + 0x10)
		end
	end
end
function i(arg)
	item(arg)
end