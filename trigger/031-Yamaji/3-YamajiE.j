//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_YamajiE_Actions takes nothing returns nothing
    if GetSpellAbilityId() == 'A0BC' then
        call SoundStart("war3mapImported\\Yamaji_3.mp3")
    endif
endfunction

//===========================================================================
function InitTrig_YamajiE takes nothing returns nothing
    set gg_trg_YamajiE = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_YamajiE, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddAction( gg_trg_YamajiE, function Trig_YamajiE_Actions)
endfunction

