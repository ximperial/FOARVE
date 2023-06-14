//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_EmiyaR_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z) , 1)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local real x
    local real y
    local real a = Angle(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
    local real dist = Distance(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
    local integer i = 0
    local effect e
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Emiya_4.mp3")
        call SetUnitAnimationByIndex(c, 3)
    endif
    if count == 10 then
        call SetUnitTimeScale(c, 0)
    endif
    if count <= 40 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapImported\\DustWaveAnimate2.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, GetRandomReal(0.65, 2), 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
            call Effect("war3mapImported\\DustWaveAnimate2.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, GetRandomReal(1.65, 3), 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
            call Effect("war3mapImported\\WaveFxVert.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, GetRandomReal(2, 4), 1, GetRandomInt(1, 255), GetRandomInt(1, 255), GetRandomInt(1, 255), PercentTo255(GetRandomReal(25, 80)))
        endif
    endif
    if count == 40 then
        call Effect("war3mapImported\\remiliasq.mdl", GetUnitX(c), GetUnitY(c), 50, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        set iterator = 0
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        call SaveReal(ht, GetHandleId(z), 0, Distance(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t)))
    endif
    if count >= 40 and count <= 70 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 2)
        set dist = LoadReal(ht, GetHandleId(z), 0)
        set x = PolarX(GetEffectX(e), dist / 30, a)
        set y = PolarY(GetEffectY(e), dist / 30, a)
        call SetSpecialEffectPositionEx(e, x, y, 50 + GetAxisZ(x, y))
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 4 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapImported\\dtred.mdl", GetEffectX(e), GetEffectY(e), 150, a, - 90, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\wind3.mdl", GetEffectX(e), GetEffectY(e), 150, a, - 90, 0, 1, 1, 255, 255, 255, 255)
        endif
    endif
    if count == 70 then 
        call SoundStart("war3mapImported\\Emiya_4-1.mp3")
        call Effect("war3mapImported\\BY_Wood_Effect_Order_MoBai_Dev_BianShen_KuoSan2.mdl", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\chushou_by_wood_effect_unusual_kof_caoti_huozhu.mdl", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\az_tormentedsoul_t1.mdl", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, 255)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (6 + 2 * GetUnitAbilityLevel(c, 'A0D9')) * GetHeroAgi(c, true))
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
    set e = null
endfunction

function Trig_EmiyaR_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0D9' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_EmiyaR_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_EmiyaR takes nothing returns nothing
    set gg_trg_EmiyaR = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_EmiyaR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_EmiyaR, function Trig_EmiyaR_Actions)
endfunction