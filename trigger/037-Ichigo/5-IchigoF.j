//TESH.scrollpos=39
//TESH.alwaysfold=0
function Trig_IchigoF_Func001 takes nothing returns nothing
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
    local effect e
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Ichigo_6.mp3")
        call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        call SetUnitAnimationByIndex(c, 7)
        call Effect("war3mapImported\\red-qiquan.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.3, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapImported\\red-zhendi-shanguang.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.3, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapImported\\wind4.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.2, 1, 255, PercentTo255(30), PercentTo255(30), 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapImported\\wind3.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.2, 1, 255, PercentTo255(30), PercentTo255(30), 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
    endif
    if count == 15 or count == 55 or count == 90 or count == 170 or count == 210 then
        call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
    endif
    if count == 15 or count == 90 or count == 170 then
        call Effect("war3mapImported\\red-zhendi-shanguang.mdx", GetUnitX(t), GetUnitY(t), 50, a, - 90, 0, 2, 1, 255, 255, 255, PercentTo255(90))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        set x = PolarX(GetUnitX(t), 50, a)
        set y = PolarY(GetUnitY(t), 50, a)
        call Effect("war3mapImported\\wind3.mdx", x, y, 50, a, - 90, 0, 1.25, 1, 255, PercentTo255(50), PercentTo255(50), PercentTo255(GetRandomReal(10, 40)))
        set x = PolarX(GetUnitX(c), - 100, a)
        set y = PolarY(GetUnitY(c), - 100, a)
        call Effect("war3mapImported\\CF2.mdx", x, y, 25, a, 0, 0, 0.35, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        set x = PolarX(GetUnitX(t), - 50, a)
        set y = PolarY(GetUnitY(t), - 50, a)
        call Effect("war3mapImported\\AZ_PA_C.mdx", x, y, 25, a, 0, 0, 1.2, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\[A]RedGlow.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\AZ_hit-red.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
    endif
    if count == 40 or count == 115 or count == 245 then
        call SetUnitAnimationByIndex(c, 8)
    endif
    if count == 55 then
        call Effect("war3mapImported\\az-zidan.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
        call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
        set x = PolarX(GetUnitX(t), 50, a)
        set y = PolarY(GetUnitY(t), 50, a)
        call Effect("war3mapImported\\qqqqqr.mdx", x, y, 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        call Effect("war3mapImported\\wind4.mdx", GetUnitX(t), GetUnitY(t), 50, a, - 90, 0, 1.3, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        call Effect("war3mapImported\\BY_Wood_GongChengSiPai_1.mdx", GetUnitX(t), GetUnitY(t), 50, a, - 180, 0, 3, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\BY_Wood_GongChengSiPai_1.mdx", GetUnitX(t), GetUnitY(t), 50, a, - 180, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        set x = PolarX(GetUnitX(t), 50, a)
        set y = PolarY(GetUnitY(t), 50, a)
        call Effect("war3mapImported\\rasengan_eff4.mdx", x, y, 50, a, - 90, 0, 1.25, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
    endif
    if count == 75 or count == 190 then
        call SetUnitAnimationByIndex(c, 7)
    endif
    if count == 80 then
        call SoundStart("war3mapImported\\Ichigo_6-1.mp3")
    endif
    if count >= 15 and count <= 40 or count >= 55 and count <= 70 or count >= 90 and count <= 110 or count >= 170 and count <= 190 or count >= 220 and count <= 250 then
        set x = PolarX(GetUnitX(t), 10, a)
        set y = PolarY(GetUnitY(t), 10, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
    endif
    if count >= 30 and count <= 45 or count >= 60 and count <= 75 or count >= 95 and count <= 115 or count >= 200 and count <= 220 then
        if dist > 140 then
            call SetUnitX(c, PolarX(GetUnitX(c), 10, a))
            call SetUnitY(c, PolarY(GetUnitY(c), 10, a))
        else
            call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        endif
    endif
    if count >= 115 and count <= 170 then
        set x = PolarX(GetUnitX(t), 10, a)
        set y = PolarY(GetUnitY(t), 10, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
        call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapImported\\[A]SlashCirlce.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, GetRandomReal(0.25, 0.5), 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 60)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 1.2))
        endif
    endif
    if count == 115 or count == 125 or count == 135 or count == 145 or count == 155 or count == 165 then
        call Effect("war3mapImported\\red-qiquan.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.3, 1, 255, 255, 255, 255)
    endif
    if count == 180 then
        set x = PolarX(GetUnitX(c), 50, a)
        set y = PolarY(GetUnitY(c), 50, a)
        call Effect("war3mapImported\\dash sfx.mdl", x, y, 50, a, 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(30))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        call Effect("war3mapImported\\chongfeng2.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapImported\\CF2.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 0.35, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        set x = PolarX(GetUnitX(c), - 50, a)
        set y = PolarY(GetUnitY(c), - 50, a)
        call Effect("war3mapImported\\BY_Wood_GongChengSiPai_5.mdl", x, y, 25, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapImported\\k4.mdl", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        set x = PolarX(GetUnitX(c), 50, a)
        set y = PolarY(GetUnitY(c), 50, a)
        call Effect("war3mapImported\\wind3.mdl", x, y, 50, a, - 90, 0, 1.5, 1, 255, 255, 255, PercentTo255(40))
    endif
    if count == 220 then
        set x = PolarX(GetUnitX(c), - 100, a)
        set y = PolarY(GetUnitY(c), - 100, a)
        call Effect("war3mapImported\\CF2.mdx", x, y, 25, a, 0, 0, 0.35, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        set x = PolarX(GetUnitX(c), - 700, a)
        set y = PolarY(GetUnitY(c), - 700, a)
        call Effect("war3mapImported\\az_yin_q1.mdx", x, y, 25, a, 0, 0, 0.6, 1, 255, PercentTo255(30), PercentTo255(30), PercentTo255(90))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapImported\\red-zhendi-shanguang.mdx", GetUnitX(t), GetUnitY(t), 50, a, - 90, 0, 2, 1, 255, 255, 255, PercentTo255(90))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\fire-boom-new-red.mdx", GetUnitX(t), GetUnitY(t), 50, a, - 90, 0, 1.5, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
    endif
    if count == 245 then
        call SoundStart("war3mapImported\\Ichigo_6-2.mp3")
        call Effect("war3mapImported\\az_red-xuanwo.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(90))
        call Effect("war3mapImported\\bymutou-hongse3.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.25, 1, 255, 255, 255, PercentTo255(20))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapImported\\red-qiquan.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.3, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapImported\\wind4.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, PercentTo255(40), PercentTo255(40), PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
    endif
    if count == 280 then
        call Effect("war3mapImported\\TX_White2.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.55, 1, 255, PercentTo255(40), PercentTo255(40), PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.45)
        call Effect("war3mapImported\\az_red-xuanwo.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(90))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.45)
        call Effect("war3mapImported\\red-qiquan.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.3, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapImported\\wind4.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, PercentTo255(40), PercentTo255(40), PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
    endif
    if count == 290 then
        set x = PolarX(GetUnitX(c), 50, a)
        set y = PolarY(GetUnitY(c), 50, a)
        call Effect("war3mapImported\\yytc.mdx", x, y, 50, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
    endif
    if count >= 290 and count <= 330 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 2)
        set x = PolarX(GetUnitX(t), 10, a)
        set y = PolarY(GetUnitY(t), 10, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
        if Distance(GetEffectX(e), GetEffectY(e), GetUnitX(t), GetUnitY(t)) > 140 then
            set x = PolarX(GetEffectX(e), 15, a)
            set y = PolarY(GetEffectY(e), 15, a)
            call SetEffectX(e, x)
            call SetEffectY(e, y)
            call SetSpecialEffectZ(e, 50 + GetAxisZ(x, y))
        else
            set x = PolarX(GetUnitX(t), - 100, a)
            set y = PolarY(GetUnitY(t), - 100, a)
            call SetEffectX(e, x)
            call SetEffectY(e, y)
            call SetSpecialEffectZ(e, 50 + GetAxisZ(x, y))
        endif
        call SetSpecialEffectScale(e, GetSpecialEffectScale(e) + 0.02)
    endif
    if count == 330 then 
        call Effect("war3mapImported\\fire-boom-new-red.mdl", GetUnitX(t), GetUnitY(t), 50, a, - 90, 0, 4, 1.5, 255, 255, 255, PercentTo255(90))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapImported\\bymutou-hongse3.mdl", GetUnitX(t), GetUnitY(t), 50, a, - 90, 0, 1.55, 1.5, 255, 255, 255, PercentTo255(20))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapImported\\red-zhendi-shanguang.mdl", GetUnitX(t), GetUnitY(t), 50, a, - 90, 0, 2, 1.5, 255, 255, 255, PercentTo255(90))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
    endif
    if count == 335 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 11 * GetHeroStr(c, true))
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
endfunction

function Trig_IchigoF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0FF' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_IchigoF_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_IchigoF takes nothing returns nothing
    set gg_trg_IchigoF = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_IchigoF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_IchigoF, function Trig_IchigoF_Actions )
endfunction