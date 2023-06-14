//TESH.scrollpos=-1
//TESH.alwaysfold=0
function Trig_GajelE_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local real value = LoadReal(ht, GetHandleId(z), 0)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    if count == 1 then
        call SoundStart("war3mapImported\\Gajel_3.mp3")
        call UnitAddBonus(c, BONUS_MOVESPEED, value)
    endif
    if GetUnitAbilityLevel(c, 'B00Z') == 0 or IsUnitAlive(c) then
        call UnitAddBonus(c, BONUS_MOVESPEED, - value)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
endfunction

function Trig_GajelE_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    if GetSpellAbilityId() == 'A09R' then
        set z = CreateTimer()
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveReal(ht, GetHandleId(z), 0, 0.03 * GetUnitAbilityLevel(c, 'A09R'))
        call TimerStart(z, 0.02, true, function Trig_GajelE_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_GajelE takes nothing returns nothing
    set gg_trg_GajelE = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_GajelE, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddAction( gg_trg_GajelE, function Trig_GajelE_Actions )
endfunction