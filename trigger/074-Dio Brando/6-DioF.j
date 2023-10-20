//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_DioF_Func002 takes nothing returns nothing
    call SetUnitTimeScale(GetEnumUnit(), 1)
    call PauseUnit(GetEnumUnit(), false)
endfunction

function Trig_DioF_Func001 takes nothing returns nothing
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
    local group g = LoadGroupHandle(ht, GetHandleId(z), 2)
    local effect e
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
        call SoundStart("war3mapImported\\Dio_6.mp3")
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call SetUnitAnimationByIndex(c, 10)
        call SetUnitTimeScale(c, 0.5)
        call Effect("war3mapimported\\[A]NatsuFire2.mdx", GetUnitX(c), GetUnitY(c), 0, a, 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(10))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call SaveEffectHandle(ht, GetHandleId(z), 3, bj_lastCreatedEffect)
    endif
    if count == 30 then
        call SetUnitTimeScale(c, 0.01)
    endif
    if count <= 50 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 3)
        call SetUnitFlyHeight(c, GetUnitFlyHeight(c) + 10, 0)
        call SetSpecialEffectPositionEx(e, GetUnitX(c), GetUnitY(c), GetUnitZ(c))
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 10 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapimported\\wind4.mdx", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(c), a, 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3)
            call Effect("war3mapimported\\wind3.mdx", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(c), a, 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 1))
        endif
    endif
    if count == 100 then
        call SetUnitTimeScale(c, 1)
    endif
    if count == 110 then
        call Effect("war3mapimported\\cronosphere.mdx", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(c) + 10, a, 0, 0, 0.035, 8, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 3)
        call SaveEffectHandle(ht, GetHandleId(z), 4, bj_lastCreatedEffect)
        call Effect("war3mapimported\\cronosphere.mdx", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(c) + 10, a, 0, 0, 0.035, 2.8, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 3)
        call SaveEffectHandle(ht, GetHandleId(z), 5, bj_lastCreatedEffect)
        call Effect("war3mapimported\\cronosphere.mdx", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(c) + 10, a, 0, 0, 0.035, 2.8, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 3)
        call SaveEffectHandle(ht, GetHandleId(z), 6, bj_lastCreatedEffect)
        call Effect("war3mapimported\\cronosphere.mdx", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(c) + 10, a, 0, 0, 0.035, 2.8, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 3)
        call SaveEffectHandle(ht, GetHandleId(z), 7, bj_lastCreatedEffect)
    endif
    if count >= 110 and count <= 200 then
        loop
            exitwhen i > 3
            set e = LoadEffectHandle(ht, GetHandleId(z), 4 + i)
            call SetSpecialEffectVertexColour(e, PercentTo255(GetRandomReal(40, 80)), PercentTo255(GetRandomReal(40, 80)), PercentTo255(GetRandomReal(40, 80)), PercentTo255(GetRandomReal(80, 90)))
            call SetSpecialEffectScale(e, GetSpecialEffectScale(e) + 0.0385 - 0.01 * i)
            set i = i + 1
        endloop
    endif
    if count >= 110 and count <= 460 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 4)
        if count <= 175 then
            call GroupEnumUnitsInRange(gGroup, GetEffectX(e), GetEffectY(e), (count - 110) * 20, null)
            call GroupRemoveUnit(gGroup, c)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if IsUnitAlive(gUnit) and not IsUnitInvulnerable(gUnit) then
                    call PauseUnit(gUnit, true)
                    if not IsUnitInGroup(gUnit, g) then
                        call SetUnitTimeScale(gUnit, 0)
                        call GroupAddUnit(g, gUnit)
                    endif
                endif
            endloop
            call GroupClear(gGroup)
        else
            call GroupEnumUnitsInRange(gGroup, GetEffectX(e), GetEffectY(e), 1300, null)
            call GroupRemoveUnit(gGroup, c)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if IsUnitAlive(gUnit) and not IsUnitInvulnerable(gUnit) then
                    call PauseUnit(gUnit, true)
                    if not IsUnitInGroup(gUnit, g) then
                        call SetUnitTimeScale(gUnit, 0)
                        call GroupAddUnit(g, gUnit)
                    endif
                endif
            endloop
            call GroupClear(gGroup)
        endif
    endif
    if count >= 150 and count <= 200 then
        call SetUnitFlyHeight(c, GetUnitFlyHeight(c) - 10, 0)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 10 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapimported\\wind4.mdx", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(c), a, 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3)
            call Effect("war3mapimported\\wind3.mdx", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(c), a, 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 1))
        endif
    endif
    if count == 200 then
        call SoundStart("war3mapImported\\Dio_6-1.mp3")
        call SetUnitAnimationByIndex(c, 1)
        call SetUnitTimeScale(c, 1)
        call Effect("war3mapimported\\az_pafeathermoon_b.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapimported\\BY_Wood_Effect_YuanBanLin_Sand2.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapimported\\wind4.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 0.85, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapimported\\HakenSaber2.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 0.85, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        set i = 0
        loop
            exitwhen i > 2
            set e = LoadEffectHandle(ht, GetHandleId(z), 5 + i)
            call SetSpecialEffectAnimationByIndex(e, 1)
            set i = i + 1
        endloop
    endif
    if count >= 200 and count <= 500 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 10 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapimported\\wind4.mdx", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(c), a, 0, 0, GetRandomReal(0.8, 1.3), 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 80)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 1))
        endif
    endif
    if count == 335 then
        call SoundStart("war3mapImported\\Dio_6-2.mp3")
        call Effect("war3mapimported\\dioword.mdx", GetUnitX(c), GetUnitY(c), 0, a, 0, 0, 1, 2.5, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 6)
        call SaveEffectHandle(ht, GetHandleId(z), 8, bj_lastCreatedEffect)
        set x = PolarX(GetUnitX(c), 50, a)
        set y = PolarY(GetUnitY(c), 50, a)
        call Effect("war3mapimported\\wind3.mdx", x, y, 75, a, - 90, 0, 1.25, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.4)
    endif
    if count >= 335 and count <= 350 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 8)
        call SetSpecialEffectVertexColour(e, 255, 255, 255, PercentTo255(20 + (count - 335) * 3.2))
    endif
    if count >= 335 and count <= 360 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 8)
        set dist = Distance(GetEffectX(e) , GetEffectY(e) , GetUnitX(t) , GetUnitY(t))
        if dist > 140 then
            set x = PolarX(GetEffectX(e), dist / 15, a)
            set y = PolarY(GetEffectY(e), dist / 15, a)
            call SetSpecialEffectPositionEx(e, x, y, GetAxisZ(x, y))
        else
            set x = PolarX(GetUnitX(t), 5, a)
            set y = PolarY(GetUnitY(t), 5, a)
            if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
                call SetUnitX(t, x)
                call SetUnitY(t, y)
            endif
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetSpecialEffectPositionEx(e, x, y, GetAxisZ(x, y))
        endif
    endif
    if count == 340 or count == 345 or count == 350 or count == 355 or count == 360 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 8)
        set x = PolarX(GetEffectX(e), 50, a)
        set y = PolarY(GetEffectY(e), 50, a)
        call Effect("war3mapimported\\wind3.mdx", x, y, 75, a, - 90, 0, 1, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
    endif
    if count == 345 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 8)
        call SetSpecialEffectAnimationByIndex(e, 5)
    endif
    if count == 360 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 8)
        call SetSpecialEffectAnimationByIndex(e, 7)
        call SetSpecialEffectTimeScale(e, 0.4)
    endif
    if count == 380 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 8)
        call Effect("war3mapimported\\dash sfx.mdx", GetEffectX(e), GetEffectY(e), 25, a, 0, 0, 0.65, 1, 255, 255, 255, PercentTo255(40))
        call Effect("war3mapimported\\chongfeng2.mdx", GetEffectX(e), GetEffectY(e), 25, a, 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        set x = PolarX(GetEffectX(e), 50, a)
        set y = PolarY(GetEffectY(e), 50, a)
        call Effect("war3mapimported\\wind4.mdx", x, y, 75, a, - 90, 0, 1, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
    endif
    if count == 385 then
        call SoundStart("war3mapImported\\Dio_6-3.mp3")
    endif
    if count == 400 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 8)
        set x = PolarX(GetUnitX(t), 50, a)
        set y = PolarY(GetUnitY(t), 50, a)
        call Effect("war3mapimported\\blood-rou.mdx", x, y, 100, a, - 90, 0, 1.25, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.2)
        call Effect("war3mapimported\\File00003933.mdx", x, y, 100, a, - 90, 0, 1.75, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapimported\\bloodex1.mdx", x, y, 100, a, - 90, 0, 1.75, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapimported\\wind3.mdx", x, y, 75, a, - 90, 0, 1.25, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.4)
        set x = PolarX(GetEffectX(e), 20, a)
        set y = PolarY(GetEffectY(e), 20, a)
        call Effect("war3mapimported\\CF2.mdx", x, y, 50, a, 0, 0, 0.7, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        set x = PolarX(GetUnitX(t), 50, a)
        set y = PolarY(GetUnitY(t), 50, a)
        call Effect("war3mapimported\\[A]dustexplosion.mdx", x, y, 100, a, - 90, 0, 12, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapimported\\az-zidan.mdx", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2.4, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3)
        call Effect("war3mapimported\\qqqqqr.mdx", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2.4, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3)
    endif
    if count == 405 or count == 410 or count == 415 or count == 420 or count == 425 or count == 430 or count == 435 then
        set x = PolarX(GetUnitX(t), (count - 400) * 20, a)
        set y = PolarY(GetUnitY(t), (count - 400) * 20, a)
        call Effect("war3mapimported\\File00003933.mdx", x, y, 100, a, - 90, 0, 1.75, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
    endif
    if count == 420 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 8)
        call SetSpecialEffectTimeScale(e, 0.01)
    endif
    if count == 460 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 8)
        call SetSpecialEffectTimeScale(e, 1)
        set e = LoadEffectHandle(ht, GetHandleId(z), 4)
        call SetSpecialEffectAnimationByIndex(e, 1)
        call ForGroup(g, function Trig_DioF_Func002)
        call DestroyGroup(g)
    endif
    if count == 470 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 11 * GetHeroAgi(c, true))
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
    set g = null
    set e = null
endfunction

function Trig_DioF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0FD' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveGroupHandle(ht, GetHandleId(z), 2, CreateGroup())
        call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
        call TimerStart(z, 0.02, true, function Trig_DioF_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_DioF takes nothing returns nothing
    set gg_trg_DioF = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_DioF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_DioF, function Trig_DioF_Actions)
endfunction