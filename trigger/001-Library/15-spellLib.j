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
endlibrary