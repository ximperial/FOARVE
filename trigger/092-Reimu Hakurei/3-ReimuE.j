//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_ReimuE_Actions takes nothing returns nothing
    if GetSpellAbilityId() == 'A08G' then
        call SoundStart("war3mapImported\\Reimu_3.mp3")
    endif
endfunction

//===========================================================================
function InitTrig_ReimuE takes nothing returns nothing
    set gg_trg_ReimuE = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_ReimuE, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddAction( gg_trg_ReimuE, function Trig_ReimuE_Actions )
endfunction