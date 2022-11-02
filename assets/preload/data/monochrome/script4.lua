function onEvent(name, value1, value2)
    if name == "HUD Fade" then
    setProperty('camHUD.visible', true);
end
    if name == "HUD Fade Mid Song" then
    choose = tonumber(value1);
end    
	if (choose == 14) then
    doTweenAlpha('camHUD', 'camHUD', 0, 0.5, 'linear'); 
end    
    choose = tonumber(value1);
	if (choose == 15) then
    doTweenAlpha('camHUD', 'camHUD', 1, 0.5, 'linear'); 
end
end