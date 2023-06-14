//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_RyougiE_Actions takes nothing returns nothing
    if GetSpellAbilityId() == 'A00B' then
        call SoundStart("war3mapImported\\Ryougi_3.mp3")
    endif
endfunction

//===========================================================================
function InitTrig_RyougiE takes nothing returns nothing
    set gg_trg_RyougiE = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_RyougiE, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddAction( gg_trg_RyougiE, function Trig_RyougiE_Actions )
endfunction