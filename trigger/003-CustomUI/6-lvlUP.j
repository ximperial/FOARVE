scope lvlUP initializer init

    private function action takes nothing returns nothing
        local unit u = GetTriggerUnit()
        local integer lvl = GetHeroLevel(u)
        local integer pid = GetPlayerId(GetOwningPlayer(u))
        local integer abilId

        if IsUnitHero(u) and UserPlayer(GetOwningPlayer(u)) then
            call UnitModifySkillPoints(u, - GetHeroSkillPoints(u))
        
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
                    if abilId == 'A0JM' then
                        call DisableAbilityEx(u, abilId, false)
                    endif
                    if abilId == 'A0GN' then
                        call UnitAddAbility(u, 'A0I2')
                        call UnitMakeAbilityPermanent(u, true, 'A0I2')
                        call DisableAbilityEx(u, 'A0I2', true)
                    endif
                endif
                if GetUnitAbilityLevel(u, abilId) != 3 then
                    call SetUnitAbilityLevel(u, abilId, 3)
                    if abilId == 'A0GN' then
                        call SetUnitAbilityLevel(u, 'A0I2', 3)
                    endif
                endif
            elseif lvl >= 13 then
                if GetUnitAbilityLevel(u, abilId) == 0 then
                    call UnitAddAbility(u, abilId)
                    if abilId == 'A0JM' then
                        call DisableAbilityEx(u, abilId, false)
                    endif
                    if abilId == 'A0GN' then
                        call UnitAddAbility(u, 'A0I2')
                        call UnitMakeAbilityPermanent(u, true, 'A0I2')
                        call DisableAbilityEx(u, 'A0I2', true)
                    endif
                endif
                if GetUnitAbilityLevel(u, abilId) != 2 then
                    call SetUnitAbilityLevel(u, abilId, 2)
                    if abilId == 'A0GN' then
                        call SetUnitAbilityLevel(u, 'A0I2', 2)
                    endif
                endif
            elseif lvl >= 8 then
                if GetUnitAbilityLevel(u, abilId) == 0 then
                    call UnitAddAbility(u, abilId)
                    if abilId == 'A0JM' then
                        call DisableAbilityEx(u, abilId, false)
                    endif
                    if abilId == 'A0GN' then
                        call UnitAddAbility(u, 'A0I2')
                        call UnitMakeAbilityPermanent(u, true, 'A0I2')
                        call DisableAbilityEx(u, 'A0I2', true)
                    endif
                endif
            endif
        
            set abilId = LoadInteger(ht, StringHash("AbilKey_" + I2S(pid)), 2)
            if lvl >= 15 then
                if GetUnitAbilityLevel(u, abilId) != 5 then
                    call SetUnitAbilityLevel(u, abilId, 5)
                    call HibariEGain(u, abilId, 0.75)
                    call KirinEGain(u, abilId, 1.5)
                endif
            elseif lvl >= 11 then
                if GetUnitAbilityLevel(u, abilId) != 4 then
                    call SetUnitAbilityLevel(u, abilId, 4)
                    call HibariEGain(u, abilId, 0.6)
                    call KirinEGain(u, abilId, 1.2)
                endif
            elseif lvl >= 7 then
                if GetUnitAbilityLevel(u, abilId) != 3 then
                    call SetUnitAbilityLevel(u, abilId, 3)
                    call HibariEGain(u, abilId, 0.45)
                    call KirinEGain(u, abilId, 0.9)
                endif
            elseif lvl >= 4 then
                if GetUnitAbilityLevel(u, abilId) != 2 then
                    call SetUnitAbilityLevel(u, abilId, 2)
                    call HibariEGain(u, abilId, 0.3)
                    call KirinEGain(u, abilId, 0.6)
                endif
            endif
        
            set abilId = LoadInteger(ht, StringHash("AbilKey_" + I2S(pid)), 1)
            if lvl >= 14 then
                if GetUnitAbilityLevel(u, abilId) != 5 then
                    call SetUnitAbilityLevel(u, abilId, 5)
                endif
            elseif lvl >= 10 then
                if GetUnitAbilityLevel(u, abilId) != 4 then
                    call SetUnitAbilityLevel(u, abilId, 4)
                endif
            elseif lvl >= 6 then
                if GetUnitAbilityLevel(u, abilId) != 3 then
                    call SetUnitAbilityLevel(u, abilId, 3)
                endif
            elseif lvl >= 3 then
                if GetUnitAbilityLevel(u, abilId) != 2 then
                    call SetUnitAbilityLevel(u, abilId, 2)
                endif
            endif
        
            set abilId = LoadInteger(ht, StringHash("AbilKey_" + I2S(pid)), 0)
            if lvl >= 12 then
                if GetUnitAbilityLevel(u, abilId) != 5 then
                    call SetUnitAbilityLevel(u, abilId, 5)
                endif
            elseif lvl >= 9 then
                if GetUnitAbilityLevel(u, abilId) != 4 then
                    call SetUnitAbilityLevel(u, abilId, 4)
                endif
            elseif lvl >= 5 then
                if GetUnitAbilityLevel(u, abilId) != 3 then
                    call SetUnitAbilityLevel(u, abilId, 3)
                endif
            elseif lvl >= 2 then
                if GetUnitAbilityLevel(u, abilId) != 2 then
                    call SetUnitAbilityLevel(u, abilId, 2)
                endif
            endif
        endif
    
        set u = null
    endfunction

    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_HERO_LEVEL, function action)
    endfunction
endscope