library finishselect uses gpm creepLib
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
        if seconds >= 60 then
            set seconds = 0
            set minutes = minutes + 1
            set i = 0
            loop
                exitwhen i > 11
                if UserPlayer(Player(i)) then
                    call SetPlayerStateBJ(Player(i), PLAYER_STATE_RESOURCE_FOOD_USED, seconds)
                    call SetPlayerStateBJ(Player(i), PLAYER_STATE_RESOURCE_LUMBER, minutes)
                endif
                set i = i + 1
            endloop
        endif
        if minutes == 5 and seconds == 0 then
            call SetUnitBaseWeaponIntegerFieldById('ndqn', UNIT_WEAPON_IF_ATTACK_DAMAGE_BASE, 0, GetUnitBaseWeaponIntegerFieldById('ndqn', UNIT_WEAPON_IF_ATTACK_DAMAGE_BASE, 0) + 15)
            call SetUnitBaseRealFieldById('ndqn', UNIT_RF_HP, GetUnitBaseRealFieldById('ndqn', UNIT_RF_HP) + 150)
            
            call SetUnitBaseWeaponIntegerFieldById('e002', UNIT_WEAPON_IF_ATTACK_DAMAGE_BASE, 0, GetUnitBaseWeaponIntegerFieldById('e002', UNIT_WEAPON_IF_ATTACK_DAMAGE_BASE, 0) + 7)
            call SetUnitBaseWeaponIntegerFieldById('e003', UNIT_WEAPON_IF_ATTACK_DAMAGE_BASE, 0, GetUnitBaseWeaponIntegerFieldById('e003', UNIT_WEAPON_IF_ATTACK_DAMAGE_BASE, 0) + 7)
            call SetUnitBaseWeaponIntegerFieldById('e004', UNIT_WEAPON_IF_ATTACK_DAMAGE_BASE, 0, GetUnitBaseWeaponIntegerFieldById('e004', UNIT_WEAPON_IF_ATTACK_DAMAGE_BASE, 0) + 7)
            call SetUnitBaseRealFieldById('e002', UNIT_RF_HP, GetUnitBaseRealFieldById('e002', UNIT_RF_HP) + 55)
            call SetUnitBaseRealFieldById('e003', UNIT_RF_HP, GetUnitBaseRealFieldById('e003', UNIT_RF_HP) + 55)
            call SetUnitBaseRealFieldById('e004', UNIT_RF_HP, GetUnitBaseRealFieldById('e004', UNIT_RF_HP) + 55)
        endif
        if minutes == 15 and seconds == 0 then
            call SetUnitBaseWeaponIntegerFieldById('ndqn', UNIT_WEAPON_IF_ATTACK_DAMAGE_BASE, 0, GetUnitBaseWeaponIntegerFieldById('ndqn', UNIT_WEAPON_IF_ATTACK_DAMAGE_BASE, 0) + 20)
            call SetUnitBaseRealFieldById('ndqn', UNIT_RF_HP, GetUnitBaseRealFieldById('ndqn', UNIT_RF_HP) + 200)
            
            call SetUnitBaseWeaponIntegerFieldById('e002', UNIT_WEAPON_IF_ATTACK_DAMAGE_BASE, 0, GetUnitBaseWeaponIntegerFieldById('e002', UNIT_WEAPON_IF_ATTACK_DAMAGE_BASE, 0) + 12)
            call SetUnitBaseWeaponIntegerFieldById('e003', UNIT_WEAPON_IF_ATTACK_DAMAGE_BASE, 0, GetUnitBaseWeaponIntegerFieldById('e003', UNIT_WEAPON_IF_ATTACK_DAMAGE_BASE, 0) + 12)
            call SetUnitBaseWeaponIntegerFieldById('e004', UNIT_WEAPON_IF_ATTACK_DAMAGE_BASE, 0, GetUnitBaseWeaponIntegerFieldById('e004', UNIT_WEAPON_IF_ATTACK_DAMAGE_BASE, 0) + 12)
            call SetUnitBaseRealFieldById('e002', UNIT_RF_HP, GetUnitBaseRealFieldById('e002', UNIT_RF_HP) + 120)
            call SetUnitBaseRealFieldById('e003', UNIT_RF_HP, GetUnitBaseRealFieldById('e003', UNIT_RF_HP) + 120)
            call SetUnitBaseRealFieldById('e004', UNIT_RF_HP, GetUnitBaseRealFieldById('e004', UNIT_RF_HP) + 120)
        endif
        if minutes == 25 and seconds == 0 then
            call SetUnitBaseWeaponIntegerFieldById('ndqn', UNIT_WEAPON_IF_ATTACK_DAMAGE_BASE, 0, GetUnitBaseWeaponIntegerFieldById('ndqn', UNIT_WEAPON_IF_ATTACK_DAMAGE_BASE, 0) + 30)
            call SetUnitBaseRealFieldById('ndqn', UNIT_RF_HP, GetUnitBaseRealFieldById('ndqn', UNIT_RF_HP) + 350)
            
            call SetUnitBaseWeaponIntegerFieldById('e002', UNIT_WEAPON_IF_ATTACK_DAMAGE_BASE, 0, GetUnitBaseWeaponIntegerFieldById('e002', UNIT_WEAPON_IF_ATTACK_DAMAGE_BASE, 0) + 18)
            call SetUnitBaseWeaponIntegerFieldById('e003', UNIT_WEAPON_IF_ATTACK_DAMAGE_BASE, 0, GetUnitBaseWeaponIntegerFieldById('e003', UNIT_WEAPON_IF_ATTACK_DAMAGE_BASE, 0) + 18)
            call SetUnitBaseWeaponIntegerFieldById('e004', UNIT_WEAPON_IF_ATTACK_DAMAGE_BASE, 0, GetUnitBaseWeaponIntegerFieldById('e004', UNIT_WEAPON_IF_ATTACK_DAMAGE_BASE, 0) + 18)
            call SetUnitBaseRealFieldById('e002', UNIT_RF_HP, GetUnitBaseRealFieldById('e002', UNIT_RF_HP) + 170)
            call SetUnitBaseRealFieldById('e003', UNIT_RF_HP, GetUnitBaseRealFieldById('e003', UNIT_RF_HP) + 170)
            call SetUnitBaseRealFieldById('e004', UNIT_RF_HP, GetUnitBaseRealFieldById('e004', UNIT_RF_HP) + 170)
        endif
        if minutes == 35 and seconds == 0 then
            call SetUnitBaseWeaponIntegerFieldById('ndqn', UNIT_WEAPON_IF_ATTACK_DAMAGE_BASE, 0, GetUnitBaseWeaponIntegerFieldById('ndqn', UNIT_WEAPON_IF_ATTACK_DAMAGE_BASE, 0) + 40)
            call SetUnitBaseRealFieldById('ndqn', UNIT_RF_HP, GetUnitBaseRealFieldById('ndqn', UNIT_RF_HP) + 450)
            
            call SetUnitBaseWeaponIntegerFieldById('e002', UNIT_WEAPON_IF_ATTACK_DAMAGE_BASE, 0, GetUnitBaseWeaponIntegerFieldById('e002', UNIT_WEAPON_IF_ATTACK_DAMAGE_BASE, 0) + 25)
            call SetUnitBaseWeaponIntegerFieldById('e003', UNIT_WEAPON_IF_ATTACK_DAMAGE_BASE, 0, GetUnitBaseWeaponIntegerFieldById('e003', UNIT_WEAPON_IF_ATTACK_DAMAGE_BASE, 0) + 25)
            call SetUnitBaseWeaponIntegerFieldById('e004', UNIT_WEAPON_IF_ATTACK_DAMAGE_BASE, 0, GetUnitBaseWeaponIntegerFieldById('e004', UNIT_WEAPON_IF_ATTACK_DAMAGE_BASE, 0) + 25)
            call SetUnitBaseRealFieldById('e002', UNIT_RF_HP, GetUnitBaseRealFieldById('e002', UNIT_RF_HP) + 220)
            call SetUnitBaseRealFieldById('e003', UNIT_RF_HP, GetUnitBaseRealFieldById('e003', UNIT_RF_HP) + 220)
            call SetUnitBaseRealFieldById('e004', UNIT_RF_HP, GetUnitBaseRealFieldById('e004', UNIT_RF_HP) + 220)
        endif
    endfunction

    private function runTimeCheck takes nothing returns nothing
        call TimerStart(CreateTimer(), 1, true, function timeCheckPeriod)
    endfunction

    function clearSelectData takes nothing returns nothing
        call ClearTextMessagesBJ(bj_FORCE_ALL_PLAYERS)
        call CreateTextTagLocBJ( "0", GetRectCenter(gg_rct_MidTeam1), 0, 14.00, 100, 85.00, 0.00, 0 )
        set creepText[0] = bj_lastCreatedTextTag
        call CreateTextTagLocBJ( "0", GetRectCenter(gg_rct_BottomTeam1), 0, 14.00, 100, 85.00, 0.00, 0 )
        set creepText[1] = bj_lastCreatedTextTag
        call CreateTextTagLocBJ( "0", GetRectCenter(gg_rct_TopTeam1), 0, 14.00, 100, 85.00, 0.00, 0 )
        set creepText[2] = bj_lastCreatedTextTag
        call CreateTextTagLocBJ( "0", GetRectCenter(gg_rct_MidTeam2), 0, 14.00, 100, 85.00, 0.00, 0 )
        set creepText[3] = bj_lastCreatedTextTag
        call CreateTextTagLocBJ( "0", GetRectCenter(gg_rct_BottomTeam2), 0, 14.00, 100, 85.00, 0.00, 0 )
        set creepText[4] = bj_lastCreatedTextTag
        call CreateTextTagLocBJ( "0", GetRectCenter(gg_rct_TopTeam2), 0, 14.00, 100, 85.00, 0.00, 0 )
        set creepText[5] = bj_lastCreatedTextTag
        call AttackWave()
        call RunGPM()
        call runTimeCheck()
    endfunction
endlibrary