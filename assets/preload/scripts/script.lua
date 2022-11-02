function onCreatePost()
    makeLuaText("message", "Mod folder By WinterND", 500, 30, 50)
    setTextAlignment("message", "left")
    setProperty('message.x', 20)
    addLuaText("message")
    setTextFont('message', 'font.ttf');       
    makeLuaText("engineText", "- Psych Engine -", 500, 30, 30)
    setTextAlignment("engineText", "left")
    setProperty('engineText.x', 20)
    addLuaText("engineText")
    setTextFont('engineText', 'font.ttf');       
	if getPropertyFromClass('ClientPrefs', 'downScroll') == false then
        setProperty('message.y', 680)
        setProperty('engineText.y', 660)
    end
end