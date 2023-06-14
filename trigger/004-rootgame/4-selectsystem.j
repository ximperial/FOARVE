library selectsystem uses Utilities preloadEffect initFrame runTimeUI finishselect

    globals
        private boolean isReady = false
    endglobals

    private function runSelectHero takes nothing returns nothing
        local framehandle pFrame
        local string s = ""
        local real diff 
        local integer fid 
        local integer randomI 
        local integer i
        local integer i2
        
        set SelectHeroTime = SelectHeroTime - 0.1
        if SelectHeroTime > -3.0 then
            set i = 0
            loop
                exitwhen i > 11
                if UserPlayer(Player(i)) then
                    call CameraSetupApplyForPlayer( true, gg_cam_Select_Hero, Player(1), 0.1 )
                    call CameraSetupApplyForPlayer( true, gg_cam_Select_Hero, Player(2), 0.1 )
                    call CameraSetupApplyForPlayer( true, gg_cam_Select_Hero, Player(3), 0.1 )
                    call CameraSetupApplyForPlayer( true, gg_cam_Select_Hero, Player(5), 0.1 )
                    call CameraSetupApplyForPlayer( true, gg_cam_Select_Hero, Player(6), 0.1 )
                    call CameraSetupApplyForPlayer( true, gg_cam_Select_Hero, Player(7), 0.1 )
                    call CameraSetupApplyForPlayer( true, gg_cam_Select_Hero, Player(9), 0.1 )
                    call CameraSetupApplyForPlayer( true, gg_cam_Select_Hero, Player(10), 0.1 )
                    call CameraSetupApplyForPlayer( true, gg_cam_Select_Hero, Player(11), 0.1 )
                endif
                set i = i + 1
            endloop
        endif
        if SelectHeroTime > 0 then
            set pFrame = GetFrameByName("HeroSelectorTimeText", 0)
            set s = "|cffDAA520" + "Selection Time : " + R2SW(SelectHeroTime, 0, 1)
            call SetFrameText(pFrame , s)
        endif
        if SelectHeroTime == 5 or SelectHeroTime == 4 or SelectHeroTime == 3 or SelectHeroTime == 2 or SelectHeroTime == 1 then 
            call SoundStart("Sound\\Interface\\BattleNetTick.wav")
        endif
        if not isReady and SelectHeroTime > 5 then
            set i = 0
            set i2 = 0
            loop
                exitwhen i > 11
                if SelectedYet[i] and UserPlayer(Player(i)) then
                    set i2 = i2 + 1
                endif
                set i = i + 1
            endloop
            if i2 == playerCount then 
                set isReady = true
                set SelectHeroTime = 5
            endif
        endif
        if SelectHeroTime == 0 then
            set pFrame = GetFrameByName("HeroSelectorTimeText", 0)
            call SetFrameText(pFrame , "")
            set i = 0
            loop
                exitwhen i > 11
                if UserPlayer(Player(i)) then
                    loop
                        exitwhen SelectedYet[i]
                        set randomI = GetRandomInt(1, udg_MaxHero)
                        set fid = LoadInteger(ht, StringHash("iconFrame"), randomI)
                        set diff = HeroDiff[fid]
                        if not HeroGone[randomI] then
                            set MemoHero[i] = randomI
                            set i2 = 0
                            loop
                                exitwhen i2 > 2
                                if diff > 0 then
                                    set pFrame = GetFrameByName("HeroSelectorTipStar", i2)
                                    if GetLocalPlayer() == Player(i) then
                                        call ShowFrame(pFrame, true)
                                    endif
                                    set diff = diff - 1
                                else
                                    set pFrame = GetFrameByName("HeroSelectorTipStar", i2)
                                    if GetLocalPlayer() == Player(i) then
                                        call ShowFrame(pFrame, false)
                                    endif
                                endif
                                set i2 = i2 + 1
                            endloop
                            set s = "|cffDAA520" + GetUnitBaseStringFieldById(HeroType[randomI], UNIT_SF_NAME)
                            set pFrame = GetFrameByName("HeroSelectorTipText", 0)
                            if GetLocalPlayer() == Player(i) then
                                call SetFrameText(pFrame, s)
                            endif
                            set pFrame = GetFrameByName("HeroSelectorTipIcon", 0)
                            if GetLocalPlayer() == Player(i) then
                                call SetFrameTexture(pFrame, HeroPhoto[randomI], 0, true)
                            endif
                            set i2 = 0
                            loop
                                exitwhen i2 > 4
                                set pFrame = GetFrameByName("HeroSelectorButtonSpellIcon", i2)
                                set s = LoadStr(ht, StringHash("SpellIcon_" + I2S(i)), HeroType[randomI])
                                if GetLocalPlayer() == Player(i) then
                                    call SetFrameTexture(pFrame, s, 0, true)
                                endif
                                set pFrame = GetFrameByName("HeroSelectorButtonSpellText", i2)
                                set s = LoadStr(ht, StringHash("SpellTip_" + I2S(i)), HeroType[randomI])
                                if GetLocalPlayer() == Player(i) then
                                    call SetFrameText(pFrame, s)
                                endif
                                set i2 = i2 + 1
                            endloop
                            set pFrame = GetFrameByName("HeroSelectorIconView", i)
                            call SetFrameTexture(pFrame, HeroPhoto[randomI], 0, true)
                            if GetUnitBaseIntegerFieldById(HeroType[randomI], UNIT_IF_PRIMARY_ATTRIBUTE) == 1 then
                                set pFrame = GetFrameByName("HeroSelectorButtonIcon", fid)
                                call SetFrameTexture(pFrame, HeroPhoto2[randomI], 0, true)
                            elseif GetUnitBaseIntegerFieldById(HeroType[randomI], UNIT_IF_PRIMARY_ATTRIBUTE) == 3 then
                                set pFrame = GetFrameByName("HeroSelectorButton2Icon", fid)
                                call SetFrameTexture(pFrame, HeroPhoto2[randomI], 0, true)
                            else
                                set pFrame = GetFrameByName("HeroSelectorButton3Icon", fid)
                                call SetFrameTexture(pFrame, HeroPhoto2[randomI], 0, true)
                            endif
                            if HeroVoice[randomI] != "" then
                                call SoundStartPlayer(HeroVoice[randomI], Player(i), true)
                            endif
                            set HeroGone[randomI] = true
                            set SelectedYet[i] = true
                        endif
                    endloop
                endif
                set i = i + 1
            endloop
        endif
        if SelectHeroTime == - 1 then
            call DisplayTimedTextToForce( bj_FORCE_ALL_PLAYERS, 10, "Loading Effect Resources..."   )
            call callPreloadEffect()
        endif
        if SelectHeroTime == - 3 and LoadEffectFinish then
            call ClearTextMessagesBJ(bj_FORCE_ALL_PLAYERS)
            set pFrame = GetFrameByName("HeroSelectorBackground", 0)
            call ShowFrame(pFrame, false)
            set pFrame = GetFrameByName("HeroSelectorIconViewBordir", 1)
            call ShowFrame(pFrame, false)
            set pFrame = GetFrameByName("HeroSelectorTimeBordir", 0)
            call ShowFrame(pFrame, false)
            set pFrame = GetFrameByName("HeroSelectorStatIcon", 0)
            call ShowFrame(pFrame, false)
            set pFrame = GetFrameByName("HeroSelectorStatIcon", 1)
            call ShowFrame(pFrame, false)
            set pFrame = GetFrameByName("HeroSelectorStatIcon", 2)
            call ShowFrame(pFrame, false)
            set pFrame = GetFrameByName("HeroSelectorTipBordir", 0)
            call ShowFrame(pFrame, false)
            call createDefaultUI()
            call createDefaultUI2()
            call shopUICreate()
            call voiceButtonCreate()
            call callRunTimeUI()
            call clearSelectData()
            set i = 0
            loop
                exitwhen i > 11
                if UserPlayer(Player(i)) then
                    call ResetToGameCameraForPlayer(Player(i) , 0)
                    if IsPlayerAlly(Player(i) , Player(0)) then
                        set bj_lastCreatedUnit = CreateUnit(Player(i), HeroType[MemoHero[i]], GetRectCenterX(gg_rct_Team1Revive), GetRectCenterY(gg_rct_Team1Revive), 0)
                        call PanCameraToTimedForPlayer(Player(i), GetRectCenterX(gg_rct_Team1Revive) , GetRectCenterY(gg_rct_Team1Revive) , 1)
                    elseif IsPlayerAlly(Player(i) , Player(4)) then
                        set bj_lastCreatedUnit = CreateUnit(Player(i), HeroType[MemoHero[i]], GetRectCenterX(gg_rct_Team2Revive), GetRectCenterY(gg_rct_Team2Revive), 0)
                        call PanCameraToTimedForPlayer(Player(i), GetRectCenterX(gg_rct_Team2Revive) , GetRectCenterY(gg_rct_Team2Revive) , 1)
                    else
                        set bj_lastCreatedUnit = CreateUnit(Player(i), HeroType[MemoHero[i]], GetRectCenterX(gg_rct_Team3Revive), GetRectCenterY(gg_rct_Team3Revive), 0)
                        call PanCameraToTimedForPlayer(Player(i), GetRectCenterX(gg_rct_Team3Revive) , GetRectCenterY(gg_rct_Team3Revive) , 1)
                    endif
                    set pFrame = GetFrameByName("TextPlayerName", i)
                    set s = "|cffDAA520" + SubString(playerName[i], 0, 12)
                    call SetFrameText(pFrame , s)
                    set pFrame = GetFrameByName("HeroBack3ground", i)
                    call SetFrameTexture(pFrame , HeroPhoto[MemoHero[i]], 0, true)
                    set pFrame = GetFrameByName("HeroBack4ground", i)
                    call SetFrameTexture(pFrame , HeroPhoto[MemoHero[i]], 0, true)
                    if isTestMode then
                        call SetHeroLevel(bj_lastCreatedUnit, 40, false)
                    endif
                    set s = GetUnitStringField(bj_lastCreatedUnit, UNIT_SF_NAME)
                    set MainHero[i] = bj_lastCreatedUnit
                endif
                set i = i + 1
            endloop
            call PauseTimer(GetExpiredTimer())
            call DestroyTimer(GetExpiredTimer())
        endif

        set pFrame = null
    endfunction

    function initSelectHero takes nothing returns nothing
        local framehandle pFrame 
        local string s = ""
        local integer i = 1
        loop
            exitwhen i > 3
            if UserPlayer(Player(i)) then
                set pFrame = GetFrameByName("HeroSelectorNameText", i)
                set s = "|cffDAA520" + SubString(GetPlayerName(Player(i)), 0, 11)
                call SetFrameText(pFrame, s)
            endif
            set i = i + 1
        endloop
        set i = 5
        loop
            exitwhen i > 7
            if UserPlayer(Player(i)) then
                set pFrame = GetFrameByName("HeroSelectorNameText", i)
                set s = "|cffDAA520" + SubString(GetPlayerName(Player(i)), 0, 11)
                call SetFrameText(pFrame, s)
            endif
            set i = i + 1
        endloop
        set i = 9
        loop
            exitwhen i > 11
            if UserPlayer(Player(i)) then
                set pFrame = GetFrameByName("HeroSelectorNameText", i)
                set s = "|cffDAA520" + SubString(GetPlayerName(Player(i)), 0, 11)
                call SetFrameText(pFrame, s)
            endif
            set i = i + 1
        endloop
        call heroDataFrame()
        call TimerStart(CreateTimer(), 0.1, true, function runSelectHero)

        set pFrame = null
    endfunction
endlibrary