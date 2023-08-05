//TESH.scrollpos=-1
//TESH.alwaysfold=0
function Trig_MinatoQ2_Actions takes nothing returns nothing
    local unit c = GetTriggerUnit()
    if GetSpellAbilityId() == 'A00V' then
        call SaveBoolean(ht, MinatoQ2Hash, GetHandleId(c), true)
    endif
    set c = null
endfunction

//===========================================================================
function InitTrig_MinatoQ2 takes nothing returns nothing
    set gg_trg_MinatoQ2 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_MinatoQ2, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddAction( gg_trg_MinatoQ2, function Trig_MinatoQ2_Actions )
endfunction