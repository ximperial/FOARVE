//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_AlibabaR_Func001 takes nothing returns nothing
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
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Alibaba_6.mp3")
        call SetUnitAnimationByIndex(c, 5)
        call Effect("war3mapimported\\Holy_Fire_Slam2.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
        call Effect("war3mapimported\\[a]explodeorange.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1.5, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
        call Effect("war3mapimported\\RedHarvest.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 2.5, 2, 255, 255, 255, 255)
        call Effect("war3mapimported\\[A]Flame Burst2.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 2, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
    endif
    if count == 30 then
        call SoundStart("war3mapImported\\Alibaba_6-1.mp3")
    endif
    if count == 80 then
        call SoundStart("war3mapImported\\Alibaba_6-2.mp3")
    endif
    if count >= 80 and count <= 100 then
        if dist > 140 then
            call SetUnitX(c, PolarX(GetUnitX(c) , dist / 15, a))
            call SetUnitY(c, PolarY(GetUnitY(c) , dist / 15, a))
        else
            call SetUnitX(c, PolarX(GetUnitX(t) , - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t) , - 120, a))
        endif
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z) , 1, iterator)
        if iterator >= 4 then
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call Effect("war3mapimported\\[a]explodeorange.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, GetRandomReal(1, 1.5) , 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\Aura2.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, GetRandomReal(.8, 1.2) , 1, 255, 255, 255, 255)
        endif
    endif
    if count == 95 then
        call SetUnitVertexColor(c, 255, 255, 255, 0)
    endif
    if count == 105 then
        call SoundStart("war3mapImported\\Alibaba_6-3.mp3")
        call SetUnitVertexColor(c, 255, 255, 255, 255)
        call SetUnitAnimationByIndex(c, 2)
        call SetUnitTimeScale(c, 1.5)
        call SetUnitX(c, PolarX(GetUnitX(t), 140, a))
        call SetUnitY(c, PolarY(GetUnitY(t), 140, a))
    endif
    if count == 110 then
        call Effect("war3mapimported\\EarthDetonation.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        call Effect("war3mapimported\\[a]explodeorange.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 2, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapimported\\Holy_Fire_Slam2.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
        call Effect("war3mapimported\\[A]fire.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 1.3, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.35)
        call Effect("war3mapimported\\[A]asuma-explosionAli.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
        call Effect("war3mapimported\\FireEruption2.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 2, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
    endif
    if count == 115 then 
        call SetUnitFlyHeight(t, 0, 0)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (6 + 2 * GetUnitAbilityLevel(c, 'A047')) * GetHeroAgi(c, true))
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

function Trig_AlibabaR_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A047' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_AlibabaR_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_AlibabaR takes nothing returns nothing
    set gg_trg_AlibabaR = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_AlibabaR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_AlibabaR, function Trig_AlibabaR_Actions)
endfunction