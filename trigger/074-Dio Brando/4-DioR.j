//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_DioR_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Dio_4.mp3")
        call SetUnitAnimationByIndex(c, 10)
    endif
    if count == 1 or count == 30 or count == 60 then
        call Effect("war3mapimported\\by_wood_effect_yuanbanlin_sand2.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapimported\\wind4.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 0.85, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapimported\\HakenSaber2.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 0.85, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
    endif
    if count == 70 then
        call Effect("war3mapimported\\dioword.mdx", GetUnitX(c), GetUnitY(c), 0, a, 0, 0, 1, 5.8, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 6)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        set x = PolarX(GetUnitX(c), 50, a)
        set y = PolarY(GetUnitY(c), 50, a)
        call Effect("war3mapimported\\wind3.mdx", x, y, 75, a, - 90, 0, 1.25, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.4)
    endif
    if count >= 70 and count <= 90 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 2)
        set dist = Distance(GetEffectX(e) , GetEffectY(e) , GetUnitX(t) , GetUnitY(t))
        if dist > 140 then
            set x = PolarX(GetEffectX(e), dist / 15, a)
            set y = PolarY(GetEffectY(e), dist / 15, a)
            call SetSpecialEffectPositionEx(e, x, y, GetAxisZ(x, y))
        else
            set x = PolarX(GetUnitX(t), - 100, a)
            set y = PolarY(GetUnitY(t), - 100, a)
            call SetSpecialEffectPositionEx(e, x, y, GetAxisZ(x, y))
        endif
    endif
    if count == 80 or count == 90 or count == 100 or count == 110 or count == 120 or count == 130 or count == 140 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 2)
        set x = PolarX(GetEffectX(e), 50, a)
        set y = PolarY(GetEffectY(e), 50, a)
        call Effect("war3mapimported\\wind3.mdx", x, y, 100, a, - 90, 0, GetRandomReal(1, 1.5), 1, 255, 255, 255, PercentTo255(GetRandomReal(20, 50)))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 1.2))
    endif
    if count == 90 then
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
        call Effect("war3mapimported\\wind4.mdx", GetUnitX(c), GetUnitY(c), 75, a + 180, - 90, 0, 1, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
    endif
    if count >= 90 and count <= 150 then
        set dist = Distance(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
        if dist > 190 then
            call SetUnitX(c, PolarX(GetUnitX(c), dist / 15, a))
            call SetUnitY(c, PolarY(GetUnitY(c), dist / 15, a))
        else
            call SetUnitX(c, PolarX(GetUnitX(t), - 170, a))
            call SetUnitY(c, PolarY(GetUnitY(t), - 170, a))
        endif
        set e = LoadEffectHandle(ht, GetHandleId(z), 2)
        set dist = Distance(GetEffectX(e) , GetEffectY(e) , GetUnitX(t) , GetUnitY(t))
        if dist > 140 then
            set x = PolarX(GetEffectX(e), dist / 10, a)
            set y = PolarY(GetEffectY(e), dist / 10, a)
            call SetSpecialEffectPositionEx(e, x, y, GetAxisZ(x, y))
        else
            set x = PolarX(GetUnitX(t), 5, a)
            set y = PolarY(GetUnitY(t), 5, a)
            if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
                call SetUnitX(t, x)
                call SetUnitY(t, y)
            endif
            set x = PolarX(GetUnitX(t), - 100, a)
            set y = PolarY(GetUnitY(t), - 100, a)
            call SetSpecialEffectPositionEx(e, x, y, GetAxisZ(x, y))
        endif
    endif
    if count == 150 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 2)
        call SetSpecialEffectAnimationByIndex(e, 4)
    endif
    if count >= 150 and count <= 230 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 2)
        set x = PolarX(GetUnitX(t), 5, a)
        set y = PolarY(GetUnitY(t), 5, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
        call SetUnitX(c, PolarX(GetUnitX(t), - 170, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 170, a))
        set x = PolarX(GetUnitX(t), - 100, a)
        set y = PolarY(GetUnitY(t), - 100, a)
        call SetSpecialEffectPositionEx(e, x, y, GetAxisZ(x, y))
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            set x = PolarX(GetUnitX(t), 50, a)
            set y = PolarY(GetUnitY(t), 50, a)
            call Effect("war3mapimported\\BY_Wood_GongChengSiPai_1.mdx", x, y, 50, a + GetRandomReal(- 40, 40), - 180, 0, GetRandomReal(2, 3.5), 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 70)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 1.2))
            call Effect("war3mapimported\\wind3.mdx", x, y, 50, a + GetRandomReal(- 40, 40), - 90, 0, GetRandomReal(1.5, 2.5), 1, 255, 255, 255, PercentTo255(GetRandomReal(20, 50)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(1, 1.5))
            call Effect("war3mapimported\\CF2.mdx", GetUnitX(t), GetUnitY(t), 50, a + GetRandomReal(- 40, 40), - 90, 0, GetRandomReal(0.4, 0.6), 1, 255, 255, 255, PercentTo255(GetRandomReal(20, 40)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.7))
        endif
    endif
    if count == 150 or count == 160 or count == 170 or count == 180 or count == 190 or count == 200 or count == 210 or count == 220 or count == 230 or count == 250 or count == 270 or count == 290 or count == 360 then
        call Effect("war3mapimported\\wind4.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 0.85, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        set x = PolarX(GetUnitX(t), 75, a)
        set y = PolarY(GetUnitY(t), 75, a)
        call Effect("war3mapimported\\az-zidan.mdx", x, y, 100, a + GetRandomReal(- 40, 40), 0, 0, 2, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3)
        call Effect("war3mapimported\\qqqqqr.mdx", x, y, 100, a + GetRandomReal(- 40, 40), 0, 0, 2, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3)
        call Effect("war3mapimported\\CF2.mdx", GetUnitX(c), GetUnitY(c), 50, a, 0, 0, 0.7, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.7))
    endif
    if count == 230 then
        call SetUnitAnimationByIndex(c, 1)
    endif
    if count == 240 or count == 280 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 2)
        call SetSpecialEffectTimeScale(e, 1.5)
        call SetSpecialEffectAnimationByIndex(e, 7)
    endif
    if count == 250 or count == 270 or count == 290 or count == 360 then
        call Effect("war3mapimported\\BY_Wood_GongChengSiPai_1.mdx", GetUnitX(t), GetUnitY(t), 50, a, - 180, 0, 3, 1, 255, 255, 255, PercentTo255(80))
        set x = PolarX(GetUnitX(t), 50, a)
        set y = PolarY(GetUnitY(t), 50, a)
        call Effect("war3mapimported\\wind3.mdx", x, y, 50, a, - 90, 0, 1.7, 1, 255, 255, 255, PercentTo255(70))
    endif
    if count == 260 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 2)
        call SetSpecialEffectAnimationByIndex(e, 2)
    endif
    if count == 300 or count == 310 or count == 320 or count == 330 or count == 340 or count == 350 or count == 360 then
        call Effect("war3mapimported\\HakenSaber2.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 0.85, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapimported\\wind4.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 0.85, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
    endif
    if count == 310 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 2)
        call SetSpecialEffectAnimationByIndex(e, 1)
        call SetSpecialEffectTimeScale(e, 0.5)
    endif
    if count == 360 then
        set x = PolarX(GetUnitX(t), 75, a)
        set y = PolarY(GetUnitY(t), 75, a)
        call Effect("war3mapimported\\az_hitheavy.mdx", x, y, 100, a, 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapimported\\AZ_hit-red.mdx", x, y, 100, a, 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
    endif
    if count == 365 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (6 + 2 * GetUnitAbilityLevel(c, 'A0FB')) * GetHeroAgi(c, true))
        call knockbackUnit(t, 600, a, 0.6)
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

function Trig_DioR_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0FB' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_DioR_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_DioR takes nothing returns nothing
    set gg_trg_DioR = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_DioR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_DioR, function Trig_DioR_Actions)
endfunction