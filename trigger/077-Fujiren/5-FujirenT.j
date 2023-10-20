//TESH.scrollpos=3
//TESH.alwaysfold=0
function Trig_FujirenT_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local real dist = Distance(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local real dist2
    local real x0 = LoadReal(ht, GetHandleId(z), 0)
    local real y0 = LoadReal(ht, GetHandleId(z), 1)
    local real x
    local real y
    local real z1
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Fujiren_5.mp3")
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call SetUnitAnimationByIndex(c, 8)
        call SetUnitTimeScale(c, 1.5)
        call SaveUnitHandle(ht, GetHandleId(z), 2, CreateUnit(Player(12), 'H00D', GetUnitX(c), GetUnitY(c), 0)) 
        call SetUnitX(c, PolarX(GetUnitX(t), - 1000, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 1000, a))
        call SaveReal(ht, GetHandleId(z), 0, GetUnitX(c))
        call SaveReal(ht, GetHandleId(z), 1, GetUnitY(c))
        set x0 = GetUnitX(c)
        set y0 = GetUnitY(c)
        call SetUnitPathing(c, false)
    endif
    if count <= 40 then
        set dist2 = Distance(x0, y0, GetUnitX(c), GetUnitY(c))
        set z1 = GetParabolaZEx(dist2, 1000, 400, 0, 50) 
        call SetUnitX(c, PolarX(GetUnitX(c), 25, a))
        call SetUnitY(c, PolarY(GetUnitY(c), 25, a))
        call SetUnitFlyHeight(c, z1, 0)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 4 then 
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_2.mdl", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(c) + 20, a, 0, 0, GetRandomReal(1, 1.4), 1, 255, 0, 0, PercentTo255(90))
        endif
    endif
    if count == 40 then
        call SoundStart("war3mapImported\\Fujiren_5-1.mp3")
        call Effect("war3mapImported\\AZ_WSY_Misslie.mdl", GetUnitX(t), GetUnitY(t), 100, a + 40, 0, 0, 1, 2, 255, 10, 10, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25) 
    endif
    if count == 50 then
        call SetUnitFlyHeight(c, 0, 0)
        call SetUnitPathing(c, true)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 15 * GetHeroAgi(c, true))
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(t), GetUnitY(t))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call RemoveUnit(LoadUnitHandle(ht, GetHandleId(z), 2))
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
endfunction

function Trig_FujirenT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0FZ' then
        set z = CreateTimer()
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_FujirenT_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction
    
//===========================================================================
function InitTrig_FujirenT takes nothing returns nothing
    set gg_trg_FujirenT = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_FujirenT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_FujirenT, function Trig_FujirenT_Actions )
endfunction