//TESH.scrollpos=59
//TESH.alwaysfold=0
function Trig_GonT_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x
    local real y
    local real a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local real dist = Distance(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local integer i = 0
    local effect e = LoadEffectHandle(ht, GetHandleId(z), 2)
    local effect e2 = LoadEffectHandle(ht, GetHandleId(z), 3)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, GetHandleId(z), - 1) + 1000 then 
        call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
    elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, GetHandleId(z), - 1) then
        call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
    endif
    call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, GetHandleId(z), - 1))
    if count == 1 then
        call SoundStart("war3mapImported\\Gon_5.mp3")
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call UnitAddAbility(t, 'Amrf')
        call UnitRemoveAbility(t, 'Amrf')
        call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        call SetUnitFlyHeight(c, 3000, 0)
        call Effect("war3mapimported\\Adult Gohan (Piccolo's Clothing).mdx", GetUnitX(c), GetUnitY(c), 0, a, 0, 0, 1, 17.3, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 9)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
    endif
    if count == 10 then 
        call Effect("war3mapimported\\EarthDetonation.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\DustWaveAnimate2.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
    endif
    if count == 40 then 
        call SoundStart("war3mapImported\\Gon_5-1.mp3")
        call SoundStart("war3mapImported\\Gon_5-8.mp3")
    endif
    if count >= 40 and count <= 400 then
        call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 5, 0)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 10 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapimported\\DustWaveAnimate2.mdx", GetEffectX(e), GetEffectY(e), 25, a, 0, 0, GetRandomReal(0.8, 1.5), 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
            set x = PolarX(GetEffectX(e), - 30, a + 120)
            set y = PolarY(GetEffectY(e), - 30, a + 120)
            call Effect("war3mapimported\\[A]supershinythingyGon.mdx", x, y, 100, a, 0, 0, GetRandomReal(0.8, 1.5), 1, 255, 255, 255, 255)
        endif
    endif
    if count == 70 then
        call SetSpecialEffectAnimationByIndex(e, 3)
        call SetSpecialEffectTimeScale(e, 0.3)
    endif
    if count == 150 then 
        set x = PolarX(GetEffectX(e), - 30, a + 120)
        set y = PolarY(GetEffectY(e), - 30, a + 120)
        call Effect("war3mapimported\\[A]AceBall.mdx", x, y, 100, a, 0, 0, 0.5, 12, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 3, bj_lastCreatedEffect)
    endif
    if count == 170 then 
        call SoundStart("war3mapImported\\Gon_5-2.mp3")
    endif
    if count == 330 then 
        call SoundStart("war3mapImported\\Gon_5-3.mp3")
        call SetSpecialEffectScale(e2, GetSpecialEffectScale(e2) + 3.6)
        call SetSpecialEffectZ(e2, GetEffectZ(e2) + 180)
    endif
    if count >= 330 and count <= 390 then
        call SetSpecialEffectScale(e2, GetSpecialEffectScale(e2) - 0.06)
        call SetSpecialEffectZ(e2, GetEffectZ(e2) - 3)
    endif
    if count == 400 then
        call SoundStart("war3mapImported\\Gon_5-4.mp3")
    endif
    if count >= 420 and count <= 780 then
        call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 5, 0)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 10 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapimported\\DustWaveAnimate2.mdx", GetEffectX(e), GetEffectY(e), 25, a, 0, 0, GetRandomReal(1.2, 2), 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
            set x = PolarX(GetEffectX(e), - 30, a + 120)
            set y = PolarY(GetEffectY(e), - 30, a + 120)
            call Effect("war3mapimported\\[A]supershinythingyGon.mdx", x, y, 150, a, 0, 0, GetRandomReal(1.2, 2), 1, 255, 255, 255, 255)
        endif
    endif
    if count == 560 then 
        call SoundStart("war3mapImported\\Gon_5-5.mp3")
    endif
    if count == 630 then
        call SoundStart("war3mapImported\\Gon_5-6.mp3")
    endif
    if count == 690 then 
        call SetSpecialEffectAnimationByIndex(e, 6)
        call SetSpecialEffectTimeScale(e, 0.4)
    endif
    if count == 750 then
        call SoundStart("war3mapImported\\Gon_5-7.mp3")
    endif
    if count == 780 then
        call Effect("war3mapimported\\[a]explodeorange.mdx", GetUnitX(t), GetUnitY(t), 40, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call Effect("Abilities\\Spells\\Other\\Doom\\DoomDeath.mdx", GetUnitX(t), GetUnitY(t), 150, a, - 90, 0, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[A]GonFef.mdx", GetUnitX(t), GetUnitY(t), 200, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\cronosphere.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 0.5, 1.7, 255, 178, 102, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 3, bj_lastCreatedEffect)
        set e2 = bj_lastCreatedEffect
    endif
    if count >= 780 and count <= 840 then
        call SetSpecialEffectScale(e2, GetSpecialEffectScale(e2) + 0.05)
        call SetSpecialEffectZ(e2, GetEffectZ(e2) + 1)
    endif
    if count == 800 then
        call Effect("war3mapimported\\SuperBigExplosion2.mdx", GetUnitX(t), GetUnitY(t), 150, a, - 90, 0, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[A]Natsu ef roar.mdx", GetUnitX(t), GetUnitY(t), 200, a, - 90, 0, 1.5, 1, 255, 255, 255, 255)
    endif
    if count == 840 then
        call SetSpecialEffectAnimationByIndex(e2, 1)
    endif
    if count == 860 then 
        call SetUnitFlyHeight(c, 0, 0)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 15 * GetHeroStr(c, true))
        call knockbackUnit(t, 600, a, 0.6)
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
endfunction

function Trig_GonT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A02M' then 
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
        call TimerStart(z, 0.02, true, function Trig_GonT_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_GonT takes nothing returns nothing
    set gg_trg_GonT = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_GonT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_GonT, function Trig_GonT_Actions )
endfunction