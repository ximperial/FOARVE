//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_WendyE_Actions takes nothing returns nothing
    local unit c = GetTriggerUnit()
    local real value
    if GetSpellAbilityId() == 'A06J' then
        call SoundStart("war3mapImported\\Wendy_3.mp3")
    endif
    set c = null
endfunction

//===========================================================================
function InitTrig_WendyE takes nothing returns nothing
    set gg_trg_WendyE = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_WendyE, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_WendyE, function Trig_WendyE_Actions)
endfunction