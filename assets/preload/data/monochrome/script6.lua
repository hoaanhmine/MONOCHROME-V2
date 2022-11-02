function onCreatePost()
    makeLuaSprite('O','Jumpscares/Gold',-290,-200);
    setObjectCamera('O','hud');
    scaleObject('O',0.35, 0.35)
    setScrollFactor('O',0,0);
    setProperty('O.alpha', 1);
    makeLuaSprite('1','Jumpscares/GoldAlt',-290,-200);
    setObjectCamera('1','hud');
    scaleObject('1',0.35, 0.35)
    setScrollFactor('1',0,0);
    setProperty('1.alpha', 1);
end

function onEvent(name, value1, value2)
    if name == "Jumpscare" then
    choose = tonumber(value1);
	if (choose == 0) then
    makeLuaSprite('O','Jumpscares/Gold',-290,-200);
    setObjectCamera('O','hud');
    scaleObject('O',0.35, 0.35)
    setScrollFactor('O',0,0);
    setProperty('O.alpha', 1);
    addLuaSprite('O',true)
end
    choose = tonumber(value1);
	if (choose == 1) then
	makeLuaSprite('1','Jumpscares/GoldAlt',-290,-200);
    setObjectCamera('1','hud');
    scaleObject('1',0.35, 0.35)
    setScrollFactor('1',0,0);
    setProperty('1.alpha', 1);
    addLuaSprite('1',true)
end
    choose = tonumber(value2);
	if (choose == 4) then
	runTimer('end', 0.2);
    runTimer('Rm', 1);
    triggerEvent('Screen Shake','0.2,0.01','0.2,0.01');
end
    choose = tonumber(value2);
	if (choose == 8) then
	runTimer('end', 0.3);
    runTimer('Rm', 1.4);
    triggerEvent('Screen Shake','0.3,0.01','0.3,0.01');
end
    choose = tonumber(value2);
	if (choose == 32) then
	runTimer('end', 2);
    runTimer('Rm', 3.8);
    triggerEvent('Screen Shake','2,0.01','2,0.01');
end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'end' then
    doTweenAlpha('O', 'O', 0, 0.25, 'linear'); 
    doTweenAlpha('1', '1', 0, 0.25, 'linear'); 
end    
    if tag == 'Rm' then
    removeLuaSprite('O', true);
    removeLuaSprite('1', true);
end
end
end