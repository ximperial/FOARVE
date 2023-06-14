//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_HibariD_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real a = GetUnitFacing(c)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    if count == 1 then
        call SoundStart("war3mapImported\\Hibari_7.mp3")
        call ShowUnitAbility(c, 'A04P', false)
        call UnitAddAbility(c, 'A03Y')
        call UnitMakeAbilityPermanent(c, true, 'A03Y')
    endif
    if GetUnitAbilityLevel(c, 'B00R') == 0 or not IsUnitAlive(c) then
        call ShowUnitAbility(c, 'A04P', true)
        call UnitRemoveAbility(c, 'A03Y')
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
endfunction

function Trig_HibariD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    if GetSpellAbilityId() == 'A04P' then 
        set z = CreateTimer()
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_HibariD_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_HibariD takes nothing returns nothing
    set gg_trg_HibariD = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_HibariD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_HibariD, function Trig_HibariD_Actions )
endfunction