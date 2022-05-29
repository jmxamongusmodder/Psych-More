--SaraHUD 3.2 by Novikond

-- SETTINGS!
-- You can write "true" or "false" in most of time

--'modern'; 'classicTxt'; 'classicIcons'
style = 'modern' --what style of HUD u wanna use


songNameEnabled = true --wanna see song name?

timerEnabled = true --wanna see timer?

customFontEnabled = true --if you wanna use custom font (yeah, now you can delete vcr.ttf if you don't need it)
Cfont = 'PhantomMuff.ttf' --write here what font u wanna use (you need to write format as well)

customNoteSkinEnabled = false --wanna use custom note skin? (broke custom notes texture!)
CnoteSkin = 'saraHUD/NOTE_assets' --custom note skin file name 

HudMissAnim = true --if you miss note some of the HUD elements is goes purple and back to normal
playerMissAnim = false --if you wanna see better miss animation of bf (buggy, can broke blammed lights!!!)

healthBarOverlayEnabled = true --health bar overlay lol

turnOffTimeBar = true --turn off timebar... I love to leave comments sorry

botplayHideInfo = true --turn on thing that... um... hide info... when... botplay... activated... guh

infoBop = true --info "bopping" on good note hit

-- The end of settings
-- Settings are not infinite o-o

function onCreatePost()
    --disable vanilla stuff
    setProperty('scoreTxt.visible', false)
    setProperty('timeTxt.visible', false)
    setProperty('timeBar.visible', false)
	setProperty('timeBarBG.visible', false)
    setProperty('healthBarOverlay.visible', false) --if u use OS engine or something like that, anyway, we have custom overlay

    if style == 'modern' then
        makeLuaText('rating', ': ?')
        makeLuaText('misses', ': 0')
        makeLuaText('score', ': 0')

        setTextAlignment('rating', 'left')
        setTextAlignment('misses', 'left')
        setTextAlignment('score', 'left')

        setProperty('rating.x', 851)
        setProperty('misses.x', 851)
        setProperty('score.x', 961)

        setProperty('rating.y', 666) --666 wtf
        setProperty('misses.y', 616)
        setProperty('score.y', 616)

        setTextSize('rating', 20)
        setTextSize('misses', 20)
        setTextSize('score', 20)
    
        addLuaText('rating')
        addLuaText('misses')
        addLuaText('score')

        makeLuaSprite('ratingIcon', 'saraHUD/ratingIcon', 810, 660)
        makeLuaSprite('missesIcon', 'saraHUD/missesIcon', 810, 610)
        makeLuaSprite('scoreIcon', 'saraHUD/scoreIcon', 920, 610)

        setObjectCamera('ratingIcon', 'hud')
        setObjectCamera('missesIcon', 'hud')
        setObjectCamera('scoreIcon', 'hud')

        scaleObject('ratingIcon', 0.7, 0.7)
        scaleObject('missesIcon', 0.7, 0.7)
        scaleObject('scoreIcon', 0.7, 0.7)

        addLuaSprite('ratingIcon')
        addLuaSprite('missesIcon')
        addLuaSprite('scoreIcon')

        --move health bar
        setProperty('healthBar.x', 110)
        setProperty('healthBar.y', 655)
    end

    if style == 'classicIcons' then
        makeLuaText('rating', '           : ?')
        makeLuaText('misses', '           : 0')
        makeLuaText('score', '           : 0')

        setTextAlignment('rating', 'left')
        setTextAlignment('misses', 'left')
        setTextAlignment('score', 'left')

        setProperty('rating.y', 669)
        setProperty('misses.y', 584)
        setProperty('score.y', 628)

        setTextSize('rating', 20)
        setTextSize('misses', 20)
        setTextSize('score', 20)
    
        addLuaText('rating')
        addLuaText('misses')
        addLuaText('score')

        makeLuaSprite('ratingIcon', 'saraHUD/ratingIcon', 10, 665)
        makeLuaSprite('missesIcon', 'saraHUD/missesIcon', 10, 580)
        makeLuaSprite('scoreIcon', 'saraHUD/scoreIcon', 10, 623)

        setObjectCamera('ratingIcon', 'hud')
        setObjectCamera('missesIcon', 'hud')
        setObjectCamera('scoreIcon', 'hud')

        scaleObject('ratingIcon', 0.7, 0.7)
        scaleObject('missesIcon', 0.7, 0.7)
        scaleObject('scoreIcon', 0.7, 0.7)

        addLuaSprite('ratingIcon')
        addLuaSprite('missesIcon')
        addLuaSprite('scoreIcon')

        --move health bar
        setProperty('healthBar.y', 655)
    end

    if style == 'classicTxt' then
        makeLuaText('rating', 'Rating: ?')
        makeLuaText('misses', 'Misses: 0')
        makeLuaText('score', 'Score: 0')

        setTextAlignment('rating', 'left')
        setTextAlignment('misses', 'left')
        setTextAlignment('score', 'left')

        setProperty('rating.x', 15)
        setProperty('misses.x', 15)
        setProperty('score.x', 15)

        setProperty('rating.y', 678)
        setProperty('misses.y', 618)
        setProperty('score.y', 648)

        setTextSize('rating', 20)
        setTextSize('misses', 20)
        setTextSize('score', 20)
    
        addLuaText('rating')
        addLuaText('misses')
        addLuaText('score')

        --move health bar
        setProperty('healthBar.y', 655)
    end

    if style == 'modern' and (downscroll) then
        setProperty('healthBar.y', 70)
        setProperty('ratingIcon.y', 30)
        setProperty('missesIcon.y', 80)
        setProperty('scoreIcon.y', 80)
        setProperty('rating.y', 36)
        setProperty('misses.y', 86)
        setProperty('score.y', 86)
    end
    if style == 'classicIcons' and (downscroll) then
        setProperty('healthBar.y', 70)
        setProperty('ratingIcon.y', 18)
        setProperty('missesIcon.y', 103)
        setProperty('scoreIcon.y', 60)
        setProperty('rating.y', 22)
        setProperty('misses.y', 106)
        setProperty('score.y', 64)
    end
    if style == 'classicTxt' and (downscroll) then
        setProperty('healthBar.y', 70)
        setProperty('song.y', 94)
        setProperty('timer.y', 94)
        setProperty('rating.y', 20)
        setProperty('misses.y', 80)
        setProperty('score.y', 50)
    end

    --song name
    if songNameEnabled == true and style == 'modern' and (not downscroll) then
	    makeLuaText('song', '' .. (songName), 500, 223, 618)
        setTextAlignment('song', 'left')
        setTextSize('song', 20)
	    addLuaText('song')

        makeLuaSprite('songIcon', 'saraHUD/songIcon', 190, 616)
        setObjectCamera('songIcon', 'hud')
        scaleObject('songIcon', 0.5, 0.5)
        addLuaSprite('songIcon')
    end
    if songNameEnabled == true and style == 'classicIcons' and (not downscroll) then
	    makeLuaText('song', '' .. (songName), 500, 388, 618)
        setTextAlignment('song', 'center')
        setTextSize('song', 20)
	    addLuaText('song')
    end
    if songNameEnabled == true and style == 'classicTxt' and (not downscroll) then
	    makeLuaText('song', '' .. (songName), 500, 388, 618)
        setTextAlignment('song', 'center')
        setTextSize('song', 20)
	    addLuaText('song')
    end

    if songNameEnabled == true and style == 'modern' and (downscroll) then
	    makeLuaText('song', '' .. (songName), 500, 223, 96)
        setTextAlignment('song', 'left')
        setTextSize('song', 20)
	    addLuaText('song')

        makeLuaSprite('songIcon', 'saraHUD/songIcon', 190, 93)
        setObjectCamera('songIcon', 'hud')
        scaleObject('songIcon', 0.5, 0.5)
        addLuaSprite('songIcon')
    end
    if songNameEnabled == true and style == 'classicIcons' and (downscroll) then
	    makeLuaText('song', '' .. (songName), 500, 388, 96)
        setTextAlignment('song', 'center')
        setTextSize('song', 20)
	    addLuaText('song')
    end
    if songNameEnabled == true and style == 'classicTxt' and (downscroll) then
	    makeLuaText('song', '' .. (songName), 500, 388, 96)
        setTextAlignment('song', 'center')
        setTextSize('song', 20)
	    addLuaText('song')
    end

    --timer
    if timerEnabled == true and style == 'modern' and (not downscroll) then
        makeLuaText('timer', '', 500, 70, 618)
        setObjectCamera('timer', 'hud')
        setTextAlignment('timer', 'right')
        setTextSize('timer', 20)
        addLuaText('timer')

        makeLuaSprite('timerIcon', 'saraHUD/timerIcon', 575, 616)
        setObjectCamera('timerIcon', 'hud')
        scaleObject('timerIcon', 0.5, 0.5)
        addLuaSprite('timerIcon')
    end
    if timerEnabled == true and style == 'classicIcons' and (not downscroll) then
        makeLuaText('timer', '', 500, 388, 678)
        setObjectCamera('timer', 'hud')
        setTextAlignment('timer', 'center')
        setTextSize('timer', 20)
        addLuaText('timer')
    end
    if timerEnabled == true and style == 'classicTxt' and (not downscroll) then
        makeLuaText('timer', '', 500, 388, 678)
        setObjectCamera('timer', 'hud')
        setTextAlignment('timer', 'center')
        setTextSize('timer', 20)
        addLuaText('timer')
    end

    if timerEnabled == true and style == 'modern' and (downscroll) then
        makeLuaText('timer', '', 500, 70, 96)
        setObjectCamera('timer', 'hud')
        setTextAlignment('timer', 'right')
        setTextSize('timer', 20)
        addLuaText('timer')

        makeLuaSprite('timerIcon', 'saraHUD/timerIcon', 575, 93)
        setObjectCamera('timerIcon', 'hud')
        scaleObject('timerIcon', 0.5, 0.5)
        addLuaSprite('timerIcon')
    end
    if timerEnabled == true and style == 'classicIcons' and (downscroll) then
        makeLuaText('timer', '', 500, 388, 30)
        setObjectCamera('timer', 'hud')
        setTextAlignment('timer', 'center')
        setTextSize('timer', 20)
        addLuaText('timer')
    end
    if timerEnabled == true and style == 'classicTxt' and (downscroll) then
        makeLuaText('timer', '', 500, 388, 30)
        setObjectCamera('timer', 'hud')
        setTextAlignment('timer', 'center')
        setTextSize('timer', 20)
        addLuaText('timer')
    end

    if customFontEnabled == true then
        --according to my theory, the custom font is lagging because the game loads and unloads the font, so I just add text that has almost all the characters and maybe it will help (maybe)
        makeLuaText('fontOptimization', 'QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm1234567890')
        setTextFont('fontOptimization', Cfont)
        setTextFont('rating', Cfont)
        setTextFont('misses', Cfont)
        setTextFont('score', Cfont)
        setTextFont('song', Cfont)
        setTextFont('timer', Cfont)
    end

    --noteskin shit
    if customNoteSkinEnabled == true then
        for i = 0, getProperty('opponentStrums.length')-1 do
            setPropertyFromGroup('opponentStrums', i, 'texture', CnoteSkin)
        end
        for i = 0, getProperty('unspawnNotes.length')-1 do
            if getPropertyFromGroup('unspawnNotes', i, 'mustPress') == false then
            setPropertyFromGroup('unspawnNotes', i, 'texture', CnoteSkin)
            end
        end
        for i = 0, getProperty('playerStrums.length')-1 do
        setPropertyFromGroup('playerStrums', i, 'texture', CnoteSkin)
        end
        for i = 0, getProperty('unspawnNotes.length')-1 do
            if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
            setPropertyFromGroup('unspawnNotes', i, 'texture', CnoteSkin)
            end
        end
    end

    --health bar overlay
    if healthBarOverlayEnabled == true and style == 'modern' and (not downscroll) then
        makeLuaSprite('healthBarOver', 'saraHUD/healthBarOver', 0, 0)
        setObjectCamera('healthBarOver', 'hud')
        setScrollFactor('healthBarOver', 0.9, 0.9)
        setObjectOrder('healthBarOver', 4)
        setObjectOrder('healthBar', 3)
        setObjectOrder('healthBarBG', 2)
        addLuaSprite('healthBarOver', true)
        setProperty('healthBarOver.alpha', 0.5)
        setProperty('healthBarOver.x', 105)
        setProperty('healthBarOver.y', 650)
    end
    if healthBarOverlayEnabled == true and style == 'classicIcons' and (not downscroll) then
        makeLuaSprite('healthBarOver', 'saraHUD/healthBarOver', 0, 0)
        setObjectCamera('healthBarOver', 'hud')
        setScrollFactor('healthBarOver', 0.9, 0.9)
        setObjectOrder('healthBarOver', 4)
        setObjectOrder('healthBar', 3)
        setObjectOrder('healthBarBG', 2)
        addLuaSprite('healthBarOver', true)
        setProperty('healthBarOver.alpha', 0.5)
        setProperty('healthBarOver.x', 340)
        setProperty('healthBarOver.y', 650)
    end
    if healthBarOverlayEnabled == true and style == 'classicTxt' and (not downscroll) then
        makeLuaSprite('healthBarOver', 'saraHUD/healthBarOver', 0, 0)
        setObjectCamera('healthBarOver', 'hud')
        setScrollFactor('healthBarOver', 0.9, 0.9)
        setObjectOrder('healthBarOver', 4)
        setObjectOrder('healthBar', 3)
        setObjectOrder('healthBarBG', 2)
        addLuaSprite('healthBarOver', true)
        setProperty('healthBarOver.alpha', 0.5)
        setProperty('healthBarOver.x', 340)
        setProperty('healthBarOver.y', 650)
    end

    if healthBarOverlayEnabled == true and style == 'modern' and (downscroll) then
        makeLuaSprite('healthBarOver', 'saraHUD/healthBarOver', 0, 0)
        setObjectCamera('healthBarOver', 'hud')
        setScrollFactor('healthBarOver', 0.9, 0.9)
        setObjectOrder('healthBarOver', 4)
        setObjectOrder('healthBar', 3)
        setObjectOrder('healthBarBG', 2)
        addLuaSprite('healthBarOver', true)
        setProperty('healthBarOver.alpha', 0.5)
        setProperty('healthBarOver.x', 105)
        setProperty('healthBarOver.y', 65)
    end
    if healthBarOverlayEnabled == true and style == 'classicIcons' and (downscroll) then
        makeLuaSprite('healthBarOver', 'saraHUD/healthBarOver', 0, 0)
        setObjectCamera('healthBarOver', 'hud')
        setScrollFactor('healthBarOver', 0.9, 0.9)
        setObjectOrder('healthBarOver', 4)
        setObjectOrder('healthBar', 3)
        setObjectOrder('healthBarBG', 2)
        addLuaSprite('healthBarOver', true)
        setProperty('healthBarOver.alpha', 0.5)
        setProperty('healthBarOver.x', 340)
        setProperty('healthBarOver.y', 65)
    end
    if healthBarOverlayEnabled == true and style == 'classicTxt' and (downscroll) then
        makeLuaSprite('healthBarOver', 'saraHUD/healthBarOver', 0, 0)
        setObjectCamera('healthBarOver', 'hud')
        setScrollFactor('healthBarOver', 0.9, 0.9)
        setObjectOrder('healthBarOver', 4)
        setObjectOrder('healthBar', 3)
        setObjectOrder('healthBarBG', 2)
        addLuaSprite('healthBarOver', true)
        setProperty('healthBarOver.alpha', 0.5)
        setProperty('healthBarOver.x', 340)
        setProperty('healthBarOver.y', 65)
    end
end

function onRecalculateRating()
	if style == 'modern' then
        setTextString('misses', ': ' .. getProperty('songMisses'));
	    setTextString('rating', ': ' .. getProperty('ratingName') .. ' | ' .. string.format("%.2f%%", rating * 100) .. ' | ' .. getProperty('ratingFC'));
	    setTextString('score', ': ' .. score);
    end
    if style == 'classicIcons' then
        setTextString('misses', '           : ' .. getProperty('songMisses'));
	    setTextString('rating', '           : ' .. getProperty('ratingName') .. ' | ' .. string.format("%.2f%%", rating * 100) .. ' | ' .. getProperty('ratingFC'));
	    setTextString('score', '           : ' .. score);
    end
    if style == 'classicTxt' then
        setTextString('misses', 'Misses: ' .. getProperty('songMisses'));
	    setTextString('rating', 'Rating: ' .. getProperty('ratingName') .. ' | ' .. string.format("%.2f%%", rating * 100) .. ' | ' .. getProperty('ratingFC'));
	    setTextString('score', 'Score: ' .. score);
    end
end

function onUpdatePost()
    --timer
    local  timeElapsed = math.floor(getProperty('songTime')/1000)
    local  timeTotal = math.floor(getProperty('songLength')/1000)
    local timeElapsedFixed = string.format("%.2d:%.2d", timeElapsed/60%60, timeElapsed%60)
    local timeTotalFixed = string.format("%.2d:%.2d", timeTotal/60%60, timeTotal%60)
    setTextString('timer', timeElapsedFixed .. '/' .. timeTotalFixed)

    --bf and dad icons on screen
    if style == 'modern' and (not downscroll) then
        setProperty('iconP1.x', screenWidth - 680)
        setProperty('iconP2.x', 50)
        setProperty('iconP1.y', 578)
        setProperty('iconP2.y', 578)
    end
    if style == 'classicIcons' and (not downscroll) then
        setProperty('iconP1.x', screenWidth - 445)
        setProperty('iconP2.x', 285)
        setProperty('iconP1.y', 578)
        setProperty('iconP2.y', 578)
    end
    if style == 'classicTxt' and (not downscroll) then
        setProperty('iconP1.x', screenWidth - 445)
        setProperty('iconP2.x', 285)
        setProperty('iconP1.y', 578)
        setProperty('iconP2.y', 578)
    end

    if style == 'modern' and (downscroll) then
        setProperty('iconP1.x', screenWidth - 680)
        setProperty('iconP2.x', 50)
        setProperty('iconP1.y', 0)
        setProperty('iconP2.y', 0)
    end
    if style == 'classicIcons' and (downscroll) then
        setProperty('iconP1.x', screenWidth - 445)
        setProperty('iconP2.x', 285)
        setProperty('iconP1.y', 0)
        setProperty('iconP2.y', 0)
    end
    if style == 'classicTxt' and (downscroll) then
        setProperty('iconP1.x', screenWidth - 445)
        setProperty('iconP2.x', 285)
        setProperty('iconP1.y', 0)
        setProperty('iconP2.y', 0)
    end

    if botplayHideInfo == true then
        if (botPlay) then
            setProperty('misses.visible', false)
            setProperty('rating.visible', false)
            setProperty('score.visible', false)
            setProperty('missesIcon.visible', false)
            setProperty('ratingIcon.visible', false)
            setProperty('scoreIcon.visible', false)
        else
            setProperty('misses.visible', true)
            setProperty('rating.visible', true)
            setProperty('score.visible', true)
            setProperty('missesIcon.visible', true)
            setProperty('ratingIcon.visible', true)
            setProperty('scoreIcon.visible', true)
        end
    end

    if turnOffTimeBar == true then
        setProperty('timeBar.visible', false)
        setProperty('timeBarBG.visible', false)
    else
        setProperty('timeBar.visible', true)
        setProperty('timeBarBG.visible', true)
    end
end

function goodNoteHit()
    if infoBop == true then
        setProperty('misses.scale.x', 1.1)
        setProperty('misses.scale.y', 1.1)
        
        setProperty('rating.scale.x', 1.1)
        setProperty('rating.scale.y', 1.1)
        
        setProperty('score.scale.x', 1.1)
        setProperty('score.scale.y', 1.1)

        doTweenX('MtextSizeX', 'misses.scale', 1, 0.1, 'linear')
        doTweenY('MtextSizeY', 'misses.scale', 1, 0.1, 'linear')
        
        doTweenX('RtextSizeX', 'rating.scale', 1, 0.1, 'linear')
        doTweenY('RtextSizeY', 'rating.scale', 1, 0.1, 'linear')
        
        doTweenX('StextSizeX', 'score.scale', 1, 0.1, 'linear')
        doTweenY('StextSizeY', 'score.scale', 1, 0.1, 'linear')
    end
end

function noteMiss()
	--icons in left corner like... OOF, and healthbar... and bf icon
	if HudMissAnim == true then
        setProperty('missesIcon.color', getColorFromHex('5f1ea4'))
	    doTweenColor('missesIcon', 'missesIcon', 'FFFFFF', 0.4, 'linear')
	
	    setProperty('scoreIcon.color', getColorFromHex('5f1ea4'))
	    doTweenColor('scoreIcon', 'scoreIcon', 'FFFFFF', 0.4, 'linear')
	
	    setProperty('ratingIcon.color', getColorFromHex('5f1ea4'))
	    doTweenColor('ratingIcon', 'ratingIcon', 'FFFFFF', 0.4, 'linear')

	    setProperty('healthBar.color', getColorFromHex('5f1ea4'))
	    doTweenColor('healthBar', 'healthBar', 'FFFFFF', 0.4, 'linear')

	    setProperty('iconP1.color', getColorFromHex('5f1ea4'))
	    doTweenColor('iconP1', 'iconP1', 'FFFFFF', 0.4, 'linear')
    end

    --cool miss animations for bf (that broke blammed lights if you miss lol)
	if playerMissAnim == true then
	    setProperty('boyfriend.color', getColorFromHex('5f1ea4'))
	    doTweenColor('bfColorTween', 'boyfriend', 'FFFFFF', 0.4, 'linear')
    end
end