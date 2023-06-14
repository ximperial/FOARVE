//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_NeptunR_Func001 takes nothing returns nothing
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
    if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, GetHandleId(z) , - 1) + 1000 then 
        call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
    elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, GetHandleId(z) , - 1) then
        call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
    endif
    call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, GetHandleId(z) , - 1))
    if count == 1 then
        call SoundStart("war3mapImported\\Neptun_4.mp3")
        call SetUnitTimeScale(c, 1.5)
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call UnitAddAbility(t, 'Amrf')
        call UnitRemoveAbility(t, 'Amrf')
        call Effect("war3mapimported\\LotusStar.mdx", GetUnitX(c), GetUnitY(c), 40, a, 0, 0, 1.3, 1.5, 255, 255, 255, PercentTo255(90))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3)
        call Effect("war3mapimported\\DTPurple.mdx", GetUnitX(c), GetUnitY(c), 40, a, 0, 0, 1, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3)
        call Effect("war3mapimported\\ShockwavePurple.mdx", GetUnitX(c), GetUnitY(c), 40, a, 0, 0, 1.2, 1.5, 255, 255, 255, PercentTo255(90))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3)
    endif
    if count == 15 or count == 35 or count == 60 or count == 95 or count == 130 or count == 140 or count == 180 or count == 210 or count == 255 or count == 310 then
        call Effect("war3mapimported\\WindNewFaw4.mdx", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(c) + 25, randomAngle(), 0, 0, 0.45, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(c) + 100, randomAngle(), 0, 0, 1, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
    endif
    if count == 25 then
        call Effect("war3mapimported\\blackblink1.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
    endif
    if count >= 30 and count <= 130 then
        call SetUnitX(c, PolarX(GetUnitX(t) , - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t) , - 120, a))
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 10 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SetUnitAnimation(c, "attack")
            call Effect("war3mapimported\\StarSlash(Missle).mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, GetRandomReal(1.6, 2.3), 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            call Effect("war3mapimported\\FreezingRing.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, GetRandomReal(0.8, 1.1), 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        endif
    endif
    if count == 140 then
        call SetUnitAnimationByIndex(c, 5)
    endif
    if count == 150 then
        call Effect("war3mapimported\\OrbitalRay.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 6, 1, 255, 255, 255, PercentTo255(90))
        call Effect("war3mapimported\\PinkBarrier.mdx", GetUnitX(t), GetUnitY(t), 400, a, 0, 0, 4.5, 5, 255, 255, 255, 255)
        call Effect("war3mapimported\\Black.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1, 4, 255, 255, 255, PercentTo255(60))
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
        call SetUnitFlyHeight(t, 400, 800)
    endif
    if count == 180 then
        call SetUnitFlyHeight(c, 400, 1333) 
    endif
    if count >= 200 and count <= 320 then
        call SetUnitX(c, PolarX(GetUnitX(t) , - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t) , - 120, a))
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 10 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SetUnitAnimation(c, "attack")
            call Effect("war3mapimported\\StarSlash(Missle).mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), a, 0, 0, GetRandomReal(2.1, 2.8), 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            call Effect("war3mapimported\\FreezingRing.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), a, 0, 0, GetRandomReal(1, 1.25), 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        endif
    endif
    if count == 340 then
        call SetUnitAnimationByIndex(c, 3)
        call SetUnitTimeScale(c, 1) 
    endif
    if count == 360 then
        call SetUnitFlyHeight(c, 0, 1000) 
        call SetUnitFlyHeight(t, 0, 1000)
    endif
    if count == 380 then
        call Effect("war3mapimported\\EnergyBurst.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\by_wood_bashenan_juqi_1_4.mdx", GetUnitX(t), GetUnitY(t), 80, a, 0, 0, 4, 1, 139, 10, 139, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapimported\\[A]ExpPurple.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2.8, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\Dls1.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.4, 1, 255, 255, 255, 255)
    endif
    if count == 390 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (6 + 2 * GetUnitAbilityLevel(c, 'A0BQ')) * GetHeroAgi(c, true))
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

function Trig_NeptunR_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0BQ' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
        call TimerStart(z, 0.02, true, function Trig_NeptunR_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_NeptunR takes nothing returns nothing
    set gg_trg_NeptunR = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_NeptunR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_NeptunR, function Trig_NeptunR_Actions)
endfunction