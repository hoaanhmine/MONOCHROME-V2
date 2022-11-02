local allowCountdown = false
local allowEnding = false
local stopBoyfriendBopping = false

function onCreate()

	setProperty('skipCountdown', true)
	setPropertyFromClass('flixel.FlxG', 'mouse.visible', false)

	playSound('ImDead'..getRandomInt(1,7), 1.9)
	runTimer('voiceline', 1.9)
	
	didskip = false;
end
	
function onStartCountdown() -- No countdown yet
    if not allowCountdown then
	    return Function_Stop
	end
	if allowCountdown then
	    return Function_Continue
	end
end

function onTimerCompleted(t) -- yes countdown
	if t == 'voiceline' then
		allowCountdown = true
		startCountdown()
	end
	if t == 'actuallyEndIt' then
		allowEnding = true
		endSong(false)
	end
end