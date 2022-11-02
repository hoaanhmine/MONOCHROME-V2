local SineElap = 0
local displacement = 0
local go = false
local counter = 0

function onEvent(name, v1, v2)
	if name == "Celebi" then
		counter = counter + 1
		makeAnimatedLuaSprite('celebi'..counter, 'characters/gold/Celebi_Assets', 0, 0)
		addAnimationByPrefix('celebi'..counter, 'spawn', 'Celebi Spawn Full', 24 , false)
		addAnimationByPrefix('celebi'..counter, 'idle', 'Celebi Idle', 24 , true)
		addAnimationByIndices('celebi'..counter, 'recede', 'Celebi Spawn Full', '14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0', 24)
		direction = 0
		go = true
		local number = getRandomInt(1, 2)
		if number == 1 then direction = -1 else direction = 1 end
		objectPlayAnimation('celebi', 'spawn')
		addLuaSprite('celebi'..counter, false)
		setProperty('celebi'..counter..'.x', (getProperty('dadGroup.x') + ((screenWidth/3.3) * getProperty('defaultCamZoom')) * direction)+75)
		setProperty('celebi'..counter..'.y', getProperty('dadGroup.y'))
		if not lowQuality then
			for i=1,3 do
					makeAnimatedLuaSprite('celebiNote'..i, 'characters/gold/Note_asset', 0, 0)
					addAnimationByPrefix('celebiNote'..i, 'spawn', 'Note Full', 24 , false)
					objectPlayAnimation('celebiNote'..i, 'spawn')
					addLuaSprite('celebiNote'..i, true)
					setProperty('celebiNote'..i..'.scale.x', 1.5)
					runTimer('glide'..i, stepCrochet * 12 / 1000)
			end
		end
		runTimer('okBye', stepCrochet * 16 / 1000)
	end
end

function onUpdatePost(elapsed)
	if not lowQuality then
		SineElap = SineElap + (elapsed * 3)
		if go == true then
			displacement = displacement + 50
		else
			displacement = 0
		end
		for i=1,3 do
			setProperty('celebiNote'..i..'.x', displacement*math.cos(SineElap+(1.1*i))/20+(getProperty('celebi'..counter..'.x') + getProperty('celebi'..counter..'.width') / 2)-45)
			setProperty('celebiNote'..i..'.y', displacement*math.sin(SineElap+(1.1*i))/20+(getProperty('celebi'..counter..'.y')+50))
		end
	end
end

function onTimerCompleted(tag)
	if tag == "okBye" then
		objectPlayAnimation('celebi'..counter, 'recede')
		runTimer('removeCelebi', 0.3)
	end
	if tag == "removeCelebi" then
		go = false
		removeLuaSprite('celebi'..counter, true)
	end
	if not lowQuality then
		for i=0,3 do
			if tag == 'glide'..i then
				doTweenAlpha('tweenAlpha'..i, 'celebiNote'..i, 0, stepCrochet * 8 / 1000)
				local function onTweenCompleted(tag)
					if tag == 'tweenAlpha'..i then
						removeLuaSprite('celebiNote'..i)
					end
				end
			end
		end
	end
end