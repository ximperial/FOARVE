scope spellLib

    function izayoiW2 takes unit u returns nothing
        if GetUnitAbilityLevel(u, 'A01B') > 0 then
            if GetUnitAbilityLevel(u, 'A051') == 0 then
                call UnitAddAbility(u, 'A051')
                call UnitMakeAbilityPermanent(u, true, 'A051')
                call DisableAbilityEx(u, 'A051', true)
            else
                call SetUnitAbilityLevel(u, 'A051', GetUnitAbilityLevel(u, 'A01B'))
            endif
        endif
    endfunction
endscope