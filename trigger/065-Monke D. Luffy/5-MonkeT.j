//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_MonkeT_Func001 takes nothing returns nothing
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
    local real pitch
    local effect e = LoadEffectHandle(ht, GetHandleId(z) , 2)
    local real z1
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
        call SoundStart("war3mapImported\\Monke_5.mp3")
        call SetUnitAnimationByIndex(c, 2)
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
    endif
    if count >= 50 and count <= 100 then
        if dist < 600 then
            set x = PolarX(GetUnitX(c) , - 12, a)
            set y = PolarY(GetUnitY(c) , - 12, a) 
            if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
                call SetUnitX(c, x)
                call SetUnitY(c, y) 
            endif
        endif 
        call SetUnitFlyHeight(c, GetUnitFlyHeight(c) + 16, 0)
    endif
    if count == 60 then
        call SetUnitAnimationByIndex(c, 16)
        call SetUnitTimeScale(c, 0.4) 
    endif
    if count == 100 then
        call SoundStart("war3mapImported\\Monke_5-1.mp3")
        set x = PolarX(GetUnitX(c) , 600, a)
        set y = PolarY(GetUnitY(c) , 600, a) 
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x)
            call SetUnitY(t, y) 
        endif
        set x = PolarX(GetUnitX(c) , 70, a - 90)
        set y = PolarY(GetUnitY(c) , 70, a - 90)
        set pitch = Slope(GetUnitX(c), GetUnitY(c), 850, GetUnitX(t) , GetUnitY(t) , 0)
        call Effect("war3mapimported\\lb_lfxq_da.mdx", x, y, 850, a, pitch-100, 0, 0.42, 5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.2)
        call SaveEffectHandle(ht, GetHandleId(z) , 2, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
    endif
    if count == 140 then
        call SetUnitTimeScale(c, 0)
    endif
    if count == 150 then
        call SoundStart("war3mapImported\\Monke_5-2.mp3")
        call SetSpecialEffectTimeScale(e, 0.01) 
        call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(t) , GetUnitY(t) , 100, a, 0, 0, 1.5, 1.5, 0, 0, 0, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(t) , GetUnitY(t) , 100, a, 0, 0, 1.25, 1.5, 0, 0, 0, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapimported\\WindNewFaw4.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 1.5, 1.5, 0, 0, 0, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapimported\\BY_Wood_GongChengSiPai_6.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 2.5, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapimported\\zhendi-sand.mdx", GetUnitX(t) , GetUnitY(t) , 50, a, 0, 0, 2, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        set x = PolarX(GetUnitX(t) , 300, a + 45)
        set y = PolarY(GetUnitY(t) , 300, a + 45)
        call Effect("war3mapimported\\[A]Sand3.mdx", x, y, 50, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        set x = PolarX(GetUnitX(t) , 300, a - 45)
        set y = PolarY(GetUnitY(t) , 300, a - 45)
        call Effect("war3mapimported\\[A]Sand3.mdx", x, y, 50, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        set x = PolarX(GetUnitX(t) , - 300, a + 45)
        set y = PolarY(GetUnitY(t) , - 300, a + 45)
        call Effect("war3mapimported\\[A]Sand3.mdx", x, y, 50, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        set x = PolarX(GetUnitX(t) , - 300, a - 45)
        set y = PolarY(GetUnitY(t) , - 300, a - 45)
        call Effect("war3mapimported\\[A]Sand3.mdx", x, y, 50, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
    endif
    if count >= 150 and count <= 350 then
        if count <= 240 then
            set x = PolarX(GetUnitX(t) , 5, a)
            set y = PolarY(GetUnitY(t) , 5, a)
            if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
                call SetUnitX(t, x)
                call SetUnitY(t, y) 
            endif
        endif
        call SetUnitX(c, PolarX(GetUnitX(t) , - 600, a))
        call SetUnitY(c, PolarY(GetUnitY(t) , - 600, a))
        call SetEffectX(e, PolarX(GetUnitX(c) , 70, a - 90))
        call SetEffectY(e, PolarY(GetUnitY(c) , 70, a - 90))
        if count >= 270 and count <= 350 then
            call SetUnitFlyHeight(c, GetUnitFlyHeight(c) - 10, 0)
            set z1 = GetEffectZ(e) + GetAxisZ(GetEffectX(e) + 0.01, GetEffectY(e)) - GetAxisZ(GetEffectX(e) - 0.01, GetEffectY(e))
            call SetSpecialEffectZ(e, z1 - 10)
            call SetSpecialEffectScale(e, 0.42 -(count - 270) * 0.0045)
        endif
    endif
    if count == 240 then
        call SoundStart("war3mapImported\\Monke_5-3.mp3")
        call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(t) , GetUnitY(t) , 100, a, 0, 0, 2, 1, 0, 0, 0, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6) 
        call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(t) , GetUnitY(t) , 100, a, 0, 0, 1.75, 1, 0, 0, 0, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapimported\\WindNewFaw4.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 1.5, 1, 0, 0, 0, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapimported\\az_slb.mdx", GetUnitX(t) , GetUnitY(t) , 50, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapimported\\ChuShou_Effect_Earth1.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.35)
        call Effect("war3mapimported\\[A]Sand3.mdx", GetUnitX(t) , GetUnitY(t) , 50, a, 0, 0, 2, 1, 255, 255, 255, 255)
        set x = PolarX(GetUnitX(t) , 300, a + 45)
        set y = PolarY(GetUnitY(t) , 300, a + 45)
        call Effect("war3mapimported\\[A]Sand3.mdx", x, y, 25, a, 0, 0, 1.75, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        set x = PolarX(GetUnitX(t) , 300, a - 45)
        set y = PolarY(GetUnitY(t) , 300, a - 45)
        call Effect("war3mapimported\\[A]Sand3.mdx", x, y, 25, a, 0, 0, 1.75, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        set x = PolarX(GetUnitX(t) , - 300, a + 45)
        set y = PolarY(GetUnitY(t) , - 300, a + 45)
        call Effect("war3mapimported\\[A]Sand3.mdx", x, y, 25, a, 0, 0, 1.75, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        set x = PolarX(GetUnitX(t) , - 300, a - 45)
        set y = PolarY(GetUnitY(t) , - 300, a - 45)
        call Effect("war3mapimported\\[A]Sand3.mdx", x, y, 25, a, 0, 0, 1.75, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
    endif
    if count <= 350 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z) , 1, iterator)
        if iterator >= 10 then
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call Effect("war3mapimported\\WindNewFaw4.mdx", GetUnitX(c) , GetUnitY(c) , GetUnitFlyHeight(c) + 50, a, 0, 0, GetRandomReal(1, 1.35) , 1, 0, 0, 0, PercentTo255(GetRandomReal(50, 70)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6))
            call Effect("war3mapimported\\kaizokusfxbyvalk4.mdx", GetUnitX(c) , GetUnitY(c) , GetUnitFlyHeight(c) + 50, a, 0, 0, GetRandomReal(1.25, 1.75) , 1, 0, 0, 0, PercentTo255(GetRandomReal(50, 70)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 0.8))
            call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(c) , GetUnitY(c) , GetUnitFlyHeight(c) + 50, a, 0, 0, GetRandomReal(1.25, 1.55) , 1, 0, 0, 0, PercentTo255(GetRandomReal(50, 70)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.5))
        endif
    endif
    if count == 360 then 
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
    set e = null
endfunction

function Trig_MonkeT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A08W' then 
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
        call TimerStart(z, 0.02, true, function Trig_MonkeT_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_MonkeT takes nothing returns nothing
    set gg_trg_MonkeT = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_MonkeT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_MonkeT, function Trig_MonkeT_Actions)
endfunction