//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_KiritoE_Actions takes nothing returns nothing
    local unit c = GetTriggerUnit()
    if GetSpellAbilityId() == 'A00M' then
        call SoundStart("war3mapImported\\Kirito_7.mp3")
    endif
    set c=null
endfunction

//===========================================================================
function InitTrig_KiritoE takes nothing returns nothing
    set gg_trg_KiritoE = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_KiritoE, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddAction( gg_trg_KiritoE, function Trig_KiritoE_Actions )
endfunction

