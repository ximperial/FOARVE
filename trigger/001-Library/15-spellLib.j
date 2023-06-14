library spellLib uses Utilities

    function HibariEGain takes unit u, integer abilId, real aspd returns nothing
        local real old

        if abilId == 'A04G' then
            set old = LoadReal(ht, StringHash("HibariE"), GetHandleId(u))
            if old != 0 then
                call UnitAddBonus(u, BONUS_ATTACKSPEED, - old)
            endif
            call UnitAddBonus(u, BONUS_ATTACKSPEED, aspd)
            call SaveReal(ht, StringHash("HibariE"), GetHandleId(u), aspd)
        endif
    endfunction
    
    function MinatoEGain takes unit u, integer abilId returns nothing
        local ability a

        if abilId == 'A00Y' then
            if GetUnitAbilityLevel(u, 'A0GU') == 0 then
                call UnitAddAbility(u, 'A0GU')
                call UnitMakeAbilityPermanent(u, true, 'A0GU')
                set a = GetUnitAbility(u, 'A0GU')
                call DisableAbility(a, true, true)
            endif
            call SetUnitAbilityLevel(u, 'A0GU', GetUnitAbilityLevel(u, abilId))
        endif
        
        set a = null
    endfunction
    
    function KirinEGain takes unit u, integer abilId, real aspd returns nothing
        local real old

        if abilId == 'A0HO' then
            set old = LoadReal(ht, StringHash("KirinE"), GetHandleId(u))
            if old != 0 then
                call UnitAddBonus(u, BONUS_ATTACKSPEED, - old)
            endif
            call UnitAddBonus(u, BONUS_ATTACKSPEED, aspd)
            call SaveReal(ht, StringHash("KirinE"), GetHandleId(u), aspd)
        endif
    endfunction
    
    function MiuRGain takes unit u, integer abilId returns nothing
        local ability a

        if abilId == 'A0GN' then
            if GetUnitAbilityLevel(u, 'A0I2') == 0 then
                call UnitAddAbility(u, 'A0I2')
                call UnitMakeAbilityPermanent(u, true, 'A0I2')
                set a = GetUnitAbility(u, 'A0I2')
                call DisableAbility(a, true, true)
            endif
            call SetUnitAbilityLevel(u, 'A0I2', GetUnitAbilityLevel(u, abilId))
        endif

        set a = null
    endfunction
endlibrary