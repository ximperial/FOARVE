library selectsystem uses preloadEffect finishselect initFrame

    globals
        private boolean isReady = false
        unit array MainHero
    endglobals

    private function runSelectHero takes nothing returns nothing
        local framehandle frame1
        local integer randomI 
        local integer i
        local integer j
        
        set SelectHeroTime = SelectHeroTime - 0.1
        if SelectHeroTime > - 3.0 then
            set i = 0
            loop
                exitwhen i > 11
                if UserPlayer(Player(i)) then
                    call CameraSetupApplyForPlayer( true, gg_cam_Select_Hero, Player(1), 0 )
                    call CameraSetupApplyForPlayer( true, gg_cam_Select_Hero, Player(2), 0 )
                    call CameraSetupApplyForPlayer( true, gg_cam_Select_Hero, Player(3), 0 )
                    call CameraSetupApplyForPlayer( true, gg_cam_Select_Hero, Player(4), 0 )
                    call CameraSetupApplyForPlayer( true, gg_cam_Select_Hero, Player(5), 0 )
                    call CameraSetupApplyForPlayer( true, gg_cam_Select_Hero, Player(7), 0 )
                    call CameraSetupApplyForPlayer( true, gg_cam_Select_Hero, Player(8), 0 )
                    call CameraSetupApplyForPlayer( true, gg_cam_Select_Hero, Player(9), 0 )
                    call CameraSetupApplyForPlayer( true, gg_cam_Select_Hero, Player(10), 0 )
                    call CameraSetupApplyForPlayer( true, gg_cam_Select_Hero, Player(11), 0 )
                endif
                set i = i + 1
            endloop
        endif
        if SelectHeroTime > 0 then
            set frame1 = GetFrameByName("SelectionHeroTimerText", 0)
            call SetFrameText(frame1, R2SW(SelectHeroTime, 0, 1))
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
            set frame1 = GetFrameByName("SelectionHeroTimerText", 0)
            call SetFrameText(frame1, "")

            set i = 0
            loop
                exitwhen i > 11
                if UserPlayer(Player(i)) then
                    loop
                        exitwhen SelectedYet[i]
                        set randomI = GetRandomInt(1, MaxHero)
                        if not HeroGone[randomI] then
                            set MemoHero[i] = randomI

                            set frame1 = GetFrameByName("SelectionHeroView", i)
                            call SetFrameTexture(frame1, HeroIcon[randomI], 0, false)

                            set frame1 = GetFrameByName("SelectionHeroButtonIcon", randomI)
                            call SetFrameTexture(frame1, HeroIcon2[randomI], 0, false)

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
            call DisplayTimedTextToForce( bj_FORCE_ALL_PLAYERS, 5, "Loading Resources..."   )
            call callPreloadEffect()
        endif
        if SelectHeroTime == - 3 and LoadEffectFinish then
            call ClearTextMessagesBJ(bj_FORCE_ALL_PLAYERS)
            set frame1 = GetFrameByName("SelectionHeroMain", 0)
            call ShowFrame(frame1, false)
            call createDefaultUI()
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
                        call PanCameraToTimedForPlayer(Player(i), GetRectCenterX(gg_rct_Team1Revive) , GetRectCenterY(gg_rct_Team1Revive) , 0)
                    elseif IsPlayerAlly(Player(i) , Player(6)) then
                        set bj_lastCreatedUnit = CreateUnit(Player(i), HeroType[MemoHero[i]], GetRectCenterX(gg_rct_Team2Revive), GetRectCenterY(gg_rct_Team2Revive), 0)
                        call PanCameraToTimedForPlayer(Player(i), GetRectCenterX(gg_rct_Team2Revive) , GetRectCenterY(gg_rct_Team2Revive) , 0)
                    endif
                    
                    set frame1 = GetFrameByName("ScoreHeroView", i)
                    call SetFrameTexture(frame1, HeroIcon[MemoHero[i]], 0, false)
                    set frame1 = GetFrameByName("BoardHeroIcon", i)
                    call SetFrameTexture(frame1, HeroIcon[MemoHero[i]], 0, false)
                    set frame1 = GetFrameByName("BoardName", i)
                    call SetFrameText(frame1, playerName[i])

                    set MainHero[i] = bj_lastCreatedUnit
                endif
                set i = i + 1
            endloop

            call PauseTimer(GetExpiredTimer())
            call DestroyTimer(GetExpiredTimer())
        endif

        set frame1 = null
    endfunction

    function initSelectHero takes nothing returns nothing
        call TimerStart(CreateTimer(), 0.1, true, function runSelectHero)
    endfunction
endlibrary