//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_LeviT_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z) , 1)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local real x
    local real y
    local real z1
    local real a = Angle(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
    local real dist = Distance(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
    local integer i = 0
    local effect e = LoadEffectHandle(ht, GetHandleId(z), 2)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, GetHandleId(z) , - 1) + 1000 then 
        call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
    elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, GetHandleId(z) , - 1) then
        call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
    endif
    call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, GetHandleId(z) , - 1))
    if count == 1 then
        call SoundStart("war3mapImported\\Levi_5.mp3")
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call UnitAddAbility(t, 'Amrf')
        call UnitRemoveAbility(t, 'Amrf')
        call SetUnitFlyHeight(c, 3000, 0)
        call Effect("war3mapimported\\Levi.mdx", GetUnitX(c), GetUnitY(c), 0, GetUnitFacing(c), 0, 0, 1.85, 8.4, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 6)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
    endif
    if count == 5 or count == 15 or count == 25 or count == 35 then
        call Effect("war3mapimported\\punchshot.mdx", GetEffectX(e), GetEffectY(e), GetEffectZ(e), a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdx", GetEffectX(e), GetEffectY(e), GetEffectZ(e), a, 0, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count <= 40 then
        set a = Angle(GetEffectX(e), GetEffectY(e) , GetUnitX(t) , GetUnitY(t))
        set dist = Distance(GetEffectX(e), GetEffectY(e) , GetUnitX(t) , GetUnitY(t))
        if dist > 140 then
            call SetEffectX(e, PolarX(GetEffectX(e) , dist / 10, a))
            call SetEffectY(e, PolarY(GetEffectY(e) , dist / 10, a))
            call SetSpecialEffectZ(e, GetAxisZ(GetEffectX(e), GetEffectY(e)))
        else
            set x = PolarX(GetUnitX(t), 20, a)
            set y = PolarY(GetUnitY(t), 20, a)
            if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
                call SetUnitX(t, x)
                call SetUnitY(t, y)
            endif
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 15, 0)
            call SetEffectX(e, PolarX(GetUnitX(t) , - 120, a))
            call SetEffectY(e, PolarY(GetUnitY(t) , - 120, a))
            call SetSpecialEffectZ(e, GetUnitZ(t) - 50)
        endif
    endif
    if count == 45 then
        call SoundStart("war3mapImported\\Levi_5-1.mp3")
    endif
    if count >= 45 and count <= 395 then
        set z1 = GetEffectZ(e) + GetAxisZ(GetEffectX(e) + 0.01, GetEffectY(e)) - GetAxisZ(GetEffectX(e) - 0.01, GetEffectY(e))
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator <= 20 then
            set a = Angle(GetEffectX(e), GetEffectY(e) , GetUnitX(t) , GetUnitY(t))
            call SetSpecialEffectYaw(e, a)
            call SetEffectX(e, PolarX(GetEffectX(e) , 30, a))
            call SetEffectY(e, PolarY(GetEffectY(e) , 30, a))
            call SetSpecialEffectZ(e, z1 + 15)
        endif
        if iterator == 20 then
            call Effect("war3mapimported\\redslash2a.mdx", GetEffectX(e), GetEffectY(e), GetUnitFlyHeight(t)-25, a, 0, 0, 3.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\blood-rou.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), a, 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapimported\\xjbz.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), a, 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectYaw(e, randomAngle())
        endif
        if iterator > 20 then
            call SetEffectX(e, PolarX(GetEffectX(e) , 35, GetSpecialEffectYaw(e)))
            call SetEffectY(e, PolarY(GetEffectY(e) , 35, GetSpecialEffectYaw(e)))
            call SetSpecialEffectZ(e, z1 - 20)
        endif
        if iterator == 35 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
        endif
    endif
    if count == 390 then
        call SoundStart("war3mapImported\\Levi_5-2.mp3")
    endif
    if count == 410 then
        call Effect("war3mapimported\\az_hit-red-blade.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\xjbz.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
    endif
    if count == 420 then 
        call SetUnitX(c, PolarX(GetUnitX(t) , - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t) , - 120, a))
        call SetUnitFlyHeight(c, 0, 0)
        call SetUnitFlyHeight(t, 0, 0)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 15 * GetHeroAgi(c, true))
        call VisionArea(GetOwningPlayer(c) , 1200, 3, GetUnitX(t) , GetUnitY(t))
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

function Trig_LeviT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0EM' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
        call TimerStart(z, 0.02, true, function Trig_LeviT_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_LeviT takes nothing returns nothing
    set gg_trg_LeviT = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_LeviT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_LeviT, function Trig_LeviT_Actions)
endfunction