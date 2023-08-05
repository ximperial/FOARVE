//TESH.scrollpos=33
//TESH.alwaysfold=0
function Trig_DioT_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x = LoadReal(ht, GetHandleId(z), 0)
    local real y = LoadReal(ht, GetHandleId(z), 1)
    local real x1
    local real y1
    local real a = Angle(GetUnitX(c), GetUnitY(c), x, y)
    local real a2
    local integer i = 0
    local real dist = Distance(GetUnitX(c), GetUnitY(c), x, y)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Dio_5.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 18, GetUnitX(c), GetUnitY(c))
        call SetUnitScale(c, 1.8, 1.8, 1.8)
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call SetUnitAnimationByIndex(c, 7)
        call GroupEnumUnitsInRange(gGroup, x, y, 700, null)
        loop 
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then 
                call lockUnit(gUnit, 1, true)
            endif 
        endloop
        call GroupClear(gGroup)
    endif
    if count <= 40 then
        if dist > 70 then
            set x1 = PolarX(GetUnitX(c), dist / 15, a)
            set y1 = PolarY(GetUnitY(c), dist / 15, a)
            if not IsTerrainPathable(x1, y1, PATHING_TYPE_FLYABILITY) then
                call SetUnitX(c, x1)
                call SetUnitY(c, y1)
            endif
        else
            set x1 = PolarX(x, - 50, a)
            set y1 = PolarY(y, - 50, a)
            if not IsTerrainPathable(x1, y1, PATHING_TYPE_FLYABILITY) then
                call SetUnitX(c, x1)
                call SetUnitY(c, y1)
            endif
        endif
    endif
    if count == 40 then
        call SetUnitAnimationByIndex(c, 8)
        call SetUnitFlyHeight(c, 1200, 0)
    endif
    if count >= 40 and count <= 140 then
        call SetUnitFlyHeight(c, GetUnitFlyHeight(c) - 12, 0)
    endif
    if count == 40 or count == 50 or count == 60 or count == 70 or count == 80 or count == 90 or count == 100 or count == 110 or count == 120 or count == 130 then
        call Effect("war3mapImported\\wind4.mdx", GetUnitX(c), GetUnitY(c), - 200, a, 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3)
        call Effect("war3mapImported\\wind3.mdl", GetUnitX(c), GetUnitY(c), - 200, a, 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(40))
    endif
    if count == 140 then
        call SetUnitFlyHeight(c, 0, 0)
        call SetUnitAnimationByIndex(c, 14)
        set x1 = PolarX(GetUnitX(c), 250, a)
        set y1 = PolarY(GetUnitY(c), 250, a)
        call Effect("war3mapImported\\BY_Wood_GongChengSiPai_6.mdx", x1, y1, 25, a, 0, 0, 1.75, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapImported\\wind4.mdx", x1, y1, 50, a, 0, 0, 1.2, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3)
        call Effect("war3mapImported\\wind3.mdx", x1, y1, 50, a, 0, 0, 1.65, 1, 255, 255, 255, PercentTo255(40))
        call Effect("war3mapImported\\[A]Sand3.mdx", x1, y1, 200, a, 0, 0, 1.25, 1, 255, 255, 255, PercentTo255(20))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapImported\\wind4.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3)
        call Effect("war3mapImported\\wind3.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 3.5, 1, 255, 255, 255, PercentTo255(40))
        set i = 1
        loop
            exitwhen i > 18
            set x1 = PolarX(GetUnitX(c), 650, i * 20)
            set y1 = PolarY(GetUnitY(c), 650, i * 20)
            set a2 = Angle(x1, y1, GetUnitX(c), GetUnitY(c))
            call Effect("war3mapImported\\nitu.mdx", x1, y1, 150, a2, 0, 0, 1.75, 1, 255, 255, 255, PercentTo255(20))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            set x1 = PolarX(GetUnitX(c), 500, i * 20)
            set y1 = PolarY(GetUnitY(c), 500, i * 20)
            set a2 = Angle(x1, y1, GetUnitX(c), GetUnitY(c))
            call Effect("war3mapImported\\nitu.mdx", x1, y1, 150, a2, 0, 0, 1.3, 1, 255, 255, 255, PercentTo255(20))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            set x1 = PolarX(GetUnitX(c), 350, i * 20)
            set y1 = PolarY(GetUnitY(c), 350, i * 20)
            set a2 = Angle(x1, y1, GetUnitX(c), GetUnitY(c))
            call Effect("war3mapImported\\nitu.mdx", x1, y1, 150, a2, 0, 0, 1, 1, 255, 255, 255, PercentTo255(20))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            set i = i + 1
        endloop
    endif
    if count >= 140 and count <= 850 then
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c), GetUnitY(c), 600, null)
        loop 
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then 
                if count >= 330 and count <= 650 then
                    call DamageUnit(c, gUnit, 10 * GetHeroAgi(c, true) / 320)
                endif
                call IssueImmediateOrderById(gUnit, 851972)
            endif 
        endloop
        call GroupClear(gGroup)
    endif
    if count == 155 then
        set x1 = PolarX(GetUnitX(c), - 250, a)
        set y1 = PolarY(GetUnitY(c), - 250, a)
        call Effect("war3mapImported\\wind4.mdx", x1, y1, 50, a, 0, 0, 3.5, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3)
        call Effect("war3mapImported\\wind3.mdx", x1, y1, 50, a, 0, 0, 1.65, 1, 255, 255, 255, PercentTo255(40))
        call Effect("war3mapImported\\BY_Wood_GongChengSiPai_6.mdx", x1, y1, 50, a, 0, 0, 2.25, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapImported\\[A]Sand2.mdx", x1, y1, 50, a, 0, 0, 1.75, 1, 255, 255, 255, PercentTo255(20))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call SetUnitTimeScale(c, 0.01)
    endif
    if count == 200 then
        call SoundStart("war3mapImported\\Dio_5-1.mp3")
        call SetUnitTimeScale(c, 0.5)
    endif
    if count == 235 then
        set x1 = PolarX(GetUnitX(c), 250, a)
        set y1 = PolarY(GetUnitY(c), 250, a)
        call Effect("war3mapImported\\wind4.mdx", x1, y1, 200, a, 0, 0, 0.8, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapImported\\wind3.mdx", x1, y1, 200, a, 0, 0, 1.1, 1, 255, 255, 255, PercentTo255(40))
        call Effect("war3mapImported\\BY_Wood_GongChengSiPai_1.mdx", x1, y1, 200, a, - 90, 0, 2.5, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
    endif
    if count == 330 then
        call SetUnitTimeScale(c, 1)
        call SetUnitAnimationByIndex(c, 11)
    endif
    if count >= 330 and count <= 650 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator == 5 or iterator == 10 then
            set x1 = PolarX(GetUnitX(c), GetRandomReal(150, 450), a)
            set y1 = PolarY(GetUnitY(c), GetRandomReal(150, 450), a)
            set x1 = PolarX(x1, GetRandomReal(- 250, 250), a + 90)
            set y1 = PolarY(y1, GetRandomReal(- 250, 250), a + 90)
            call Effect("war3mapImported\\BY_Wood_GongChengSiPai_1.mdx", x1, y1, 200, a, - 90, 0, GetRandomReal(0.75, 1.7), 1, 255, 255, 255, PercentTo255(GetRandomReal(60, 80)))
            set x1 = PolarX(GetUnitX(c), GetRandomReal(150, 450), a)
            set y1 = PolarY(GetUnitY(c), GetRandomReal(150, 450), a)
            set x1 = PolarX(x1, GetRandomReal(- 250, 250), a - 90)
            set y1 = PolarY(y1, GetRandomReal(- 250, 250), a - 90)
            call Effect("war3mapImported\\BY_Wood_GongChengSiPai_1.mdx", x1, y1, 200, a, - 90, 0, GetRandomReal(0.75, 1.7), 1, 255, 255, 255, PercentTo255(GetRandomReal(60, 80)))
            set x1 = PolarX(GetUnitX(c), GetRandomReal(150, 450), a)
            set y1 = PolarY(GetUnitY(c), GetRandomReal(150, 450), a)
            set x1 = PolarX(x1, GetRandomReal(- 250, 250), a + 90)
            set y1 = PolarY(y1, GetRandomReal(- 250, 250), a + 90)
            call Effect("war3mapImported\\BY_Wood_GongChengSiPai_2.mdx", x1, y1, 200, a, 0, 0, GetRandomReal(0.75, 1.7), 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 70)))
            set x1 = PolarX(GetUnitX(c), GetRandomReal(150, 450), a)
            set y1 = PolarY(GetUnitY(c), GetRandomReal(150, 450), a)
            set x1 = PolarX(x1, GetRandomReal(- 250, 250), a - 90)
            set y1 = PolarY(y1, GetRandomReal(- 250, 250), a - 90)
            call Effect("war3mapImported\\BY_Wood_GongChengSiPai_2.mdx", x1, y1, 200, a, 0, 0, GetRandomReal(0.75, 1.7), 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 70)))
            if iterator == 10 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                set x1 = PolarX(GetUnitX(c), 300, a)
                set y1 = PolarY(GetUnitY(c), 300, a)
                call Effect("war3mapImported\\[A]sandpoff123.mdx", x1, y1, 25, a, 0, 0, GetRandomReal(1.6, 1.9), 1, 255, 255, 255, PercentTo255(60))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
                set x1 = PolarX(GetUnitX(c), 250, a)
                set y1 = PolarY(GetUnitY(c), 250, a)
                call Effect("war3mapImported\\wind4.mdx", x1, y1, 50, a, 0, 0, 1.25, 1, 255, 255, 255, PercentTo255(40))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.3, 0.5))
                set x1 = PolarX(GetUnitX(c), 250, a)
                set y1 = PolarY(GetUnitY(c), 250, a)
                call Effect("war3mapImported\\wind3.mdx", x1, y1, 50, a, 0, 0, 1.8, 1, 255, 255, 255, PercentTo255(40))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.7, 1))
                set x1 = PolarX(GetUnitX(c), GetRandomReal(150, 450), a)
                set y1 = PolarY(GetUnitY(c), GetRandomReal(150, 450), a)
                set x1 = PolarX(x1, GetRandomReal(200, 500), a + 90)
                set y1 = PolarY(y1, GetRandomReal(200, 500), a + 90)
                call Effect("war3mapImported\\[DoFT]DioBoom.mdx", x1, y1, 350, a, 0, 0, GetRandomReal(1, 1.75), 1, 255, 255, 255, 255)
                set x1 = PolarX(GetUnitX(c), GetRandomReal(150, 450), a)
                set y1 = PolarY(GetUnitY(c), GetRandomReal(150, 450), a)
                set x1 = PolarX(x1, GetRandomReal(200, 500), a - 90)
                set y1 = PolarY(y1, GetRandomReal(200, 500), a - 90)
                call Effect("war3mapImported\\[DoFT]DioBoom.mdx", x1, y1, 350, a, 0, 0, GetRandomReal(1, 1.75), 1, 255, 255, 255, 255)
                set x1 = PolarX(GetUnitX(c), GetRandomReal(550, 750), a)
                set y1 = PolarY(GetUnitY(c), GetRandomReal(550, 750), a)
                set x1 = PolarX(x1, GetRandomReal(- 500, 500), a + 90)
                set y1 = PolarY(y1, GetRandomReal(- 500, 500), a + 90)
                call Effect("war3mapImported\\[DoFT]DioBoom.mdx", x1, y1, 350, a, 0, 0, GetRandomReal(1, 1.75), 1, 255, 255, 255, 255)
            endif
        endif
    endif
    if count == 480 then
        call SoundStart("war3mapImported\\Dio_5-2.mp3")
    endif
    if count == 650 then
        call SetUnitAnimationByIndex(c, 9)
        set iterator = 0
        call SaveInteger(ht, GetHandleId(z), 1, 0)
    endif
    if count >= 650 and count <= 850 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 10 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            set x1 = PolarX(GetUnitX(c), 250, a)
            set y1 = PolarY(GetUnitY(c), 250, a)
            call Effect("war3mapImported\\wind4.mdx", x1, y1, 50, a, 0, 0, 1.2, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.3, 0.5))
            set x1 = PolarX(GetUnitX(c), 250, a)
            set y1 = PolarY(GetUnitY(c), 250, a)
            call Effect("war3mapImported\\wind3.mdx", x1, y1, 50, a, 0, 0, 1.65, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.7, 1))
        endif
    endif
    if count == 670 then
        call SetUnitTimeScale(c, 0.01)
    endif
    if count == 830 then
        call SetUnitTimeScale(c, 1)
    endif
    if count == 840 then
        set x1 = PolarX(GetUnitX(c), 250, a)
        set y1 = PolarY(GetUnitY(c), 250, a)
        call Effect("war3mapImported\\az-zidan.mdx", x1, y1, 250, a, 0, 0, 2.4, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3)
        set x1 = PolarX(GetUnitX(c), 250, a)
        set y1 = PolarY(GetUnitY(c), 250, a)
        call Effect("war3mapImported\\qqqqqr.mdx", x1, y1, 250, a, 0, 0, 2.4, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3)
        set x1 = PolarX(GetUnitX(c), 250, a)
        set y1 = PolarY(GetUnitY(c), 250, a)
        call Effect("war3mapImported\\wind4.mdx", x1, y1, 250, a, 0, 0, 1.2, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        set x1 = PolarX(GetUnitX(c), 250, a)
        set y1 = PolarY(GetUnitY(c), 250, a)
        call Effect("war3mapImported\\wind3.mdx", x1, y1, 250, a, 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(40))
        set x1 = PolarX(GetUnitX(c), 250, a)
        set y1 = PolarY(GetUnitY(c), 250, a)
        call Effect("war3mapImported\\BY_Wood_GongChengSiPai_1.mdx", x1, y1, 250, a, - 90, 0, 3.5, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        set x1 = PolarX(GetUnitX(c), 250, a)
        set y1 = PolarY(GetUnitY(c), 250, a)
        call Effect("war3mapImported\\[A]Sand2.mdx", x1, y1, 25, a, 0, 0, 1.25, 1, 255, 255, 255, PercentTo255(20))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        set x1 = PolarX(GetUnitX(c), 250, a)
        set y1 = PolarY(GetUnitY(c), 250, a)
        call Effect("war3mapImported\\BY_Wood_GongChengSiPai_6.mdx", x1, y1, 25, a, 0, 0, 1.75, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        set x1 = PolarX(GetUnitX(c), 250, a)
        set y1 = PolarY(GetUnitY(c), 250, a)
        call Effect("war3mapImported\\by_wood_effect_yuzhiboyou_unusual_fenshendabaopo_2.mdx", x1, y1, 25, a, 0, 0, 4, 2, 255, 255, 255, PercentTo255(90))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.35)
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c), GetUnitY(c), 800, null)
        loop 
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then 
                call DamageUnit(c, gUnit, 10 * GetHeroAgi(c, true))
            endif 
        endloop
        call GroupClear(gGroup)
    endif
    if count == 850 then
        call SetUnitAnimationByIndex(c, 12)
    endif
    if count == 870 then
        call SetUnitScale(c, 1.3, 1.3, 1.3)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
        call IssueImmediateOrderById(c, 851972)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
endfunction

function Trig_DioT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real x = GetSpellTargetX()
    local real y = GetSpellTargetY()
    if GetSpellAbilityId() == 'A0FC' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveReal(ht, GetHandleId(z), 0, x)
        call SaveReal(ht, GetHandleId(z), 1, y)
        call TimerStart(z, 0.02, true, function Trig_DioT_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_DioT takes nothing returns nothing
    set gg_trg_DioT = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_DioT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_DioT, function Trig_DioT_Actions )
endfunction