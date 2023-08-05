//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_NanayaE_Actions takes nothing returns nothing
    if GetSpellAbilityId() == 'A06U' then
        call SoundStart("war3mapImported\\Nanaya_3.mp3")
    endif
endfunction

//===========================================================================
function InitTrig_NanayaE takes nothing returns nothing
    set gg_trg_NanayaE = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_NanayaE, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddAction( gg_trg_NanayaE, function Trig_NanayaE_Actions )
endfunction