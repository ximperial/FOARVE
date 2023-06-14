//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_AlibabaD_Func001 takes nothing returns nothing
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
    local effect e = LoadEffectHandle(ht, GetHandleId(z) , 2)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Alibaba_7.mp3")
        call SetUnitAnimationByIndex(c, 4)
        set x = PolarX(GetUnitX(c) , -200, a)
        set y = PolarY(GetUnitY(c) , -200, a)
        call Effect("war3mapimported\\alibabamagiccircle.mdx", x, y, 225, a + 180, -90, 0, 3, 5, 255, 255, 255, 255)
        call Effect("war3mapimported\\az_tormentedsoul_t1.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 3, 5.6, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, .1)
    endif
    if count == 200 then
        call SetUnitAnimationByIndex(c, 6)
        call SetUnitTimeScale(c, 1.5)
    endif
    if count <= 230 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z) , 1, iterator)
        if iterator >= 15 then
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call Effect("war3mapimported\\Holy_Fire_Slam2.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, GetRandomReal(.8, 1.2) , 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\RedHarvest.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, GetRandomReal(2, 3) , 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\[A]Flame Burst2.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, GetRandomReal(1.5, 2) , 1, 255, 255, 255, 255)
        endif
    endif
    if count == 230 then
        call Effect("war3mapimported\\[a]explodeorange.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z) , 2, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
    endif
    if count >= 230 and count <= 250 then
        call SetEffectX(e, PolarX(GetEffectX(e) , dist / 20, a))
        call SetEffectY(e, PolarY(GetEffectY(e) , dist / 20, a))
        call SetSpecialEffectZ(e, 25 + GetAxisZ(GetEffectX(e) , GetEffectY(e)))
        call Effect("war3mapimported\\flames&smoke.mdx", GetEffectX(e) , GetEffectY(e) , 25, a, 0, 0, GetRandomReal(1, 1.5) , 1, 255, 255, 255, 255)
    endif
    if count == 250 then
        call Effect("war3mapimported\\[A]asuma-explosionAli.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\FireEruption2.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\SuperBigExplosion2.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 4, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[a]explodeorange.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\Firaga2.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 6, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\shuozhu2.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
    endif
    if count == 260 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 8 * GetHeroAgi(c, true))
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

function Trig_AlibabaD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A04Q' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_AlibabaD_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_AlibabaD takes nothing returns nothing
    set gg_trg_AlibabaD = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_AlibabaD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_AlibabaD, function Trig_AlibabaD_Actions)
endfunction