scope startGame initializer init

    globals
        dialog UISync = null
        dialog gDialog = null
        button array gDialogButton
        private unit array dummyui
        integer MaxPoinMode = 100
        integer array PoinTeam
    endglobals

    private function runModeEx takes nothing returns nothing
        call ShowFrame(GetFrameByName("SelectionHeroMain", 0), true)
        call initSelectHero()
        call DestroyTimer(GetExpiredTimer())
    endfunction

    private function runMode takes nothing returns nothing
        local integer i
        call DisplayTimedTextToForce( bj_FORCE_ALL_PLAYERS, 5, "Loading Resources..."   )
        call UnitAddAbility(dummyui[0], 'A07Q')
        call UnitAddAbility(dummyui[0], 'A03M')
        call UnitAddAbility(dummyui[0], 'A0IA')
        call UnitAddAbility(dummyui[0], 'A0EW')
        call UnitAddAbility(dummyui[0], 'A0I1')
        call UnitAddAbility(dummyui[0], 'A051')
        call UnitAddAbility(dummyui[0], 'A059')
        call UnitAddAbility(dummyui[0], 'A052')
        call UnitAddItemByIdSwapped('hslv', dummyui[0])
        call StartItemCooldown(dummyui[0], bj_lastCreatedItem, 30)
        call UnitAddItemByIdSwapped('hslv', dummyui[0])
        call StartItemCooldown(dummyui[0], bj_lastCreatedItem, 30)
        call UnitAddItemByIdSwapped('hslv', dummyui[0])
        call StartItemCooldown(dummyui[0], bj_lastCreatedItem, 30)
        call UnitAddItemByIdSwapped('hslv', dummyui[0])
        call StartItemCooldown(dummyui[0], bj_lastCreatedItem, 30)
        call UnitAddItemByIdSwapped('hslv', dummyui[0])
        call StartItemCooldown(dummyui[0], bj_lastCreatedItem, 30)
        call UnitAddItemByIdSwapped('hslv', dummyui[0])
        call StartItemCooldown(dummyui[0], bj_lastCreatedItem, 30)
        call SelectUnit(dummyui[0], true)
        set i = 0
        loop
            exitwhen i > 12
            call RemoveUnit(dummyui[i])
            set i = i + 1
        endloop
        call createSelectionUI()
        call TimerStart(GetExpiredTimer(), 3, false, function runModeEx)
    endfunction

    private function startGame takes nothing returns nothing
        local integer i
        
        call ClearMapMusic( )
        call PlayMusic("Music\\1.mp3;Music\\2.mp3;Music\\3.mp3;Music\\4.mp3;Music\\5.mp3;Music\\6.mp3;Music\\7.mp3;Music\\8.mp3")
        call SetMapFlag( MAP_LOCK_RESOURCE_TRADING, true )
        call ClearTextMessagesBJ( bj_FORCE_ALL_PLAYERS )
        call EnableOperationLimit(false)
        call AntiHackEnable(true)
        call FogMaskEnable(false)
        call DataOnStart()
        set UISync = DialogCreate()
        call DialogSetMessage(UISync, "UI Sync")
        set i = 0
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
            set dummyui[i] = CreateUnit(Player(i), 'ncop', 0, 0, 0)
            set i = i + 1
        endloop
        set dummyui[12] = CreateUnit(Player(15), 'n000', 0, 0, 0)
        call SelectUnit(dummyui[12], true)
        call AncestorFrame()
        call TimerStart(GetExpiredTimer(), 3, false, function runMode)
    endfunction

    globals
        private boolean IsFinish = false
    endglobals

    private function finishGame takes nothing returns nothing
        if not IsFinish then
            if PoinTeam[1] >= MaxPoinMode then
                set IsFinish = true
                call GroupEnumUnitsInRect(gGroup, WorldBounds.world, null)
                loop
                    set gUnit = GroupForEachUnit(gGroup)
                    exitwhen gUnit == null
                    call PauseUnit(gUnit, true)
                endloop
                call GroupClear(gGroup)
                call PolledWaitEx(1)
                call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "Game End")
                call CustomVictoryBJ( Player(1), true, true )
                call CustomVictoryBJ( Player(2), true, true )
                call CustomVictoryBJ( Player(3), true, true )
                call CustomVictoryBJ( Player(4), true, true )
                call CustomVictoryBJ( Player(5), true, true )
                call CustomDefeatBJ( Player(7), "Defeat" )
                call CustomDefeatBJ( Player(8), "Defeat" )
                call CustomDefeatBJ( Player(9), "Defeat" )
                call CustomDefeatBJ( Player(10), "Defeat" )
                call CustomDefeatBJ( Player(11), "Defeat" )
            elseif PoinTeam[2] >= MaxPoinMode then
                set IsFinish = true
                call GroupEnumUnitsInRect(gGroup, WorldBounds.world, null)
                loop
                    set gUnit = GroupForEachUnit(gGroup)
                    exitwhen gUnit == null
                    call PauseUnit(gUnit, true)
                endloop
                call GroupClear(gGroup)
                call PolledWaitEx(1)
                call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "Game End")
                call CustomVictoryBJ( Player(7), true, true )
                call CustomVictoryBJ( Player(8), true, true )
                call CustomVictoryBJ( Player(9), true, true )
                call CustomVictoryBJ( Player(10), true, true )
                call CustomVictoryBJ( Player(11), true, true )
                call CustomDefeatBJ( Player(1), "Defeat" )
                call CustomDefeatBJ( Player(2), "Defeat" )
                call CustomDefeatBJ( Player(3), "Defeat" )
                call CustomDefeatBJ( Player(4), "Defeat" )
                call CustomDefeatBJ( Player(5), "Defeat" )
            endif
        endif
    endfunction

    private function pointChecker takes nothing returns nothing
        local unit u = GetKillingUnit()
        local unit t = GetTriggerUnit()
        local string s = ""
        local framehandle frame1

        if IsUnitHero(t) then
            if IsUnitAlly(u, Player(0)) then
                set PoinTeam[1] = PoinTeam[1] + 1
            elseif IsUnitAlly(u, Player(6)) then
                set PoinTeam[2] = PoinTeam[2] + 1
            endif
            set frame1 = GetFrameByName("ScoreBoardText", 0)
            call SetFrameText(frame1, "Team1 Score : " + I2S(PoinTeam[1]) + "\nTeam2 Score : " + I2S(PoinTeam[2]) + "\nWin Score : 100")
            call finishGame()
        endif
        if not IsFinish and (not IsUnitAlive(gg_unit_o003_0020) or not IsUnitAlive(gg_unit_o003_0009)) then
            if IsUnitAlly(u, Player(0)) then
                set IsFinish = true
                call GroupEnumUnitsInRect(gGroup, WorldBounds.world, null)
                loop
                    set gUnit = GroupForEachUnit(gGroup)
                    exitwhen gUnit == null
                    call PauseUnit(gUnit, true)
                endloop
                call GroupClear(gGroup)
                call PolledWaitEx(1)
                call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "Game End")
                call CustomVictoryBJ( Player(1), true, true )
                call CustomVictoryBJ( Player(2), true, true )
                call CustomVictoryBJ( Player(3), true, true )
                call CustomVictoryBJ( Player(4), true, true )
                call CustomVictoryBJ( Player(5), true, true )
                call CustomDefeatBJ( Player(7), "Defeat" )
                call CustomDefeatBJ( Player(8), "Defeat" )
                call CustomDefeatBJ( Player(9), "Defeat" )
                call CustomDefeatBJ( Player(10), "Defeat" )
                call CustomDefeatBJ( Player(11), "Defeat" )
            elseif IsUnitAlly(u, Player(6)) then
                set IsFinish = true
                call GroupEnumUnitsInRect(gGroup, WorldBounds.world, null)
                loop
                    set gUnit = GroupForEachUnit(gGroup)
                    exitwhen gUnit == null
                    call PauseUnit(gUnit, true)
                endloop
                call GroupClear(gGroup)
                call PolledWaitEx(1)
                call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "Game End")
                call CustomVictoryBJ( Player(7), true, true )
                call CustomVictoryBJ( Player(8), true, true )
                call CustomVictoryBJ( Player(9), true, true )
                call CustomVictoryBJ( Player(10), true, true )
                call CustomVictoryBJ( Player(11), true, true )
                call CustomDefeatBJ( Player(1), "Defeat" )
                call CustomDefeatBJ( Player(2), "Defeat" )
                call CustomDefeatBJ( Player(3), "Defeat" )
                call CustomDefeatBJ( Player(4), "Defeat" )
                call CustomDefeatBJ( Player(5), "Defeat" )
            endif
        endif
        if GetUnitTypeId(t) == 'o005' then
            if IsUnitAlly(u, Player(0)) then
                call AdjustPlayerStateBJ( 300, Player(1), PLAYER_STATE_RESOURCE_GOLD )
                call AdjustPlayerStateBJ( 300, Player(2), PLAYER_STATE_RESOURCE_GOLD )
                call AdjustPlayerStateBJ( 300, Player(3), PLAYER_STATE_RESOURCE_GOLD )
                call AdjustPlayerStateBJ( 300, Player(4), PLAYER_STATE_RESOURCE_GOLD )
                call AdjustPlayerStateBJ( 300, Player(5), PLAYER_STATE_RESOURCE_GOLD )
            elseif IsUnitAlly(u, Player(6)) then
                call AdjustPlayerStateBJ( 300, Player(7), PLAYER_STATE_RESOURCE_GOLD )
                call AdjustPlayerStateBJ( 300, Player(8), PLAYER_STATE_RESOURCE_GOLD )
                call AdjustPlayerStateBJ( 300, Player(9), PLAYER_STATE_RESOURCE_GOLD )
                call AdjustPlayerStateBJ( 300, Player(10), PLAYER_STATE_RESOURCE_GOLD )
                call AdjustPlayerStateBJ( 300, Player(11), PLAYER_STATE_RESOURCE_GOLD )
            endif
            if t == gg_unit_o005_0031 then
                call SetUnitInvulnerable( gg_unit_o005_0030, false)
            elseif t == gg_unit_o005_0030 then
                call SetUnitInvulnerable( gg_unit_o000_0012, false)
            elseif t == gg_unit_o005_0033 then
                call SetUnitInvulnerable( gg_unit_o005_0032, false)
            elseif t == gg_unit_o005_0032 then
                call SetUnitInvulnerable( gg_unit_o000_0013, false)
            elseif t == gg_unit_o005_0035 then
                call SetUnitInvulnerable( gg_unit_o005_0034, false)
            elseif t == gg_unit_o005_0034 then
                call SetUnitInvulnerable( gg_unit_o000_0014, false)
            elseif t == gg_unit_o005_0042 then
                call SetUnitInvulnerable( gg_unit_o005_0041, false)
            elseif t == gg_unit_o005_0041 then
                call SetUnitInvulnerable( gg_unit_o000_0025, false)
            elseif t == gg_unit_o005_0040 then
                call SetUnitInvulnerable( gg_unit_o005_0039, false)
            elseif t == gg_unit_o005_0039 then
                call SetUnitInvulnerable( gg_unit_o000_0024, false)
            elseif t == gg_unit_o005_0037 then
                call SetUnitInvulnerable( gg_unit_o005_0036, false)
            elseif t == gg_unit_o005_0036 then
                call SetUnitInvulnerable( gg_unit_o000_0023, false)
            endif
        endif
        if GetUnitTypeId(t) == 'o000' then
            if IsUnitAlly(u, Player(0)) then
                call AdjustPlayerStateBJ( 500, Player(1), PLAYER_STATE_RESOURCE_GOLD )
                call AdjustPlayerStateBJ( 500, Player(2), PLAYER_STATE_RESOURCE_GOLD )
                call AdjustPlayerStateBJ( 500, Player(3), PLAYER_STATE_RESOURCE_GOLD )
                call AdjustPlayerStateBJ( 500, Player(4), PLAYER_STATE_RESOURCE_GOLD )
                call AdjustPlayerStateBJ( 500, Player(5), PLAYER_STATE_RESOURCE_GOLD )
            elseif IsUnitAlly(u, Player(6)) then
                call AdjustPlayerStateBJ( 500, Player(7), PLAYER_STATE_RESOURCE_GOLD )
                call AdjustPlayerStateBJ( 500, Player(8), PLAYER_STATE_RESOURCE_GOLD )
                call AdjustPlayerStateBJ( 500, Player(9), PLAYER_STATE_RESOURCE_GOLD )
                call AdjustPlayerStateBJ( 500, Player(10), PLAYER_STATE_RESOURCE_GOLD )
                call AdjustPlayerStateBJ( 500, Player(11), PLAYER_STATE_RESOURCE_GOLD )
            endif
            if not IsUnitAlive(gg_unit_o000_0012) and not IsUnitAlive(gg_unit_o000_0013) and not IsUnitAlive(gg_unit_o000_0014) then
                call SetUnitInvulnerable(gg_unit_o001_0011, false)
                call SetUnitInvulnerable(gg_unit_o001_0010, false)
            endif
            if not IsUnitAlive(gg_unit_o000_0023) and not IsUnitAlive(gg_unit_o000_0024) and not IsUnitAlive(gg_unit_o000_0025) then
                call SetUnitInvulnerable(gg_unit_o001_0021, false)
                call SetUnitInvulnerable(gg_unit_o001_0022, false)
            endif
        endif
        if GetUnitTypeId(t) == 'o001' or GetUnitTypeId(t) == 'o008' then
            if IsUnitAlly(u, Player(0)) then
                call AdjustPlayerStateBJ( 700, Player(1), PLAYER_STATE_RESOURCE_GOLD )
                call AdjustPlayerStateBJ( 700, Player(2), PLAYER_STATE_RESOURCE_GOLD )
                call AdjustPlayerStateBJ( 700, Player(3), PLAYER_STATE_RESOURCE_GOLD )
                call AdjustPlayerStateBJ( 700, Player(4), PLAYER_STATE_RESOURCE_GOLD )
                call AdjustPlayerStateBJ( 700, Player(5), PLAYER_STATE_RESOURCE_GOLD )
            elseif IsUnitAlly(u, Player(6)) then
                call AdjustPlayerStateBJ( 700, Player(7), PLAYER_STATE_RESOURCE_GOLD )
                call AdjustPlayerStateBJ( 700, Player(8), PLAYER_STATE_RESOURCE_GOLD )
                call AdjustPlayerStateBJ( 700, Player(9), PLAYER_STATE_RESOURCE_GOLD )
                call AdjustPlayerStateBJ( 700, Player(10), PLAYER_STATE_RESOURCE_GOLD )
                call AdjustPlayerStateBJ( 700, Player(11), PLAYER_STATE_RESOURCE_GOLD )
            endif
            if not IsUnitAlive(gg_unit_o001_0011) and not IsUnitAlive(gg_unit_o001_0010) then
                call SetUnitInvulnerable(gg_unit_o003_0009, false)
            endif
            if not IsUnitAlive(gg_unit_o001_0021) and not IsUnitAlive(gg_unit_o001_0022) then
                call SetUnitInvulnerable(gg_unit_o003_0020, false)
            endif
        endif

        set u = null
        set t = null
        set frame1 = null
    endfunction

    private function blockAlly takes nothing returns nothing
        if IsUnitAlly(GetTriggerUnit(), GetOwningPlayer(GetAttacker())) then
            call IssueImmediateOrderById(GetAttacker(), 851972)
        endif
    endfunction

    private function PlayerLeave takes nothing returns nothing
        local integer i
        local integer gold = GetPlayerState(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_LUMBER)
        set playerCount = playerCount - 1
        set MainHero[GetPlayerId(GetTriggerPlayer())] = null
        set IsPlaying[GetPlayerId(GetTriggerPlayer())] = false
        call DisplayTextToForce( bj_FORCE_ALL_PLAYERS, "|cff00ff00" + playerName[GetPlayerId(GetTriggerPlayer())] + "|r" + " has left the game"  )
        if IsUnitAlly(gUnit, Player(0)) then
            set i = 1
            loop
                exitwhen i > 5
                if GetTriggerPlayer() != Player(i) then
                    call AdjustPlayerStateBJ(gold * 100, Player(i), PLAYER_STATE_RESOURCE_GOLD)
                endif
                set i = i + 1
            endloop
        elseif IsUnitAlly(gUnit, Player(6)) then
            set i = 7
            loop
                exitwhen i > 11
                if GetTriggerPlayer() != Player(i) then
                    call AdjustPlayerStateBJ(gold * 100, Player(i), PLAYER_STATE_RESOURCE_GOLD)
                endif
                set i = i + 1
            endloop
        endif
        call GroupEnumUnitsInRect(gGroup, WorldBounds.world, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if GetOwningPlayer(gUnit) == GetTriggerPlayer() then
                call RemoveUnit(gUnit)
            endif
        endloop
        call GroupClear(gGroup)
    endfunction

    private function init takes nothing returns nothing
        local trigger t = CreateTrigger()
        call TriggerRegisterPlayerEventLeave( t, Player(1) )
        call TriggerRegisterPlayerEventLeave( t, Player(2) )
        call TriggerRegisterPlayerEventLeave( t, Player(3) )
        call TriggerRegisterPlayerEventLeave( t, Player(4) )
        call TriggerRegisterPlayerEventLeave( t, Player(5) )
        call TriggerRegisterPlayerEventLeave( t, Player(7) )
        call TriggerRegisterPlayerEventLeave( t, Player(8) )
        call TriggerRegisterPlayerEventLeave( t, Player(9) )
        call TriggerRegisterPlayerEventLeave( t, Player(10) )
        call TriggerRegisterPlayerEventLeave( t, Player(11) )
        call TriggerAddAction(t, function PlayerLeave)
        set t = CreateTrigger()
        call TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_DEATH)
        call TriggerAddAction(t, function pointChecker)
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_ATTACKED, function blockAlly)
        call TimerStart(CreateTimer(), 0, false, function startGame)

        set t = null
    endfunction
endscope