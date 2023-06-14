//TESH.scrollpos=-1
//TESH.alwaysfold=0
function Trig_GajelT_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x
    local real y
    local real pitch
    local real a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local real dist = Distance(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local integer i = 0
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Gajel_5.mp3")
        call UnitAddAbility(t, 'Amrf')
        call UnitRemoveAbility(t, 'Amrf')
        call SetUnitFlyHeight(t, 200, 500)
        call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        call SetUnitAnimation(c, "attack")
        call Effect("war3mapImported\\Gravitone.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 10, 4, 255, 255, 255, 255)
    endif
    if count == 10 then
        call SetUnitAnimation(c, "stand ready") 
    endif
    if count == 90 then
        call SetUnitAnimation(c, "spell one")
        set x = PolarX(GetUnitX(t), - 30, a)
        set y = PolarY(GetUnitY(t), - 30, a)
        set pitch = Slope(GetUnitX(c), GetUnitY(c), 0, x, y, GetUnitFlyHeight(t) - 30)
        call Effect("war3mapImported\\SolarBall.mdl", x, y, GetUnitFlyHeight(t) - 30, a, 0, 0, 1 + (count - 90) * 0.07, 1, 200, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2)
        call Effect("war3mapImported\\Bankai.mdl", x, y, GetUnitFlyHeight(t) - 30, a, pitch, 0, 0.05 + (count - 90) * 0.0017, 1, 0, 0, 0, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
    endif
    if count >= 90 and count <= 140 then
        set x = PolarX(GetUnitX(t), 10, a)
        set y = PolarY(GetUnitY(t), 10, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
        call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 20, 0)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 3 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            set x = PolarX(GetUnitX(t), - 30, a)
            set y = PolarY(GetUnitY(t), - 30, a)
            set pitch = Slope(GetUnitX(c), GetUnitY(c), 0, x, y, GetUnitFlyHeight(t) - 30)
            call Effect("war3mapImported\\SolarBall.mdl", x, y, GetUnitFlyHeight(t) - 30, a, 0, 0, 1 + (count - 90) * 0.08, 1, 200, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2)
            call Effect("war3mapImported\\Bankai.mdl", x, y, GetUnitFlyHeight(t) - 30, a, pitch, 0, 0.05 + (count - 90) * 0.0018, 1, 0, 0, 0, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
    endif
    if count == 140 then 
        call SetUnitFlyHeight(t, 0, 0)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 15 * GetHeroStr(c, true))
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(t), GetUnitY(t))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
endfunction

function Trig_GajelT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A09W' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_GajelT_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_GajelT takes nothing returns nothing
    set gg_trg_GajelT = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_GajelT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_GajelT, function Trig_GajelT_Actions )
endfunction