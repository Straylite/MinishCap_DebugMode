function rupee(arg)
		x = table.concat(arg," ")
		if memory.readbyte(0x02002AE8)==0x00 then
			if tonumber(x)>=100 then
				x = 100
			end
		elseif memory.readbyte(0x02002AE8)==0x01 then
			if tonumber(x)>=300 then
				x = 300
			end
		elseif memory.readbyte(0x02002AE8)==0x02 then
			if tonumber(x)>=500 then
				x = 500
			end
		elseif memory.readbyte(0x02002AE8)==0x03 then
			if tonumber(x)>=999 then
				x = 999
			end
		end
		if tonumber(x)>=0 then
			memory.write_u16_le(0x02002B00, tonumber(x or 0))
		end
end
function rupees(arg)
	rupee(arg)
end
function r(arg)
	rupee(arg)
end
function wallet(arg)
    local str = table.concat(arg," ")
	if str == "100" then 
		memory.writebyte(0x02002AE8, 0x00)
		if memory.readbyte(0x02002B00)>=100 then 
				memory.write_u16_le(0x02002B00, 100)
		end
	elseif str == "300"then
		memory.writebyte(0x02002AE8, 0x01)
		if memory.readbyte(0x02002B00)>=300 then 
				memory.write_u16_le(0x02002B00, 300)
		end
	elseif str == "500"then
		memory.writebyte(0x02002AE8, 0x02)
		if memory.readbyte(0x02002B00)>=500 then 
				memory.write_u16_le(0x02002B00, 500)
		end
	elseif str == "999"then
		memory.writebyte(0x02002AE8, 0x03)
		if memory.readbyte(0x02002B00)>=100 then 
				memory.write_u16_le(0x02002B00, 999)
		end
	end
end
function w(arg)
	wallet(arg)
end