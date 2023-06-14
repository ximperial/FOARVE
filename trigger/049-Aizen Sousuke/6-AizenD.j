//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_AizenD_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local string s = ""
    local integer uid
    if not IsUnitInvulnerable(t) then 
        set count = count + 1
        call SaveInteger(ht, GetHandleId(z), 0, count)
    endif
    if count >= 50 or not IsUnitAlive(t) or GetUnitAbilityLevel(t, 'B016') == 0 then 
        call UnitRemoveAbility(t, 'A07Q')
        call UnitRemoveAbility(t, 'B016')
        call FlushChildHashtable(ht, GetHandleId(z)) 
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
endfunction

function Trig_AizenD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    local string s = ""
    local integer uid
    if GetSpellAbilityId() == 'A00U' then
        set z = CreateTimer()
        call SoundStart("war3mapImported\\Aizen_7.mp3")
        call UnitAddAbility(t, 'A07Q')
        call UnitMakeAbilityPermanent(t, true, 'A07Q')
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveUnitHandle(ht, StringHash("AizenD"), GetHandleId(t), c)
        call TimerStart(z, 0.1, true, function Trig_AizenD_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_AizenD takes nothing returns nothing
    set gg_trg_AizenD = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_AizenD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_AizenD, function Trig_AizenD_Actions )
endfunction