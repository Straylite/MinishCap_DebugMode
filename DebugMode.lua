if _VERSION == "Lua 5.4" then
    unpack = table.unpack
    bit.band = function(a, b) return a & b end
    bit.bor = function(a, b) return a | b end
    bit.bnot = function(a) return ~a end
    bit.lshift = function(a, b) return a << b end
    bit.rshift = function(a, b) return a >> b end
    bit.bxor = function(a, b) return a ~ b end
end


dofile("extensions//item_list.lua")
dofile("extensions//bottle_content.lua")
dofile("extensions//bags.lua")
dofile("extensions//tmc_library.lua")
dofile("extensions//quotes.lua")
dofile("extensions//commandslist.lua")
dofile("extensions//help.lua")
dofile("extensions//warpmenu.lua")
dofile("extensions//credits.lua")
dofile("extensions//commandbox.lua")

inv = 0x00000000
white = 0xFFFFFFFF
client.SetGameExtraPadding(0,0,144,56)
switch = false

wrap = 143
wrap2 = 0
function sleep(n)
  os.execute("sleep " .. tonumber(n))
end
function toggleFlag(addr, val) memory.writebyte(addr, bit.bxor(memory.readbyte(addr), val)) end

rightside = 40
leftside = 0
rightside = 0
downside = 44
topside = 0

-- Godmode Variables
god = false

-- Help Variables
help = false
helpswitch = false
helpx = 0
--
-- Command Variables
commandState = false
commandSwitch = false
name = ""
typestripe = {"_",0}
--
-- Warp Menu Variables
areatext = ""
roomtext = ""
warpmenu = true
warpmenuswitch = false
aID = 0x00
rID = 0x00

quote_timer = 0
quote_string = quote_string_rando

quote_1 = false


local charInputs = {{},{},{}}
	for i=1,10 do table.insert(charInputs[1],"D" ..tostring(i-1)) end
	for i=1,10 do table.insert(charInputs[1],"Number"..tostring(i-1)) end
    for i=1,26 do table.insert(charInputs[1],string.char(i+0x40)) end
	table.insert(charInputs[1],"Space")
	table.insert(charInputs[1],"BackSpace")    
	
local otherInputs = {{"Enter","Escape","Left","Right","Up","Down"},{},{}}
local key = {}

while true do
    if quote_timer > 60*60 then 
        quote_timer = 0 
        quote_string = quote_string_rando
    end
    quote_timer = quote_timer + 1
    quote_string_rando = math.random(1,12)

    mouse = input.getmouse()
    if not mouse["Left"] then switch = false end

  --gui.pixelText(1,1,mouse.X)
  --gui.pixelText(1,12,mouse.Y)

    gui.drawImage("img//background.png",0,0)
    wrap = wrap + 0.25
    wrap2 = wrap + 0.35
    if wrap > 287 then wrap = 143 end

    gui.drawImageRegion("img//clouds.png", 144-wrap,0,144,160,240,0)
    gui.drawImageRegion("img//clouds.png", (144*2)-wrap,0,144,160,240,0)

    gui.drawText(1,160, "Debug Mode", white,inv, 8, "MiniSet2")

    gui.drawText(60,160, quotes[quote_string], white,inv, 8, "MiniSet2")

    --if mouse.X >= 1 and mouse.X <= 382 then
    for i=1,#item_list do
        local addr,val,png,xpos,ypos, m_xpos1, m_xpos2, m_ypos1, m_ypos2, bottle_val = unpack(item_list[i])
            if addr >= 0x02002B32 and addr <= 0x02002B38  then
                if ((bit.band(memory.readbyte(addr), val) == val)) then 
                    gui.drawImage("items//" .. png .. ".png", xpos, ypos)
                    
                end
            end
            if addr == 0x02002B39 then
                if ((bit.band(memory.readbyte(addr), val) == val)) then 
                    if memory.readbyte(0x02002AF6+bottle_val) == 0x00 then
                        memory.writebyte(0x02002AF6+bottle_val, 32)
                    end
                    gui.drawImage("items//" .. memory.readbyte(0x02002AF6+bottle_val) .. ".png", xpos, ypos)
                    gui.drawText(329,174+(11*bottle_val), "0", white, inv, 8, "Goodbye Despair")
                    gui.drawText(334,175+(11*bottle_val), "x", white, inv, 6, "Goodbye Despair")
                    gui.drawText(338,174+(11*bottle_val), string.upper(string.format("%02x", memory.readbyte(0x02002AF6+bottle_val))), white, inv, 8, "Goodbye Despair")
                    
                end
            end
            if addr >= 0x02002B42 then
                if ((bit.band(memory.readbyte(addr), val) == val)) then 
                    gui.drawImage("items//" .. png .. ".png", xpos, ypos)
                end
            end
            if mouse.X >= m_xpos1 and mouse.X <= m_xpos2 and mouse.Y >= m_ypos1 and mouse.Y <= m_ypos2 then
                if switch == false then
                    if mouse["Left"] then
                        toggleFlag(addr,val)
                        switch = true
                    end
                end
            end
            if mouse.X >= 280 and mouse.X <= 290 and mouse.Y >= 7 and mouse.Y <= 14 then
                if switch == false then
                    if mouse["Left"] then
                        os.execute("start https://discord.gg/yFxmScJ3zf")
                        switch = true
                    end
                end
            end
            if mouse.X >= 300 and mouse.X <= 310 and mouse.Y >= 7 and mouse.Y <= 14 then
                if switch == false then
                    if mouse["Left"] then
                        os.execute("start https://discord.gg/resyAYShQy")
                        switch = true
                    end
                end
            end

    end

    for b=0,3 do
        if memory.readbyte(0x02002AF6+b) < 0x1C then memory.writebyte(0x02002AF6+b, 0x1C) end
        if memory.readbyte(0x02002AF6+b) > 0x31 then memory.writebyte(0x02002AF6+b, 0x31) end
        
        if mouse.X >= 308 and mouse.X <= 316 and mouse.Y >= 172+(11*b) and mouse.Y <= 182+(11*b) then
            if switch == false then
                if mouse["Left"] then
                    if memory.readbyte(0x02002AF6+b) > 0x1C then
                        memory.writebyte(0x02002AF6+b, memory.readbyte(0x02002AF6+b)-1)
                        switch = true
                    end
                end
            end
        elseif mouse.X >= 319 and mouse.X <= 327 and mouse.Y >= 172+(11*b) and mouse.Y <= 182+(11*b) then
            if switch == false then
                if mouse["Left"] then
                    if memory.readbyte(0x02002AF6+b) < 0x31 then
                        memory.writebyte(0x02002AF6+b, memory.readbyte(0x02002AF6+b)+1)
                        switch = true
                    end
                end
            end
        end
    end

    for b=1,#bags do
        local bag_addr, bag_val, bag_string, x, y = unpack(bags[b])
        if memory.readbyte(bag_addr) == bag_val then
            gui.drawImage("items//bags//" .. bag_string .. memory.readbyte(bag_addr) .. ".png", x,y)
        end
    end
--end


-- Warp Menu
warpmenufunction()
warptext()

    bag_inc()

-- God Mode Functions
godmodebase()
	
-- Help Functions
helpbox()

-- Command Functions
entercommand()

    gui.pixelText(307, 112, "RNG", white, inv)
    gui.pixelText(307, 119, string.upper(string.format("%08x", memory.read_u32_le(0x03001150))), white, inv)

--    if client.get_lua_engine() ~= "LuaInterface" then
 --       gui.pixelText(2,40, " You are currently using the " .. client.get_lua_engine() .. " core. \n Please use LuaInterface to optimize the functionality \n of this script. \n\n Change your LuaCore at \n Config > Customize > Advance > Check 'LuaInterface'\n And restart your emulator\n\n\n This script is optimized for BizHawk 2.5.2")
--  end

    gui.drawImage("img//foreground.png",0,0)
    



    credits()
    
-- Command Box
local mouse = input.getmouse()
local key = input.get()

if commandState == true then
	local inputs,previousInputs,heldInputs = unpack(charInputs)

	for k in pairs(previousInputs) do
		if key[k] == true then heldInputs[k] = (heldInputs[k] or 0) + 1 end
	end
	for k,v in pairs(heldInputs) do
		if previousInputs[k] == nil then heldInputs[k] = nil end
		if v >= 30 then previousInputs[k] = nil end
	end
	
	for i=1,#inputs do
		local s = inputs[i]
		if key[s] ~= previousInputs[s] then
			previousInputs[s] = key[s]
			if key[s] == true then
				local c = ""
				if i <= 20 then c = (i-1)%10
				elseif i <= 46 then
					local charNum = 0x60 + i - 20
					if key["LeftShift"] then charNum = charNum - 0x20 end
					c = string.char(charNum)
				elseif i == 47 then c = " "
				elseif i == 48 then name = name:sub(1,-2); c = ""
				end

				name = name..c
			end
		end
	end
end

do
	local inputs,previousInputs = unpack(otherInputs)
	for i=1,#inputs do
		local s = inputs[i]
		if key[s] ~= previousInputs[s] then
			previousInputs[s] = key[s]
			if key[s] == true then
				if s == "Enter" then

					if commandState and name ~= "" then
						local args = {}
						for s in name:gmatch("%S+") do table.insert(args,s) end
						if _G[args[1]] then 
							_G[args[1]]({unpack(args,2,#args)})
						else
							print(string.format("commande : %s unknown",args[1]))
						end
						
						namePrevious = name
						name = ""
					end
					commandState = not(commandState)
				elseif s == "Escape" then
					if commandState then
						if name == "" then commandState = false
						else name = "" end
					end
				elseif s == "Up" and commandState == true then
					name = namePrevious
				end
			end
		end
	end
end
	emu.frameadvance()
end