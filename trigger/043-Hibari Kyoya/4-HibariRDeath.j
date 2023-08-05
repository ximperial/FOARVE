//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_HibariRDeath_Actions takes nothing returns nothing
    local unit c = GetKillingUnit()
    local unit t = GetTriggerUnit()
    if HaveSavedBoolean(ht, HibariRHash, GetHandleId(t)) then
        if GetUnitAbilityLevel(c, 'A04E') > 0 then
            call UnitAddStat(c, 0, 0, 1 + GetUnitAbilityLevel(c, 'A04E'))
        endif
        call RemoveSavedBoolean(ht, HibariRHash, GetHandleId(t))
    endif
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_HibariRDeath takes nothing returns nothing
    set gg_trg_HibariRDeath = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_HibariRDeath, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddAction( gg_trg_HibariRDeath, function Trig_HibariRDeath_Actions )
endfunction