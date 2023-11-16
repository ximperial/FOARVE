scope lvlUP initializer init

    private function action takes nothing returns nothing
        local unit u = GetTriggerUnit()
        local integer lvl = GetHeroLevel(u)
        local integer pid = GetPlayerId(GetOwningPlayer(u))
        local integer aid

        if IsUnitHero(u) and UserPlayer(GetOwningPlayer(u)) then
            call UnitModifySkillPoints(u, - GetHeroSkillPoints(u))

            set aid = LoadInteger(ht, StringHash("AbilKey_" + I2S(pid)) , 6)
            if lvl >= 28 and not IsAbilityVisible(GetUnitAbility(u, aid)) then
                call EnableAbilityEx(u, aid, true)
            endif

            set aid = LoadInteger(ht, StringHash("AbilKey_" + I2S(pid)) , 5)
            if lvl >= 25 and not IsAbilityVisible(GetUnitAbility(u, aid)) then
                call EnableAbilityEx(u, aid, true)
            endif
        
            set aid = LoadInteger(ht, StringHash("AbilKey_" + I2S(pid)) , 4)
            if lvl >= 23 and GetUnitAbilityLevel(u, aid) < 1 then
                call UnitAddAbility(u, aid)
            endif
        
            set aid = LoadInteger(ht, StringHash("AbilKey_" + I2S(pid)) , 3)
            if lvl >= 8 and GetUnitAbilityLevel(u, aid) < 1 then
                call UnitAddAbility(u, aid)
            endif
            if lvl >= 13 and GetUnitAbilityLevel(u, aid) < 2 then
                call SetUnitAbilityLevel(u, aid, 2)
            endif
            if lvl >= 18 and GetUnitAbilityLevel(u, aid) < 3 then
                call SetUnitAbilityLevel(u, aid, 3)
            endif
        
            set aid = LoadInteger(ht, StringHash("AbilKey_" + I2S(pid)) , 2)
            if lvl >= 4 and GetUnitAbilityLevel(u, aid) < 2 then
                call SetUnitAbilityLevel(u, aid, 2)
            endif
            if lvl >= 7 and GetUnitAbilityLevel(u, aid) < 3 then
                call SetUnitAbilityLevel(u, aid, 3)
            endif
            if lvl >= 11 and GetUnitAbilityLevel(u, aid) < 4 then
                call SetUnitAbilityLevel(u, aid, 4)
            endif
            if lvl >= 15 and GetUnitAbilityLevel(u, aid) < 5 then
                call SetUnitAbilityLevel(u, aid, 5)
            endif
        
            set aid = LoadInteger(ht, StringHash("AbilKey_" + I2S(pid)) , 1)
            if lvl >= 3 and GetUnitAbilityLevel(u, aid) < 2 then
                call SetUnitAbilityLevel(u, aid, 2)
            endif
            if lvl >= 6 and GetUnitAbilityLevel(u, aid) < 3 then
                call SetUnitAbilityLevel(u, aid, 3)
            endif
            if lvl >= 10 and GetUnitAbilityLevel(u, aid) < 4 then
                call SetUnitAbilityLevel(u, aid, 4)
            endif
            if lvl >= 14 and GetUnitAbilityLevel(u, aid) < 5 then
                call SetUnitAbilityLevel(u, aid, 5)
            endif
        
            set aid = LoadInteger(ht, StringHash("AbilKey_" + I2S(pid)) , 0)
            if lvl >= 2 and GetUnitAbilityLevel(u, aid) < 2 then
                call SetUnitAbilityLevel(u, aid, 2)
            endif
            if lvl >= 5 and GetUnitAbilityLevel(u, aid) < 3 then
                call SetUnitAbilityLevel(u, aid, 3)
            endif
            if lvl >= 9 and GetUnitAbilityLevel(u, aid) < 4 then
                call SetUnitAbilityLevel(u, aid, 4)
            endif
            if lvl >= 12 and GetUnitAbilityLevel(u, aid) < 5 then
                call SetUnitAbilityLevel(u, aid, 5)
            endif

            call izayoiW2(u)
        endif
    
        set u = null
    endfunction

    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_HERO_LEVEL, function action)
    endfunction
endscope