//TESH.scrollpos=99
//TESH.alwaysfold=0
function Trig_EscaT_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x
    local real y
    local real z1
    local real a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local real dist = Distance(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local integer i = 0
    local effect e = LoadEffectHandle(ht, GetHandleId(z), 2)
    local effect e2 = LoadEffectHandle(ht, GetHandleId(z), 3)
    local effect e3 = LoadEffectHandle(ht, GetHandleId(z), 4)
    local real pitch
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    if count <= 500 then
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
    endif
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, GetHandleId(z), - 1) + 1000 then 
        call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
    elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, GetHandleId(z), - 1) then
        call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
    endif
    call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, GetHandleId(z), - 1))
    if count == 1 then
        call SoundStart("war3mapImported\\Escanor_5.mp3")
        call UnitAddAbility(t, 'Amrf')
        call UnitRemoveAbility(t, 'Amrf')
        call SetUnitAnimationByIndex(c, 8)
        call Effect("war3mapImported\\shuozhu3.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 10, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
        call Effect("war3mapImported\\Black.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 10, 255, 255, 255, PercentTo255(60))
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
    endif
    if count == 5 then
        call Effect("war3mapImported\\asknhq.mdl", GetUnitX(c), GetUnitY(c), 900, a, 0, 0, 17, 16.6, 255, 255, 255, PercentTo255(90))
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        call Effect("war3mapImported\\by_wood_effect_yuzhiboyou_unusual_yuedu_1.mdl", GetUnitX(c), GetUnitY(c), 900, a, 0, 0, 1, 16.6, 255, 255, 255, PercentTo255(90))
        call SaveEffectHandle(ht, GetHandleId(z), 3, bj_lastCreatedEffect)
    endif
    if count == 480 then
        call SetUnitAnimationByIndex(c, 9)
    endif
    if count == 500 then
        call SetUnitInvulnerable(c, false)
        call PauseUnit(c, false)
        call IssueTargetOrderById(c, 851983, t)
        call SetUnitFlyHeight(t, 300, 0)
        call SetSpecialEffectYaw(e, a)
        call SetSpecialEffectYaw(e2, a)
        call Effect("war3mapImported\\AFBHQ.mdl", GetUnitX(c), GetUnitY(c), 300, a, 0, 0, 2.5, 6.6, 255, 255, 255, PercentTo255(90))
        call SaveEffectHandle(ht, GetHandleId(z), 4, bj_lastCreatedEffect)
        set e3 = bj_lastCreatedEffect
        call SaveReal(ht, GetHandleId(z), 0, a)
    endif
    if count >= 500 and count <= 800 then 
        set a = LoadReal(ht, GetHandleId(z), 0)
        set x = PolarX(GetUnitX(t), 6, a)
        set y = PolarY(GetUnitY(t), 6, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
        call SetEffectX(e, GetUnitX(t))
        call SetEffectY(e, GetUnitY(t))
        call SetSpecialEffectZ(e, 300 + GetAxisZ(GetUnitX(t), GetUnitY(t)))
        call SetEffectX(e2, GetUnitX(t))
        call SetEffectY(e2, GetUnitY(t))
        call SetSpecialEffectZ(e2, 300 + GetAxisZ(GetUnitX(t), GetUnitY(t)))
        call SetEffectX(e3, GetUnitX(t))
        call SetEffectY(e3, GetUnitY(t))
        call SetSpecialEffectZ(e3, 300 + GetAxisZ(GetUnitX(t), GetUnitY(t)))
    endif
    if count == 800 then
        call SoundStart("war3mapImported\\Escanor_5-1.mp3")
        call Effect("war3mapImported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_3.mdl", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 1.5, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
        call Effect("war3mapImported\\XZDL.mdl", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
    endif
    if count == 810 then 
        call SetUnitFlyHeight(t, 0, 0)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(t, false)
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
    set e = null
    set e2 = null
    set e3 = null
endfunction

function Trig_EscaT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0CI' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
        call TimerStart(z, 0.02, true, function Trig_EscaT_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_EscaT takes nothing returns nothing
    set gg_trg_EscaT = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_EscaT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_EscaT, function Trig_EscaT_Actions )
endfunction