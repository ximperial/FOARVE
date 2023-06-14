//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_ArashE_Actions takes nothing returns nothing
    local unit c = GetTriggerUnit()
    if GetSpellAbilityId() == 'A0H7' then
        call SoundStart("war3mapImported\\Arash_3.mp3")
    endif
    set c = null
endfunction

//===========================================================================
function InitTrig_ArashE takes nothing returns nothing
    set gg_trg_ArashE = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_ArashE, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddAction( gg_trg_ArashE, function Trig_ArashE_Actions )
endfunction