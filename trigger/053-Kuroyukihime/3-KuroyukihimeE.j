//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_KuroyukihimeE_Actions takes nothing returns nothing
    if GetSpellAbilityId() == 'A0A5' then
        call SoundStart("war3mapImported\\BlackLotus_3.mp3")
    endif
endfunction

//===========================================================================
function InitTrig_KuroyukihimeE takes nothing returns nothing
    set gg_trg_KuroyukihimeE = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_KuroyukihimeE, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddAction( gg_trg_KuroyukihimeE, function Trig_KuroyukihimeE_Actions )
endfunction