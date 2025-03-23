function helpbox()
hm = input.getmouse()
--helpx=0
downside=0
if hm["X"] >= 102 and hm["X"] <= 112 and hm["Y"] >= downside+150 and hm["Y"] <= downside+158 and hm["Left"] and helpswitch == false then
help = not help
helpswitch = true
end

if help == false then
gui.drawBox(102, downside+150, 112, downside+158, "white", 0x45363fe3)
gui.pixelText(105, downside+151, "?", "white", 0x00000000)
elseif help == true then
gui.drawBox(102, downside+150, 112, downside+158, "white", 0x85363fe3)
gui.pixelText(105, downside+151, "?", "white", 0x00000000)

gui.drawBox(100,8, 110,18, "white", 0x85363fe3)
gui.pixelText(103, 10, "<", "white", 0x00000000)
gui.drawBox(112,8, 122,18, "white", 0x85363fe3)
gui.pixelText(115, 10, ">", "white", 0x00000000)

end

if helpx > 0 then helpx = 0 
elseif helpx < 0-0 then helpx = 0-0 end

if hm["X"] >= 100 and hm["X"] <= 110 and hm["Y"] >= 8 and hm["Y"] <= 18 and hm["Left"] then
helpx = helpx+6
elseif hm["X"] >= 112 and hm["X"] <= 121 and hm["Y"] >= 8 and hm["Y"] <= 18 and hm["Left"] then
helpx = helpx-6
end

if help == true then
	gui.pixelText(7+helpx,25,   "Commands:    \n\ngodmode                  \nheart(s)  1-20 or all    \nitem        all        \nitem      carlov    / c  \nitem      trophy    / t  \nitem      jabber    / j  \nitem      mushroom  / m  \nitem      lonlonkey / llk\nitem      greavekey / gk \nitem      dogfood   / d  \nminish                   \nrupee(s)  (x)            \nwallet    100 300 500 999\n\n\n\n", "white")
	gui.pixelText(117+helpx,25, "short format:\n\ngod                      \nh         1-20 or all    \ni           all        \ni         carlov    / c  \ni         trophy    / t  \ni         jabber    / j  \ni         mushroom  / m  \ni         lonlonkey / llk\ni         greavekey / gk \ni         dogfood   / d  \nm                        \nr         (x)            \nw         100 300 500 999\n\n\n\n", "white")
	--gui.pixelText(95+helpx,25, "pos 	(x) (y) \n\nbombs 	(x)\narrows 	(x)\n\njump\ncharm 	nayru\n 	din\n 	farore\nwallet 	100\n 	300\n 	500\n 	999\nbottle 	(x[1-4]) (itemid)\nhearts 	all\nwarp 	(0xAREA ID) (0xROOM ID)\nnewname 	type new name          ", "white")
	--gui.pixelText(128+95+helpx,25, "godmode\nog		on/off\nsavepos 	(name)\nloadpos 	(name)\nresetpos\n\nredhouse 	nayru\n 		farore\n 		din\nbluehouse 	nayru\n 		farore\n 		din\n\ndisplay 	rng\nrnglock 	on/off\nrngset 		(x)             ", "white")
end

if not hm["Left"] then helpswitch = false end
end

