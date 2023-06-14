//TESH.scrollpos=10
//TESH.alwaysfold=0
function Trig_TomaE_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit t = LoadUnitHandle(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    if not IsUnitInvulnerable(t) then 
        set count = count + 1
        call SaveInteger(ht, GetHandleId(z), 0, count)
    endif
    if count >= 50 or not IsUnitAlive(t) or GetUnitAbilityLevel(t, 'B014') == 0 then 
        call UnitRemoveAbility(t, 'A092')
        call UnitRemoveAbility(t, 'B014')
        call FlushChildHashtable(ht, GetHandleId(z)) 
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set t = null
endfunction

function Trig_TomaE_Actions takes nothing returns nothing
    local timer z
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A091' then
        set z = CreateTimer()
        call UnitAddAbility(t, 'A092')
        call UnitMakeAbilityPermanent(t, true, 'A092')
        call SaveUnitHandle(ht, GetHandleId(z), 0, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call TimerStart(z, 0.1, true, function Trig_TomaE_Func001)
    endif
    set z = null
    set t = null
endfunction

//===========================================================================
function InitTrig_TomaE takes nothing returns nothing
    set gg_trg_TomaE = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_TomaE, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_TomaE, function Trig_TomaE_Actions )
endfunction