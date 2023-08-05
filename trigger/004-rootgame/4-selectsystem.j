library selectsystem uses preloadEffect finishselect initFrame

    globals
        private boolean isReady = false
    endglobals

    private function runSelectHero takes nothing returns nothing
        local framehandle timertxtFrame
        local framehandle backFrame
        local framehandle mainFrame
        local framehandle txtFrame
        local integer randomI 
        local integer i
        local integer j
        
        set SelectHeroTime = SelectHeroTime - 0.1
        if SelectHeroTime > - 3.0 then
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
            set timertxtFrame = GetFrameByName("SelectHeroTimerTextFrame", 0)
            call SetFrameText(timertxtFrame, "Selection Time Left : " + R2SW(SelectHeroTime, 0, 1))
        endif
        if SelectHeroTime == 5 or SelectHeroTime == 4 or SelectHeroTime == 3 or SelectHeroTime == 2 or SelectHeroTime == 1 then 
            call SoundStart("Sound\\Interface\\BattleNetTick.wav")
        endif
        if not isReady and SelectHeroTime > 5 then
            set i = 0
            set j = 0
            loop
                exitwhen i > 11
                if SelectedYet[i] and UserPlayer(Player(i)) then
                    set j = j + 1
                endif
                set i = i + 1
            endloop
            if j == playerCount then 
                set isReady = true
                set SelectHeroTime = 5
            endif
        endif
        if SelectHeroTime == 0 then
            set timertxtFrame = GetFrameByName("SelectHeroTimerTextFrame", 0)
            call SetFrameText(timertxtFrame, "Selection Time Left : 0.0")

            set i = 0
            loop
                exitwhen i > 11
                if UserPlayer(Player(i)) then
                    loop
                        exitwhen SelectedYet[i]
                        set randomI = GetRandomInt(1, udg_MaxHero)
                        if not HeroGone[randomI] then
                            set MemoHero[i] = randomI

                            set backFrame = GetFrameByName("SelectHeroBackViewFrame", i)
                            call SetFrameTexture(backFrame, HeroPhoto[randomI], 0, false)

                            set backFrame = GetFrameByName("SelectHeroButtonBackFrame", randomI)
                            call SetFrameTexture(backFrame, HeroPhoto2[randomI], 0, false)

                            if HeroVoice[randomI] != "" then
                                call SoundStartPlayer(HeroVoice[randomI], Player(i), false)
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
            set mainFrame = GetFrameByName("SelectHeroMainFrame", 0)
            call ShowFrame(mainFrame, false)
            call createDefaultUI()
            call createDefaultUI2()
            call shopUICreate()
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

                    if isTestMode then
                        call SetHeroLevel(bj_lastCreatedUnit, 40, false)
                    endif
                    
                    set backFrame = GetFrameByName("ScoreHeroBackground", i)
                    call SetFrameTexture(backFrame, HeroPhoto[MemoHero[i]], 0, false)
                    set backFrame = GetFrameByName("HeroIconFrame", i)
                    call SetFrameTexture(backFrame, HeroPhoto[MemoHero[i]], 0, false)
                    set txtFrame = GetFrameByName("PlayerNameFrame", i)
                    call SetFrameText(txtFrame, playerName[i])

                    set MainHero[i] = bj_lastCreatedUnit
                endif
                set i = i + 1
            endloop

            call PauseTimer(GetExpiredTimer())
            call DestroyTimer(GetExpiredTimer())
        endif

        set timertxtFrame = null
        set backFrame = null
        set mainFrame = null
        set txtFrame = null
    endfunction

    function initSelectHero takes nothing returns nothing
        call TimerStart(CreateTimer(), 0.1, true, function runSelectHero)
    endfunction
endlibrary