//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_DioW_Func001 takes nothing returns nothing
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
    if count <= 95 then
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
    endif
    if count == 1 then
        call SoundStart("war3mapImported\\Dio_2.mp3")
        call SetUnitAnimationByIndex(c, 1)
        call Effect("war3mapimported\\by_wood_effect_yuanbanlin_sand2.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapimported\\wind4.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 0.85, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapimported\\HakenSaber2.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 0.85, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
    endif
    if count == 50 then
        call SetUnitAnimationByIndex(c, 2)
        call Effect("war3mapimported\\dash sfx.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 0.65, 1, 255, 255, 255, PercentTo255(40))
        call Effect("war3mapimported\\chongfeng2.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapimported\\CF2.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        set x = PolarX(GetUnitX(c), - 150, a)
        set y = PolarY(GetUnitY(c), - 150, a)
        call Effect("war3mapimported\\BY_Wood_GongChengSiPai_5.mdx", x, y, 25, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapimported\\wind3.mdx", GetUnitX(c), GetUnitY(c), 75, a, - 90, 0, 1.25, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.4)
        call Effect("war3mapimported\\wind4.mdx", GetUnitX(c), GetUnitY(c), 75, a, - 90, 0, 1, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
    endif
    if count == 75 then
        call SetUnitAnimationByIndex(c, 4)
    endif
    if count == 80 then
        call SoundStart("war3mapImported\\Dio_2-1.mp3")
    endif
    if count == 85 then
        set x = PolarX(GetUnitX(t), - 100, a)
        set y = PolarY(GetUnitY(t), - 100, a)
        call Effect("war3mapimported\\DioSlash.mdx", x, y, 100, a - 90, - 180, 0, 3, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        call Effect("war3mapimported\\AZ_PAFeathermoon_C_Caster.mdx", x, y, 100, a, 0, 0, 2.4, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3)
    endif
    if count >= 50 and count <= 90 then
        if dist > 140 then
            call SetUnitX(c, PolarX(GetUnitX(c) , dist / 30, a))
            call SetUnitY(c, PolarY(GetUnitY(c) , dist / 30, a))
        else
            set x = PolarX(GetUnitX(t), 5, a)
            set y = PolarY(GetUnitY(t), 5, a)
            if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
                call SetUnitX(t, x)
                call SetUnitY(t, y)
            endif
            call SetUnitX(c, PolarX(GetUnitX(t) , - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t) , - 120, a))
        endif
    endif
    if count == 90 then
        set x = PolarX(GetUnitX(t), 50, a)
        set y = PolarY(GetUnitY(t), 50, a)
        call Effect("war3mapimported\\az-zidan.mdx", x, y, 100, a, 0, 0, 2.4, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3)
        call Effect("war3mapimported\\qqqqqr.mdx", x, y, 100, a, 0, 0, 2.4, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3)
        call Effect("war3mapimported\\az_hitheavy.mdx", x, y, 100, a, 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapimported\\AZ_hit-red.mdx", x, y, 100, a, 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
    endif
    if count == 95 then 
        call UnitAddAbility(t, 'Amrf')
        call UnitRemoveAbility(t, 'Amrf')
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (1 + GetUnitAbilityLevel(c, 'A0F9')) * GetHeroAgi(c, true))
        call knockbackUnit(t, 600, a, 0.6)
        call VisionArea(GetOwningPlayer(c) , 1200, 3, GetUnitX(t) , GetUnitY(t))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
    endif
    if count >= 95 and count <= 125 then
        if count > 110 then
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 20, 0)
        else
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 20, 0)
        endif
    endif
    if count == 125 then
        call SetUnitFlyHeight(t, 0, 0)
        call Effect("war3mapimported\\BY_Wood_GongChengSiPai_6.mdx", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.25, 1, 255, 255, 255, PercentTo255(60))
        call Effect("war3mapimported\\wind4.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 0.85, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapimported\\[A]Sand3.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 1.25, 1, 255, 255, 255, PercentTo255(50))
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
endfunction

function Trig_DioW_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0F9' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_DioW_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_DioW takes nothing returns nothing
    set gg_trg_DioW = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_DioW, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_DioW, function Trig_DioW_Actions)
endfunction