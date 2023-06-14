//TESH.scrollpos=1
//TESH.alwaysfold=0
function Trig_KenshiroT_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Kenshiro_5.mp3")
        call SetUnitAnimationByIndex(c, 28)
    endif
    if count == 70 or count == 390 then
        call SetUnitTimeScale(c, 0.01)
    endif
    if count == 90 then
        call SetUnitTimeScale(c, 1) 
    endif
    if count == 260 then
        call SetUnitTimeScale(c, 1.5) 
    endif
    if count == 600 then
        call Effect("war3mapImported\\Kira-zhendi-yellow-qiquan.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 1.75, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapImported\\AZ_hit-red.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 1.75, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6) 
        call Effect("war3mapImported\\BY_Wood_GongChengSiPai_1.mdl", GetUnitX(t), GetUnitY(t), 100, a, - 180, 0, 2.5, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75) 
        call Effect("war3mapImported\\BY_Wood_GongChengSiPai_1.mdl", GetUnitX(t), GetUnitY(t), 100, a + 180, - 180, 0, 2.5, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        call Effect("war3mapImported\\az_pafeathermoon_b.mdl", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 2, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5) 
        call Effect("war3mapImported\\az-zidan.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4) 
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
        call Effect("war3mapImported\\wind3.mdl", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1.75, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5) 
    endif
    if count <= 600 then 
        if count >= 100 and count <= 270 then 
            set x = PolarX(GetUnitX(t), 3, a)
            set y = PolarY(GetUnitY(t), 3, a)
            if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
                call SetUnitX(t, x)
                call SetUnitY(t, y)
            endif
            call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        endif
        if count >= 300 and count <= 340 then
            set x = PolarX(GetUnitX(t), 8, a)
            set y = PolarY(GetUnitY(t), 8, a)
            if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
                call SetUnitX(t, x)
                call SetUnitY(t, y)
            endif 
        endif
        if count >= 100 and count <= 270 then
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 10 then 
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(c), GetUnitY(c), 100, a, 0, 0, GetRandomReal(0.35, 0.5), 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 60)))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6)) 
                call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(c), GetUnitY(c), 100, a, 0, 0, GetRandomReal(0.75, 1.25), 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 60)))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 0.75)) 
                call Effect("war3mapImported\\WindNewFaw4.mdl", GetUnitX(c), GetUnitY(c), 100, a, 0, 0, GetRandomReal(0.75, 1), 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 60)))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6)) 
                set x = PolarX(GetUnitX(t), GetRandomReal(- 500, 500), a)
                set y = PolarY(GetUnitY(t), GetRandomReal(- 500, 500), a)
                set x = PolarX(x, GetRandomReal(- 200, 200), a + 90)
                set y = PolarY(y, GetRandomReal(- 200, 200), a + 90)
                call Effect("war3mapImported\\AZ_Jugg_E1.mdl", x, y, 100, a, 0, 0, GetRandomReal(0.75, 1), 1, 255, 255, 255, 255) 
                set x = PolarX(GetUnitX(t), GetRandomReal(- 500, 500), a)
                set y = PolarY(GetUnitY(t), GetRandomReal(- 500, 500), a)
                set x = PolarX(x, GetRandomReal(- 200, 200), a - 90)
                set y = PolarY(y, GetRandomReal(- 200, 200), a - 90)
                call Effect("war3mapImported\\AZ_Jugg_E1.mdl", x, y, 100, a, 0, 0, GetRandomReal(0.75, 1), 1, 255, 255, 255, 255) 
                set x = PolarX(GetUnitX(t), GetRandomReal(- 500, 500), a)
                set y = PolarY(GetUnitY(t), GetRandomReal(- 500, 500), a)
                set x = PolarX(x, GetRandomReal(- 200, 200), a - 90)
                set y = PolarY(y, GetRandomReal(- 200, 200), a - 90)
                call Effect("war3mapImported\\BY_Wood_GongChengSiPai_2.mdl", x, y, 100, a, - 90, 0, GetRandomReal(1.25, 1.75), 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 70))) 
                set x = PolarX(GetUnitX(t), GetRandomReal(- 500, 500), a)
                set y = PolarY(GetUnitY(t), GetRandomReal(- 500, 500), a)
                set x = PolarX(x, GetRandomReal(- 200, 200), a + 90)
                set y = PolarY(y, GetRandomReal(- 200, 200), a + 90)
                call Effect("war3mapImported\\BY_Wood_GongChengSiPai_2.mdl", x, y, 100, a, - 90, 0, GetRandomReal(1.25, 1.75), 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 70))) 
                set x = PolarX(GetUnitX(t), GetRandomReal(- 500, 500), a)
                set y = PolarY(GetUnitY(t), GetRandomReal(- 500, 500), a)
                set x = PolarX(x, GetRandomReal(- 200, 200), a + 90)
                set y = PolarY(y, GetRandomReal(- 200, 200), a + 90)
                call Effect("war3mapImported\\qqqqqr.mdl", x, y, 100, a, 0, 0, GetRandomReal(1.5, 1.75), 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6))
                set x = PolarX(GetUnitX(t), GetRandomReal(- 500, 500), a)
                set y = PolarY(GetUnitY(t), GetRandomReal(- 500, 500), a)
                set x = PolarX(x, GetRandomReal(- 200, 200), a - 90)
                set y = PolarY(y, GetRandomReal(- 200, 200), a - 90)
                call Effect("war3mapImported\\az-zidan.mdl", x, y, 100, a, 0, 0, GetRandomReal(1.5, 1.75), 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6))
                call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
                set x = PolarX(GetUnitX(t), GetRandomReal(- 500, 500), a)
                set y = PolarY(GetUnitY(t), GetRandomReal(- 500, 500), a)
                set x = PolarX(x, GetRandomReal(- 200, 200), a - 90)
                set y = PolarY(y, GetRandomReal(- 200, 200), a - 90)
                call Effect("war3mapImported\\Kira-zhendi-yellow-qiquan.mdl", x, y, 100, a, 0, 0, GetRandomReal(1.5, 2), 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6))
                set x = PolarX(GetUnitX(t), GetRandomReal(- 500, 500), a)
                set y = PolarY(GetUnitY(t), GetRandomReal(- 500, 500), a)
                set x = PolarX(x, GetRandomReal(- 200, 200), a + 90)
                set y = PolarY(y, GetRandomReal(- 200, 200), a + 90)
                call Effect("war3mapImported\\Kira-zhendi-yellow-qiquan.mdl", x, y, 100, a, 0, 0, GetRandomReal(1.5, 2), 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6))
            endif
        endif
    endif
    if count == 600 then 
        call Effect("war3mapImported\\hit-blood-special.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5) 
        call Effect("war3mapImported\\jin xia.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5) 
        call Effect("war3mapImported\\red-blood-ball.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        call Effect("war3mapImported\\blood-rou.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.25, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
    endif
    if count == 610 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 15 * GetHeroStr(c, true))
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
endfunction

function Trig_KenshiroT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A069' then 
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
        call TimerStart(z, 0.02, true, function Trig_KenshiroT_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_KenshiroT takes nothing returns nothing
    set gg_trg_KenshiroT = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_KenshiroT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_KenshiroT, function Trig_KenshiroT_Actions )
endfunction