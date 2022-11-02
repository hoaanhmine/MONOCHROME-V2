function onCreate()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'Gold_fadeOut'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', ''); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', ''); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', ''); --put in mods/music/
end