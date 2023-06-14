library finishselect uses tournament gpm lockmap creepLib
    globals
        integer seconds = 0
        integer minutes = 0
    endglobals

    private function timeCheckPeriod takes nothing returns nothing
        local integer i = 0
        
        set seconds = seconds + 1
        loop
            exitwhen i > 11
            if UserPlayer(Player(i)) then
                call SetPlayerStateBJ(Player(i), PLAYER_STATE_RESOURCE_FOOD_USED, seconds)
            endif
            set i = i + 1
        endloop
        if minutes == 0 and seconds == 30 then
            call runTournament()
        endif
        if seconds >= 60 then
            set seconds = 0
            set minutes = minutes + 1
            set i = 0
            loop
                exitwhen i > 11
                if UserPlayer(Player(i)) then
                    call SetPlayerStateBJ(Player(i), PLAYER_STATE_RESOURCE_LUMBER, minutes)
                endif
                set i = i + 1
            endloop
        endif
    endfunction

    private function runTimeCheck takes nothing returns nothing
        call TimerStart(CreateTimer(), 1, true, function timeCheckPeriod)
    endfunction

    function clearSelectData takes nothing returns nothing
        call ClearTextMessagesBJ(bj_FORCE_ALL_PLAYERS)
        call CreateTextTagLocBJ( "0", GetRectCenter(gg_rct_MidCTeam1), 0, 14.00, 100, 85.00, 0.00, 0 )
        set creepText[0] = bj_lastCreatedTextTag
        call CreateTextTagLocBJ( "0", GetRectCenter(gg_rct_BottomCTeam1), 0, 14.00, 100, 85.00, 0.00, 0 )
        set creepText[1] = bj_lastCreatedTextTag
        call CreateTextTagLocBJ( "0", GetRectCenter(gg_rct_TopCTeam1), 0, 14.00, 100, 85.00, 0.00, 0 )
        set creepText[2] = bj_lastCreatedTextTag
        call CreateTextTagLocBJ( "0", GetRectCenter(gg_rct_MidCTeam2), 0, 14.00, 100, 85.00, 0.00, 0 )
        set creepText[3] = bj_lastCreatedTextTag
        call CreateTextTagLocBJ( "0", GetRectCenter(gg_rct_BottomCTeam2), 0, 14.00, 100, 85.00, 0.00, 0 )
        set creepText[4] = bj_lastCreatedTextTag
        call CreateTextTagLocBJ( "0", GetRectCenter(gg_rct_TopCTeam2), 0, 14.00, 100, 85.00, 0.00, 0 )
        set creepText[5] = bj_lastCreatedTextTag
        call CreateTextTagLocBJ( "0", GetRectCenter(gg_rct_MidCTeam3), 0, 14.00, 100, 85.00, 0.00, 0 )
        set creepText[6] = bj_lastCreatedTextTag
        call CreateTextTagLocBJ( "0", GetRectCenter(gg_rct_LeftCTeam3), 0, 14.00, 100, 85.00, 0.00, 0 )
        set creepText[7] = bj_lastCreatedTextTag
        call CreateTextTagLocBJ( "0", GetRectCenter(gg_rct_RightCTeam3), 0, 14.00, 100, 85.00, 0.00, 0 )
        set creepText[8] = bj_lastCreatedTextTag
        call AttackWave()
        call RunGPM()
        call runTimeCheck()
        if playerCount > 1 then
            call runLockMap()
        endif
    endfunction
endlibrary