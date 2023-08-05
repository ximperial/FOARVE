scope lvlUP initializer init

    private function action takes nothing returns nothing
        local unit u = GetTriggerUnit()
        local integer lvl = GetHeroLevel(u)
        local integer pid = GetPlayerId(GetOwningPlayer(u))
        local integer abilId

        if IsUnitHero(u) and UserPlayer(GetOwningPlayer(u)) then
            call UnitModifySkillPoints(u, - 999)
        
            set abilId = LoadInteger(ht, StringHash("AbilKey_" + I2S(pid)), 4)
            if lvl >= 23 then
                if GetUnitAbilityLevel(u, abilId) == 0 then
                    call UnitAddAbility(u, abilId)
                endif
            endif
        
            set abilId = LoadInteger(ht, StringHash("AbilKey_" + I2S(pid)), 3)
            if lvl >= 18 then
                if GetUnitAbilityLevel(u, abilId) == 0 then
                    call UnitAddAbility(u, abilId)
                endif
                call SetUnitAbilityLevel(u, abilId, 3)
            
                call MiuRGain(u, abilId)
            elseif lvl >= 13 then
                if GetUnitAbilityLevel(u, abilId) == 0 then
                    call UnitAddAbility(u, abilId)
                endif
                call SetUnitAbilityLevel(u, abilId, 2)
            
                call MiuRGain(u, abilId)
            elseif lvl >= 8 then
                if GetUnitAbilityLevel(u, abilId) == 0 then
                    call UnitAddAbility(u, abilId)
                endif
            
                call MiuRGain(u, abilId)
            endif
        
            set abilId = LoadInteger(ht, StringHash("AbilKey_" + I2S(pid)), 2)
            if lvl >= 15 then
                call SetUnitAbilityLevel(u, abilId, 5)
            
                call HibariEGain(u, abilId, 0.75)
                call MinatoEGain(u, abilId)
                call KirinEGain(u, abilId, 1.5)
            elseif lvl >= 11 then
                call SetUnitAbilityLevel(u, abilId, 4)
            
                call HibariEGain(u, abilId, 0.6)
                call MinatoEGain(u, abilId)
                call KirinEGain(u, abilId, 1.2)
            elseif lvl >= 7 then
                call SetUnitAbilityLevel(u, abilId, 3)
            
                call HibariEGain(u, abilId, 0.45)
                call MinatoEGain(u, abilId)
                call KirinEGain(u, abilId, 0.9)
            elseif lvl >= 4 then
                call SetUnitAbilityLevel(u, abilId, 2)
            
                call HibariEGain(u, abilId, 0.3)
                call MinatoEGain(u, abilId)
                call KirinEGain(u, abilId, 0.6)
            endif
        
            set abilId = LoadInteger(ht, StringHash("AbilKey_" + I2S(pid)), 1)
            if lvl >= 14 then
                call SetUnitAbilityLevel(u, abilId, 5)
            elseif lvl >= 10 then
                call SetUnitAbilityLevel(u, abilId, 4)
            elseif lvl >= 6 then
                call SetUnitAbilityLevel(u, abilId, 3)
            elseif lvl >= 3 then
                call SetUnitAbilityLevel(u, abilId, 2)
            endif
        
            set abilId = LoadInteger(ht, StringHash("AbilKey_" + I2S(pid)), 0)
            if lvl >= 12 then
                call SetUnitAbilityLevel(u, abilId, 5)
            elseif lvl >= 9 then
                call SetUnitAbilityLevel(u, abilId, 4)
            elseif lvl >= 5 then
                call SetUnitAbilityLevel(u, abilId, 3)
            elseif lvl >= 2 then
                call SetUnitAbilityLevel(u, abilId, 2)
            endif
        endif
    
        set u = null
    endfunction

    //===========================================================================
    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_HERO_LEVEL, function action)
    endfunction
endscope