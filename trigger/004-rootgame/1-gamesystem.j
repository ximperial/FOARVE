scope startGame initializer init

    globals
        dialog UISync = null
        dialog gDialog = null
        button array gDialogButton
        private unit array dummyui
    endglobals

    private function fogRemove takes nothing returns nothing
        call SetPlayerHandicapXP( GetEnumPlayer(), 1.0 )
        call CreateFogModifierRectBJ( true, GetEnumPlayer(), FOG_OF_WAR_VISIBLE, gg_rct_Boss_Arena )
        call CreateFogModifierRectBJ( true, GetEnumPlayer(), FOG_OF_WAR_VISIBLE, gg_rct_TestArea )
        call CreateFogModifierRectBJ( true, GetEnumPlayer(), FOG_OF_WAR_VISIBLE, gg_rct_HibariR )
    endfunction

    private function runMode takes nothing returns nothing
        local integer i = 0
        if preloadIconFinish then
            call ClearTextMessagesBJ( bj_FORCE_ALL_PLAYERS )
            call DisplayTextToForce( bj_FORCE_ALL_PLAYERS, "Waiting for " + "|cff0042ff" + playerName[1] + "|r" + " choose mode"   )
            call DialogSetMessage(gDialog, "Game Mode")
            call DialogAddButtonBJ(gDialog, "Point Mode")
            set gDialogButton[0] = bj_lastCreatedButton
            call DialogDisplay(Player(1), gDialog, true)
            call UnitAddAbility(dummyui[0], 'A07Q')
            call UnitAddAbility(dummyui[0], 'A03M')
            call UnitAddAbility(dummyui[0], 'A0IA')
            call UnitAddAbility(dummyui[0], 'A0EW')
            call UnitAddAbility(dummyui[0], 'A0I1')
            call UnitAddAbility(dummyui[0], 'A051')
            call UnitAddAbility(dummyui[0], 'A059')
            call UnitAddAbility(dummyui[0], 'A052')
            call SelectUnit(dummyui[0], true)
            set i = 0
            loop
                exitwhen i > 12
                call RemoveUnit(dummyui[i])
                set i = i + 1
            endloop
            call PauseTimer(GetExpiredTimer())
            call DestroyTimer(GetExpiredTimer())
        endif
    endfunction

    private function startGame takes nothing returns nothing
        local integer i = 0
        
        call ClearMapMusic( )
        call PlayMusic("Music\\1.mp3;Music\\2.mp3;Music\\3.mp3;Music\\4.mp3;Music\\5.mp3;Music\\6.mp3;Music\\7.mp3;Music\\8.mp3")
        call SetMapFlag( MAP_LOCK_RESOURCE_TRADING, true )
        call ClearTextMessagesBJ( bj_FORCE_ALL_PLAYERS )
        call SetWidescreenState(true)
        call EnableOperationLimit(false)
        call EnableAntiHack(true)
        call dataOnStart()
        set UISync = DialogCreate()
        call DialogSetMessage(UISync, "UI Sync")
        loop
            exitwhen i > 11
            if UserPlayer(Player(i)) then
                call DialogDisplay(Player(i), UISync, true)
                call DialogDisplay(Player(i), UISync, false)
            endif
            set i = i + 1
        endloop
        call DialogDestroy( UISync )
        set i = 0
        loop
            exitwhen i > 11
            set dummyui[i] = CreateUnit(Player(1), 'ncop', 0, 0, 0)
            set i = i + 1
        endloop
        set dummyui[12] = CreateUnit(Player(15), 'n000', 0, 0, 0)
        call SelectUnit(dummyui[12], true)
        call ForForce(bj_FORCE_ALL_PLAYERS, function fogRemove)
        call DisplayTimedTextToForce( bj_FORCE_ALL_PLAYERS, 60, "Loading UI/UX Resources..."   )
        call AncestorFrame()
        call setIconData()
        call UnitAddBonus(gg_unit_H0DS_0066, BONUS_ATTACKSPEED, 5)
        call TimerStart(GetExpiredTimer(), 0.1, true, function runMode)
    endfunction
    
    globals
        integer maxPointMode = 0
        integer array teamPoint
        boolean isTestMode = false
    endglobals

    private function dialogClick takes nothing returns nothing
        local integer i = 0
        if GetClickedButton() == gDialogButton[0] then
            call ClearTextMessagesBJ(bj_FORCE_ALL_PLAYERS)
            call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|c000000ff" + playerName[1] + "|r has chosen Point Mode")
            call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "Kill hero + 1 point")
            call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "Destroy structure + 3 point")
            call PolledWaitEx(1.0)
            call DialogClear(gDialog)
            call DialogSetMessage(gDialog, "Set Point Amount")
            call DialogAddButtonBJ(gDialog, "120 point")
            set gDialogButton[1] = bj_lastCreatedButton
            call DialogAddButtonBJ(gDialog, "100 point")
            set gDialogButton[2] = bj_lastCreatedButton
            call DialogAddButtonBJ(gDialog, "70 point")
            set gDialogButton[3] = bj_lastCreatedButton
            call DialogDisplay(Player(1), gDialog, true)
        elseif GetClickedButton() == gDialogButton[1] or GetClickedButton() == gDialogButton[2] or GetClickedButton() == gDialogButton[3] then
            if GetClickedButton() == gDialogButton[1] then
                set maxPointMode = 120
                call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff0042ff" + playerName[1] + "|r has chosen 120 point")
            elseif GetClickedButton() == gDialogButton[2] then
                set maxPointMode = 100
                call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff0042ff" + playerName[1] + "|r has chosen 100 point")
            else
                set maxPointMode = 70
                call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff0042ff" + playerName[1] + "|r has chosen 70 point")
            endif
            call PolledWaitEx(1.0)
            set teamPoint[1] = 0
            set teamPoint[2] = 0
            set teamPoint[3] = 0
            call DialogClear(gDialog)
            call DialogSetMessage(gDialog, "Base Mode")
            call DialogAddButtonBJ(gDialog, "Normal")
            set gDialogButton[4] = bj_lastCreatedButton
            call DialogAddButtonBJ(gDialog, "Test")
            set gDialogButton[5] = bj_lastCreatedButton
            call DialogDisplay(Player(1), gDialog, true)
        elseif GetClickedButton() == gDialogButton[4] or GetClickedButton() == gDialogButton[5] then
            if GetClickedButton() == gDialogButton[4] then
                call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff0042ff" + playerName[1] + "|r has chosen Normal Mode")
            else
                set isTestMode = true
                call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "|cff0042ff" + playerName[1] + "|r has chosen Test Mode")
            endif
            call PolledWaitEx(1.0)
            if isTestMode then
                loop
                    exitwhen i > 11
                    if UserPlayer(Player(i)) then
                        call SetPlayerState(Player(i), PLAYER_STATE_RESOURCE_GOLD, 1000000)
                    endif
                    set i = i + 1
                endloop
            endif
            call createSelectionUI()
            call initSelectHero()
        endif
    endfunction

    globals
        private boolean isGameFinish = false
        integer victoryid = 0
    endglobals

    private function finishGame takes nothing returns nothing
        if not isGameFinish then
            if teamPoint[1] >= maxPointMode then
                set isGameFinish = true
                call GroupEnumUnitsInRect(gGroup, WorldBounds.world, null)
                loop
                    set gUnit = GroupForEachUnit(gGroup)
                    exitwhen gUnit == null
                    call PauseUnit(gUnit, true)
                endloop
                call GroupClear(gGroup)
                set victoryid = 1
                call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "Calculating Score...")
                call PolledWaitEx(3.0)
                call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "Game End")
                call CustomVictoryBJ( Player(1), true, true )
                call CustomVictoryBJ( Player(2), true, true )
                call CustomVictoryBJ( Player(3), true, true )
                call CustomDefeatBJ( Player(5), "Defeat" )
                call CustomDefeatBJ( Player(6), "Defeat" )
                call CustomDefeatBJ( Player(7), "Defeat" )
                call CustomDefeatBJ( Player(9), "Defeat" )
                call CustomDefeatBJ( Player(10), "Defeat" )
                call CustomDefeatBJ( Player(11), "Defeat" )
            elseif teamPoint[2] >= maxPointMode then
                set isGameFinish = true
                call GroupEnumUnitsInRect(gGroup, WorldBounds.world, null)
                loop
                    set gUnit = GroupForEachUnit(gGroup)
                    exitwhen gUnit == null
                    call PauseUnit(gUnit, true)
                endloop
                call GroupClear(gGroup)
                set victoryid = 2
                call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "Calculating Score...")
                call PolledWaitEx(3.0)
                call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "Game End")
                call CustomVictoryBJ( Player(7), true, true )
                call CustomVictoryBJ( Player(6), true, true )
                call CustomVictoryBJ( Player(5), true, true )
                call CustomDefeatBJ( Player(9), "Defeat" )
                call CustomDefeatBJ( Player(10), "Defeat" )
                call CustomDefeatBJ( Player(11), "Defeat" )
                call CustomDefeatBJ( Player(1), "Defeat" )
                call CustomDefeatBJ( Player(2), "Defeat" )
                call CustomDefeatBJ( Player(3), "Defeat" )
            elseif teamPoint[3] >= maxPointMode then
                set isGameFinish = true
                call GroupEnumUnitsInRect(gGroup, WorldBounds.world, null)
                loop
                    set gUnit = GroupForEachUnit(gGroup)
                    exitwhen gUnit == null
                    call PauseUnit(gUnit, true)
                endloop
                call GroupClear(gGroup)
                set victoryid = 3
                call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "Calculating Score...")
                call PolledWaitEx(3.0)
                call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "Game End")
                call CustomVictoryBJ( Player(9), true, true )
                call CustomVictoryBJ( Player(10), true, true )
                call CustomVictoryBJ( Player(11), true, true )
                call CustomDefeatBJ( Player(1), "Defeat" )
                call CustomDefeatBJ( Player(2), "Defeat" )
                call CustomDefeatBJ( Player(3), "Defeat" )
                call CustomDefeatBJ( Player(5), "Defeat" )
                call CustomDefeatBJ( Player(6), "Defeat" )
                call CustomDefeatBJ( Player(7), "Defeat" )
            endif
        endif
    endfunction

    private function pointChecker takes nothing returns nothing
        local unit u = GetKillingUnit()
        local unit t = GetTriggerUnit()
        local framehandle pFrame = null
        local string s = ""
        if maxPointMode != 0 then
            if IsUnitHero(t) then
                if IsUnitAlly(u, Player(0)) then
                    set teamPoint[1] = teamPoint[1] + 1
                    set pFrame = GetFrameByName("TextPoint", 0)
                    set s = "|cffDAA520" + I2S(teamPoint[1])
                    call SetFrameText(pFrame, s)
                elseif IsUnitAlly(u, Player(4)) then
                    set teamPoint[2] = teamPoint[2] + 1
                    set pFrame = GetFrameByName("TextPoint", 1)
                    set s = "|cffDAA520" + I2S(teamPoint[2])
                    call SetFrameText(pFrame, s)
                elseif IsUnitAlly(u, Player(8)) then
                    set teamPoint[3] = teamPoint[3] + 1
                    set pFrame = GetFrameByName("TextPoint", 2)
                    set s = "|cffDAA520" + I2S(teamPoint[3])
                    call SetFrameText(pFrame, s)
                endif
                call finishGame()
            endif
            if IsUnitTower(t) and t != gg_unit_o003_0010 and t != gg_unit_o003_0031 and t != gg_unit_o003_0012 then
                if IsUnitAlly(GetKillingUnit(), Player(0)) then
                    set teamPoint[1] = teamPoint[1] + 1
                    set pFrame = GetFrameByName("TextPoint", 0)
                    set s = "|cffDAA520" + I2S(teamPoint[1])
                    call SetFrameText(pFrame, s)
                elseif IsUnitAlly(GetKillingUnit(), Player(4)) then
                    set teamPoint[2] = teamPoint[2] + 1
                    set pFrame = GetFrameByName("TextPoint", 1)
                    set s = "|cffDAA520" + I2S(teamPoint[2])
                    call SetFrameText(pFrame, s)
                elseif IsUnitAlly(GetKillingUnit(), Player(8)) then
                    set teamPoint[3] = teamPoint[3] + 1
                    set pFrame = GetFrameByName("TextPoint", 2)
                    set s = "|cffDAA520" + I2S(teamPoint[3])
                    call SetFrameText(pFrame, s)
                endif
                call finishGame()
            endif
        endif
        if not isGameFinish and (not IsUnitAlive(gg_unit_o003_0010) or not IsUnitAlive(gg_unit_o003_0031) or not IsUnitAlive(gg_unit_o003_0012)) then
            if IsUnitAlly(u, Player(0)) then
                set isGameFinish = true
                call GroupEnumUnitsInRect(gGroup, WorldBounds.world, null)
                loop
                    set gUnit = GroupForEachUnit(gGroup)
                    exitwhen gUnit == null
                    call PauseUnit(gUnit, true)
                endloop
                call GroupClear(gGroup)
                set victoryid = 1
                call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "Calculating Score...")
                call PolledWaitEx(3.0)
                call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "Game End")
                call CustomVictoryBJ( Player(1), true, true )
                call CustomVictoryBJ( Player(2), true, true )
                call CustomVictoryBJ( Player(3), true, true )
                call CustomDefeatBJ( Player(5), "Defeat" )
                call CustomDefeatBJ( Player(6), "Defeat" )
                call CustomDefeatBJ( Player(7), "Defeat" )
                call CustomDefeatBJ( Player(9), "Defeat" )
                call CustomDefeatBJ( Player(10), "Defeat" )
                call CustomDefeatBJ( Player(11), "Defeat" )
            elseif IsUnitAlly(u, Player(4)) then
                set isGameFinish = true
                call GroupEnumUnitsInRect(gGroup, WorldBounds.world, null)
                loop
                    set gUnit = GroupForEachUnit(gGroup)
                    exitwhen gUnit == null
                    call PauseUnit(gUnit, true)
                endloop
                call GroupClear(gGroup)
                set victoryid = 2
                call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "Calculating Score...")
                call PolledWaitEx(3.0)
                call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "Game End")
                call CustomVictoryBJ( Player(7), true, true )
                call CustomVictoryBJ( Player(6), true, true )
                call CustomVictoryBJ( Player(5), true, true )
                call CustomDefeatBJ( Player(9), "Defeat" )
                call CustomDefeatBJ( Player(10), "Defeat" )
                call CustomDefeatBJ( Player(11), "Defeat" )
                call CustomDefeatBJ( Player(1), "Defeat" )
                call CustomDefeatBJ( Player(2), "Defeat" )
                call CustomDefeatBJ( Player(3), "Defeat" )
            elseif IsUnitAlly(u, Player(8)) then
                set isGameFinish = true
                call GroupEnumUnitsInRect(gGroup, WorldBounds.world, null)
                loop
                    set gUnit = GroupForEachUnit(gGroup)
                    exitwhen gUnit == null
                    call PauseUnit(gUnit, true)
                endloop
                call GroupClear(gGroup)
                set victoryid = 3
                call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "Calculating Score...")
                call PolledWaitEx(3.0)
                call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "Game End")
                call CustomVictoryBJ( Player(9), true, true )
                call CustomVictoryBJ( Player(10), true, true )
                call CustomVictoryBJ( Player(11), true, true )
                call CustomDefeatBJ( Player(1), "Defeat" )
                call CustomDefeatBJ( Player(2), "Defeat" )
                call CustomDefeatBJ( Player(3), "Defeat" )
                call CustomDefeatBJ( Player(5), "Defeat" )
                call CustomDefeatBJ( Player(6), "Defeat" )
                call CustomDefeatBJ( Player(7), "Defeat" )
            endif
        endif
        if GetUnitTypeId(t) == 'o005' then
            if IsUnitAlly(u, Player(0)) then
                call AdjustPlayerStateBJ( 300, Player(1), PLAYER_STATE_RESOURCE_GOLD )
                call AdjustPlayerStateBJ( 300, Player(2), PLAYER_STATE_RESOURCE_GOLD )
                call AdjustPlayerStateBJ( 300, Player(3), PLAYER_STATE_RESOURCE_GOLD )
            elseif IsUnitAlly(u, Player(4)) then
                call AdjustPlayerStateBJ( 300, Player(5), PLAYER_STATE_RESOURCE_GOLD )
                call AdjustPlayerStateBJ( 300, Player(6), PLAYER_STATE_RESOURCE_GOLD )
                call AdjustPlayerStateBJ( 300, Player(7), PLAYER_STATE_RESOURCE_GOLD )
            elseif IsUnitAlly(u, Player(8)) then
                call AdjustPlayerStateBJ( 300, Player(9), PLAYER_STATE_RESOURCE_GOLD )
                call AdjustPlayerStateBJ( 300, Player(10), PLAYER_STATE_RESOURCE_GOLD )
                call AdjustPlayerStateBJ( 300, Player(11), PLAYER_STATE_RESOURCE_GOLD )
            endif
            if t == gg_unit_o005_0057 then
                call SetUnitInvulnerable( gg_unit_o005_0022, false)
            elseif t == gg_unit_o005_0058 then
                call SetUnitInvulnerable( gg_unit_o005_0021, false)
            elseif t == gg_unit_o005_0059 then
                call SetUnitInvulnerable( gg_unit_o005_0011, false)
            elseif t == gg_unit_o005_0056 then
                call SetUnitInvulnerable(gg_unit_o005_0035, false)
            elseif t == gg_unit_o005_0055 then
                call SetUnitInvulnerable(gg_unit_o005_0036, false)
            elseif t == gg_unit_o005_0054 then
                call SetUnitInvulnerable(gg_unit_o005_0037, false)
            elseif t == gg_unit_o005_0053 then
                call SetUnitInvulnerable(gg_unit_o005_0050, false)
            elseif t == gg_unit_o005_0052 then
                call SetUnitInvulnerable(gg_unit_o005_0049, false)
            elseif t == gg_unit_o005_0002 then
                call SetUnitInvulnerable(gg_unit_o005_0048, false)
            elseif t == gg_unit_o005_0022 then
                call SetUnitInvulnerable(gg_unit_o008_0019, false)
            elseif t == gg_unit_o005_0021 then
                call SetUnitInvulnerable(gg_unit_o008_0023, false)
            elseif t == gg_unit_o005_0011 then
                call SetUnitInvulnerable(gg_unit_o008_0014, false)
            elseif t == gg_unit_o005_0035 then
                call SetUnitInvulnerable(gg_unit_o008_0033, false)
            elseif t == gg_unit_o005_0036 then
                call SetUnitInvulnerable(gg_unit_o008_0034, false)
            elseif t == gg_unit_o005_0037 then
                call SetUnitInvulnerable(gg_unit_o008_0032, false)
            elseif t == gg_unit_o005_0050 then
                call SetUnitInvulnerable(gg_unit_o008_0046, false)
            elseif t == gg_unit_o005_0048 then
                call SetUnitInvulnerable(gg_unit_o008_0045, false)
            endif
        endif
        if GetUnitTypeId(t) == 'o008' then
            if IsUnitAlly(u, Player(0)) then
                call AdjustPlayerStateBJ( 500, Player(1), PLAYER_STATE_RESOURCE_GOLD )
                call AdjustPlayerStateBJ( 500, Player(2), PLAYER_STATE_RESOURCE_GOLD )
                call AdjustPlayerStateBJ( 500, Player(3), PLAYER_STATE_RESOURCE_GOLD )
            elseif IsUnitAlly(u, Player(4)) then
                call AdjustPlayerStateBJ( 500, Player(5), PLAYER_STATE_RESOURCE_GOLD )
                call AdjustPlayerStateBJ( 500, Player(6), PLAYER_STATE_RESOURCE_GOLD )
                call AdjustPlayerStateBJ( 500, Player(7), PLAYER_STATE_RESOURCE_GOLD )
            elseif IsUnitAlly(u, Player(8)) then
                call AdjustPlayerStateBJ( 500, Player(9), PLAYER_STATE_RESOURCE_GOLD )
                call AdjustPlayerStateBJ( 500, Player(10), PLAYER_STATE_RESOURCE_GOLD )
                call AdjustPlayerStateBJ( 500, Player(11), PLAYER_STATE_RESOURCE_GOLD )
            endif
            if t == gg_unit_o008_0019 then
                call DestroyTextTag(creepText[2])
            elseif t == gg_unit_o008_0023 then
                call DestroyTextTag(creepText[0])
            elseif t == gg_unit_o008_0014 then
                call DestroyTextTag(creepText[1])
            elseif t == gg_unit_o008_0033 then
                call DestroyTextTag(creepText[5])
            elseif t == gg_unit_o008_0034 then
                call DestroyTextTag(creepText[3])
            elseif t == gg_unit_o008_0032 then
                call DestroyTextTag(creepText[4])
            elseif t == gg_unit_o008_0045 then
                call DestroyTextTag(creepText[7])
            elseif t == gg_unit_o008_0047 then
                call DestroyTextTag(creepText[6])
            elseif t == gg_unit_o008_0046 then
                call DestroyTextTag(creepText[8])
            endif
            if not IsUnitAlive(gg_unit_o008_0019) and not IsUnitAlive(gg_unit_o008_0023) and not IsUnitAlive(gg_unit_o008_0014) then
                call SetUnitInvulnerable(gg_unit_o003_0010, false)
            endif
            if not IsUnitAlive(gg_unit_o008_0033) and not IsUnitAlive(gg_unit_o008_0034) and not IsUnitAlive(gg_unit_o008_0032) then
                call SetUnitInvulnerable(gg_unit_o003_0031, false)
            endif
            if not IsUnitAlive(gg_unit_o008_0046) and not IsUnitAlive(gg_unit_o008_0047) and not IsUnitAlive(gg_unit_o008_0045) then
                call SetUnitInvulnerable(gg_unit_o003_0012, false)
            endif
        endif

        set u = null
        set t = null
        set pFrame = null
    endfunction

    private function blockAlly takes nothing returns nothing
        if IsUnitAlly(GetTriggerUnit(), GetOwningPlayer(GetAttacker())) then
            call IssueImmediateOrderById(GetAttacker(), 851972)
        endif
    endfunction

    private function PlayerLeave takes nothing returns nothing
        local integer i
        set playerCount = playerCount - 1
        set MainHero[GetPlayerId(GetTriggerPlayer())] = null
        set isPlaying[GetPlayerId(GetTriggerPlayer())] = false
        call DisplayTextToForce( bj_FORCE_ALL_PLAYERS, "|cff00ff00" + playerName[GetPlayerId(GetTriggerPlayer())] + "|r" + " has left the game"  )
        call GroupEnumUnitsInRect(gGroup, WorldBounds.world, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if GetOwningPlayer(gUnit) == GetTriggerPlayer() then
                if IsUnitAlly(gUnit, Player(0)) then
                    set i = 1
                    loop
                        exitwhen i > 3
                        call AdjustPlayerStateBJ(2000, Player(i), PLAYER_STATE_RESOURCE_GOLD)
                        set i = i + 1
                    endloop
                elseif IsUnitAlly(gUnit, Player(4)) then
                    set i = 5
                    loop
                        exitwhen i > 7
                        call AdjustPlayerStateBJ(2000, Player(i), PLAYER_STATE_RESOURCE_GOLD)
                        set i = i + 1
                    endloop
                else
                    set i = 9
                    loop
                        exitwhen i > 11
                        call AdjustPlayerStateBJ(2000, Player(i), PLAYER_STATE_RESOURCE_GOLD)
                        set i = i + 1
                    endloop
                endif
                call RemoveUnit(gUnit)
            endif
        endloop
        call GroupClear(gGroup)
    endfunction

    private function init takes nothing returns nothing
        local trigger t = CreateTrigger()
        set gDialog = DialogCreate()
        call TriggerRegisterDialogEvent(t, gDialog)
        call TriggerAddAction(t, function dialogClick)
        set t = CreateTrigger()
        call TriggerRegisterPlayerEventLeave( t, Player(1) )
        call TriggerRegisterPlayerEventLeave( t, Player(2) )
        call TriggerRegisterPlayerEventLeave( t, Player(3) )
        call TriggerRegisterPlayerEventLeave( t, Player(5) )
        call TriggerRegisterPlayerEventLeave( t, Player(6) )
        call TriggerRegisterPlayerEventLeave( t, Player(7) )
        call TriggerRegisterPlayerEventLeave( t, Player(9) )
        call TriggerRegisterPlayerEventLeave( t, Player(10) )
        call TriggerRegisterPlayerEventLeave( t, Player(11) )
        call TriggerAddAction(t, function PlayerLeave)
        set t = CreateTrigger()
        call TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_DEATH)
        call TriggerAddAction(t, function pointChecker)
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_ATTACKED, function blockAlly)
        call TimerStart(CreateTimer(), 0.1, false, function startGame)

        set t = null
    endfunction
endscope