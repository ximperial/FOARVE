scope hibikispell initializer init
   
    private function period1 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local real x = LoadReal(ht, zid, 0)
        local real y = LoadReal(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Hibiki_1.mp3")
            call ShakeCamera(1, GetOwningPlayer(u), 10)
            call SetUnitAnimationByIndex(u, 14)
            call SetUnitTimeScale(u, 2)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Dus_Kuosan_1_2_2.mdl", GetUnitX(u), GetUnitY(u), 0, GetUnitFacing(u), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\blackblink.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count == 10 then
            call SoundStart("war3mapImported\\Allmight_1-1.mp3")
            call SetUnitXY(u, x, y, 1)
            call Effect("war3mapImported\\HibikiQ.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\earthdetonation.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Eat_DiBanZhaKai.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
            call Effect("war3mapImported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_1_2_2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\Dls1.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 500, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) then
                    call DamageUnit(u, gUnit, 100 * GetUnitAbilityLevel(u, 'A0K4'))
                endif
            endloop
            call GroupClear(gGroup)
            call SetUnitTimeScale(u, 1)
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call PauseUnit(u, false)
            call IssueImmediateOrderById(u, 851972)
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
    endfunction
   
    private function period2 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local unit t = LoadUnitHandle(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y

        set count = count + 1 
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Hibiki_2.mp3")
            call SetUnitAnimationByIndex(u, 3)
        endif
        if count == 1 or count == 10 or count == 20 or count == 30 or count == 40 or count == 50 or count == 60 or count == 70 or count == 80 then
            call Effect("war3mapImported\\dustwaveanimate2.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(0.75, 1.5), 1, PercentTo255(GetRandomReal(80, 90)), PercentTo255(GetRandomReal(80, 90)), PercentTo255(GetRandomReal(30, 40)), 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1))
            call Effect("war3mapImported\\dustwaveanimate2.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1, 2), 1, PercentTo255(GetRandomReal(80, 90)), PercentTo255(GetRandomReal(80, 90)), PercentTo255(GetRandomReal(30, 40)), 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1))
        endif
        if count == 15 or count == 25 or count == 35 or count == 45 or count == 55 or count == 65 or count == 75 then
            call Effect("war3mapImported\\[A]supershinythingyGon.mdx", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, GetRandomReal(1, 2), 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1))
        endif
        if count == 90 or count == 100 or count == 110 then
            call Effect("war3mapImported\\Chongfengnew.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\punchshot.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 0.6, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\a_new_k3.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 0.9, 1, 255, 255, 255, 255)
        endif
        if count == 80 then
            call SetUnitAnimationByIndex(u, 5)
            call SetUnitTimeScale(u, 0.8)
        endif
        if count >= 80 and count <= 120 then
            if dist > 140 then
                set x = PolarX(GetUnitX(u), dist / 25, a)
                set y = PolarY(GetUnitY(u), dist / 25, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif
        endif
        if count == 120 then
            call ShakeCamera(1, GetOwningPlayer(u), 10)
            call ShakeCamera(1, GetOwningPlayer(t), 10)
            call Effect("war3mapImported\\HibikiQ.mdx", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 4, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\zxd1.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.4, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            set x = PolarX(GetUnitX(t), - 50, a)
            set y = PolarY(GetUnitY(t), - 50, a)
            call Effect("war3mapImported\\dls2.mdx", x, y, 100, a, - 90, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count == 125 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1 + GetUnitAbilityLevel(u, 'A0K5')) * GetHeroAgi(u, true))
            call knockbackUnit(t, 600, a, 0.6)
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(t), GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set t = null
    endfunction

    private function period3 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local unit t = LoadUnitHandle(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y
        local integer i

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, zid, - 1) + 1000 then 
            call SaveReal(ht, zid, - 1, GetUnitState(t, UNIT_STATE_LIFE))
        elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, zid, - 1) then
            call SaveReal(ht, zid, - 1, GetUnitState(t, UNIT_STATE_LIFE))
        endif
        call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, zid, - 1))
        if count == 1 then
            call SoundStart("war3mapImported\\Hibiki_4.mp3")
            call SaveReal(ht, zid, 0, GetUnitX(u))
            call SaveReal(ht, zid, 1, GetUnitY(u))
            set x = PolarX(GetUnitX(t), - 400, a)
            set y = PolarY(GetUnitY(t), - 400, a)
            call SetUnitXY(u, x, y, 0) 
        endif
        if count == 275 then
            call Effect("war3mapImported\\Light4.mdx", GetUnitX(u), GetUnitY(u), 300, randomAngle(), 0, 0, 4, 2, 255, 242, 46, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        endif
        if count == 340 then
            call Effect("war3mapImported\\HibikiR1.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 3.5, 19, 255, 242, 46, 255)
            call SetUnitAnimationByIndex(u, 20)
        endif
        if count >= 400 and count <= 1250 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\ChargeWhite.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 242, 46, 255)
            endif
        endif
        if count >= 500 and count <= 1230 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 40 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\Light2.mdx", GetUnitX(u), GetUnitY(u), 800, randomAngle(), 0, 0, 2, 1.5, 255, 242, 46, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
                call Effect("war3mapImported\\Light4.mdx", GetUnitX(u), GetUnitY(u), 300, randomAngle(), 0, 0, 5, 1.5, 255, 242, 46, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            endif
        endif
        if count == 1200 then
            call SetUnitAnimationByIndex(u, 24)
        endif
        if count == 1250 then
            call Effect("war3mapImported\\[A]HibikiSlam.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 6, 2, 255, 242, 46, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.5)
            set i = 1
            loop
                exitwhen i > 4
                set x = PolarX(GetUnitX(u), 250 * i, a)
                set y = PolarY(GetUnitY(u), 250 * i, a)
                call Effect("war3mapImported\\HibikiR2.mdx", x, y, 0, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
                call Effect("war3mapImported\\HibikiR3.mdx", x, y, 0, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
                set i = i + 1
            endloop
        endif
        if count >= 1250 and count <= 1280 then
            set x = PolarX(GetUnitX(t), 5, a)
            set y = PolarY(GetUnitY(t), 5, a)
            call SetUnitXY(t, x, y, 2)
        endif
        if count == 1280 then
            set x = LoadReal(ht, zid, 0)
            set y = LoadReal(ht, zid, 1)
            call SetUnitXY(u, x, y, 0)
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (6 + 2 * GetUnitAbilityLevel(u, 'A0K7')) * GetHeroAgi(u, true))
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(t), GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set t = null
    endfunction
   
    private function period4 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local unit t = LoadUnitHandle(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y
        local real a2
        local real dmg

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, zid, - 1) + 1000 then 
            call SaveReal(ht, zid, - 1, GetUnitState(t, UNIT_STATE_LIFE))
        elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, zid, - 1) then
            call SaveReal(ht, zid, - 1, GetUnitState(t, UNIT_STATE_LIFE))
        endif
        call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, zid, - 1))
        if count == 1 then
            call SoundStart("war3mapImported\\Hibiki_5.mp3")
            call SetUnitAnimationByIndex(u, 14)
            call UnitAddAbility(t, 'Amrf')
            call UnitRemoveAbility(t, 'Amrf')
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
        endif
        if count <= 260 then
            if dist > 140 then
                set x = PolarX(GetUnitX(u), dist / 15, a)
                set y = PolarY(GetUnitY(u), dist / 15, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), 5, a)
                set y = PolarY(GetUnitY(t), 5, a)
                call SetUnitXY(t, x, y, 2)
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
                set iterator = iterator + 1
                call SaveInteger(ht, zid, 1, iterator)
                if iterator >= 5 then
                    call SaveInteger(ht, zid, 1, 0)
                    call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdx", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 1, 1, 255, 255, 255, 255)
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
                    call Effect("war3mapImported\\wind3.mdx", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1, 1.5, 255, 255, 255, PercentTo255(GetRandomReal(60, 80)))
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
                    call Effect("war3mapImported\\QQQQQ.mdx", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
                endif
            endif
        endif
        if count == 250 then
            call SetUnitAnimationByIndex(u, 5)
            call Effect("war3mapImported\\djcjb.mdl", GetUnitX(t), GetUnitY(t), 200, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Hit.mdx", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
        endif
        if count == 300 then
            call SetUnitAnimationByIndex(u, 6)
            call Effect("war3mapImported\\djcjb.mdl", GetUnitX(t), GetUnitY(t), 200, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Hit.mdx", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
        endif
        if count == 400 then
            call SetUnitAnimationByIndex(u, 5)
            call Effect("war3mapImported\\djcjb.mdl", GetUnitX(t), GetUnitY(t), 200, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Hit.mdx", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
        endif
        if count == 450 then
            call SetUnitAnimationByIndex(u, 6)
            call Effect("war3mapImported\\djcjb.mdl", GetUnitX(t), GetUnitY(t), 200, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Hit.mdx", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
        endif
        if count == 485 then
            call SetUnitAnimationByIndex(u, 5)
            call Effect("war3mapImported\\djcjb.mdl", GetUnitX(t), GetUnitY(t), 200, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Hit.mdx", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
        endif
        if count == 510 then
            call SetUnitAnimationByIndex(u, 7)
            call SetUnitFlyHeight(u, 400, 0)
            call SetUnitFlyHeight(t, 400, 0)
            call Effect("war3mapImported\\djcjb.mdl", GetUnitX(t), GetUnitY(t), 200, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Hit.mdx", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
        endif
        if count == 550 then
            call SaveReal(ht, GetHandleId(z), 0, GetUnitX(t))
            call SaveReal(ht, GetHandleId(z), 1, GetUnitY(t))
        endif
        if count >= 550 and count <= 1350 then
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator == 10 or iterator == 20 then
                if iterator == 20 then
                    call SaveInteger(ht, GetHandleId(z), 1, 0)
                    call SetUnitAnimationByIndex(u, 19)
                endif
                set x = LoadReal(ht, GetHandleId(z), 0)
                set y = LoadReal(ht, GetHandleId(z), 1)
                set a2 = randomAngle()
                set x = PolarX(x, GetRandomReal(200, 400), a2)
                set y = PolarY(y, GetRandomReal(200, 400), a2)
                call SetUnitXY(t, x, y, 1)
                set a2 = randomAngle()
                set x = PolarX(GetUnitX(t), 140, a2)
                set y = PolarY(GetUnitY(t), 140, a2)
                call SetUnitXY(u, x, y, 0)
                set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
                call SetUnitFacingEx(u, a, true)
                call Effect("war3mapImported\\djcjb.mdl", GetUnitX(t), GetUnitY(t), 400, a, 0, 0, 1, 1, 255, 255, 255, 255)
                if GetRandomInt(1, 2) == 1 then
                    call Effect("war3mapImported\\Hit.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), 0, 0, GetRandomReal(2, 3.5), 1, 0, 255, 255, 255)
                else
                    if GetRandomInt(1, 2) == 1 then
                        call Effect("war3mapImported\\Hit.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), 0, 0, GetRandomReal(2, 3.5), 1, 102, 102, 255, 255)
                    else
                        if GetRandomInt(1, 2) == 1 then
                            call Effect("war3mapImported\\Hit.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), 0, 0, GetRandomReal(2, 3.5), 1, 255, 255, 0, 255)
                        else
                            call Effect("war3mapImported\\Hit.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), 0, 0, GetRandomReal(2, 3.5), 1, 102, 102, 255, 255)
                        endif
                    endif
                endif
            endif
        endif
        if count == 1360 then
            call Effect("war3mapImported\\djcjb.mdl", GetUnitX(t), GetUnitY(t), 200, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Hit.mdx", GetUnitX(t), GetUnitY(t), 450, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
            call SetUnitAnimationByIndex(u, 5)
        endif
        if count == 1550 then
            call Effect("war3mapImported\\djcjb.mdl", GetUnitX(t), GetUnitY(t), 200, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Hit.mdx", GetUnitX(t), GetUnitY(t), 450, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
            call SetUnitAnimationByIndex(u, 5)
        endif
        if count == 1625 then
            call Effect("war3mapImported\\djcjb.mdl", GetUnitX(t), GetUnitY(t), 200, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Hit.mdx", GetUnitX(t), GetUnitY(t), 450, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
            call SetUnitAnimationByIndex(u, 5)
        endif
        if count >= 1625 and count <= 1655 then
            set x = PolarX(GetUnitX(t), 20, a)
            set y = PolarY(GetUnitY(t), 20, a)
            call SetUnitXY(t, x, y, 2)
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 400 / 30, 0) 
        endif
        if count == 1655 then
            call SetUnitFlyHeight(t, 0, 0)
            call Effect("war3mapimported\\zxd1.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\XZDL2.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call SetUnitFlyHeight(u, 0, 400 / 0.4)
        endif
        if count == 1675 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(t, false)
            set dmg = B2I(GetUnitAbilityLevel(u, 'B01J') > 0) * 2
            call DamageUnit(u, t, (dmg + 15) * GetHeroAgi(u, true))
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(t), GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set t = null
    endfunction

    private function period5 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local unit t = LoadUnitHandle(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid, 0, count) 
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, zid, - 1) + 1000 then 
            call SaveReal(ht, zid, - 1, GetUnitState(t, UNIT_STATE_LIFE))
        elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, zid, - 1) then
            call SaveReal(ht, zid, - 1, GetUnitState(t, UNIT_STATE_LIFE))
        endif
        call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, zid, - 1))
        if count == 1 then
            call SoundStart("war3mapImported\\Hibiki_6.mp3")
            call SetUnitAnimationByIndex(u, 16)
            call UnitAddAbility(t, 'Amrf')
            call UnitRemoveAbility(t, 'Amrf')
        endif
        if count <= 250 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 10 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\Dustwavevin.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(0.75, 1.4), 1, 255, 255, 255, 255)
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1))
                call Effect("war3mapImported\\Dustwavevin.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1, 1.85), 1, 255, 255, 255, 255)
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1))
                if count >= 200 then
                    call Effect("war3mapImported\\[A]supershinythingyGon.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, GetRandomReal(0.9, 1.55), 1, 255, 255, 255, 255)
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
                    call Effect("war3mapImported\\valkdustnew.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
                endif
            endif
        endif
        if count == 200 then
            call SoundStart("war3mapImported\\Hibiki_6-1.mp3")
        endif
        if count >= 200 and count <= 250 then
            if dist > 140 then 
                call SetUnitX(u, PolarX(GetUnitX(u), dist / 40, a))
                call SetUnitY(u, PolarY(GetUnitY(u), dist / 40, a))
            else
                call SetUnitX(u, PolarX(GetUnitX(t), - 120, a))
                call SetUnitY(u, PolarY(GetUnitY(t), - 120, a))
            endif 
        endif
        if count == 260 then
            call SetUnitAnimationByIndex(u, 17)
            call SoundStart("war3mapImported\\Hibiki_6-2.mp3")
            call Effect("war3mapImported\\ChuShou_BY_Wood_Effect_Wind_xuanfeng.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 3, 3, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
            set x = PolarX(GetUnitX(t), 10, randomAngle())
            set y = PolarY(GetUnitY(t), 10, randomAngle())
            call Effect("war3mapImported\\ChuShou_BY_Wood_Effect_Wind_xuanfeng.mdx", x, y, 0, randomAngle(), 0, 0, 3, 3, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 101, bj_lastCreatedEffect)
            set x = PolarX(GetUnitX(t), 20, randomAngle())
            set y = PolarY(GetUnitY(t), 20, randomAngle())
            call Effect("war3mapImported\\ChuShou_BY_Wood_Effect_Wind_xuanfeng.mdx", x, y, 0, randomAngle(), 0, 0, 3, 3, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 102, bj_lastCreatedEffect)
            set x = PolarX(GetUnitX(t), 30, randomAngle())
            set y = PolarY(GetUnitY(t), 30, randomAngle())
            call Effect("war3mapImported\\ChuShou_BY_Wood_Effect_Wind_xuanfeng.mdx", x, y, 0, randomAngle(), 0, 0, 3, 3, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 103, bj_lastCreatedEffect)
        endif
        if count >= 260 and count <= 370 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                set e = LoadEffectHandle(ht, zid, 100)
                call SetSpecialEffectVertexColour(e, PercentTo255(GetRandomReal(10, 100)), PercentTo255(GetRandomReal(10, 100)), PercentTo255(GetRandomReal(10, 100)), 255 - (count - 260))
                set e = LoadEffectHandle(ht, zid, 101)
                call SetSpecialEffectVertexColour(e, PercentTo255(GetRandomReal(10, 100)), PercentTo255(GetRandomReal(10, 100)), PercentTo255(GetRandomReal(10, 100)), 255 - (count - 260))
                set e = LoadEffectHandle(ht, zid, 102)
                call SetSpecialEffectVertexColour(e, PercentTo255(GetRandomReal(10, 100)), PercentTo255(GetRandomReal(10, 100)), PercentTo255(GetRandomReal(10, 100)), 255 - (count - 260))
                set e = LoadEffectHandle(ht, zid, 103)
                call SetSpecialEffectVertexColour(e, PercentTo255(GetRandomReal(10, 100)), PercentTo255(GetRandomReal(10, 100)), PercentTo255(GetRandomReal(10, 100)), 255 - (count - 260))
            endif
        endif
        if count >= 270 and count <= 370 then
            set e = LoadEffectHandle(ht, zid, 100)
            set x = PolarX(GetEffectX(e), 50 + (count - 270) * 2, (count - 270) * 5)
            set y = PolarY(GetEffectY(e), 50 + (count - 270) * 2, (count - 270) * 5)
            call SetUnitXY(t, x, y, 2)
            if count <= 330 then
                call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 20, 0)
            else
                call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 30, 0)
            endif
        endif
        if count == 370 then
            call SetUnitFlyHeight(t, 0, 0)
            call Effect("war3mapimported\\zxd1.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\XZDL2.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count == 380 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 11 * GetHeroAgi(u, true))
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(t), GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set t = null
        set e = null
    endfunction

    private function period6 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local unit t = LoadUnitHandle(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, zid, - 1) + 1000 then 
            call SaveReal(ht, zid, - 1, GetUnitState(t, UNIT_STATE_LIFE))
        elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, zid, - 1) then
            call SaveReal(ht, zid, - 1, GetUnitState(t, UNIT_STATE_LIFE))
        endif
        call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, zid, - 1))
        if count == 1 then
            call SoundStart("war3mapImported\\Hibiki_7.mp3")
            call SetUnitAnimationByIndex(u, 16)
            call SaveReal(ht, zid, 0, GetUnitX(u))
            call SaveReal(ht, zid, 1, GetUnitY(u))
        endif
        if count <= 225 then
            if dist > 140 then
                set x = PolarX(GetUnitX(u), dist / 15, a)
                set y = PolarY(GetUnitY(u), dist / 15, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), 5, a)
                set y = PolarY(GetUnitY(t), 5, a)
                call SetUnitXY(t, x, y, 2)
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
                set iterator = iterator + 1
                call SaveInteger(ht, zid, 1, iterator)
                if iterator >= 5 then
                    call SaveInteger(ht, zid, 1, 0)
                    call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdx", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 1, 1, 255, 242, 46, 255)
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
                    call Effect("war3mapImported\\wind3.mdx", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1.5, 1, 255, 242, 46, PercentTo255(GetRandomReal(70, 90)))
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1))
                endif
            endif
        endif
        if count == 270 then
            set x = LoadReal(ht, zid, 0)
            set y = LoadReal(ht, zid, 1)
            call SetUnitXY(u, x, y, 0)
        endif
        if count >= 270 and count <= 950 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 10 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\Dustwavevin.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(0.65, 1.5), 1.5, 255, 255, 255, 255)
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 1))
                call Effect("war3mapImported\\Dustwavevin.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1.3, 2.4), 1.5, 255, 255, 255, 255)
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 1))
                call Effect("war3mapImported\\AgusWind.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(2, 3.5), 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\[A]supershinythingyGon.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, GetRandomReal(0.8, 1.5), 1, 255, 255, 255, 255)
                if count >= 800 then
                    call Effect("war3mapImported\\[A]supershinythingyGon.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, GetRandomReal(0.9, 1.55), 1, 255, 255, 255, 255)
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
                    call Effect("war3mapImported\\valkdustnew.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
                endif
            endif
        endif
        if count == 800 then
            call SetUnitAnimationByIndex(u, 11)
        endif
        if count == 820 then
            call SetUnitTimeScale(u, 0)
        endif
        if count == 985 then
            call SetUnitTimeScale(u, 1)
        endif
        if count >= 800 and count <= 975 then
            if dist > 140 then
                set x = PolarX(GetUnitX(u), dist / 60, a)
                set y = PolarY(GetUnitY(u), dist / 60, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif
        endif
        if count == 975 then
            call Effect("war3mapimported\\SuperBigExplosion2.mdx", GetUnitX(t), GetUnitY(t), 150, a, - 90, 0, 3, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("Abilities\\Spells\\Other\\Doom\\DoomDeath.mdx", GetUnitX(t), GetUnitY(t), 150, a, - 90, 0, 2.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapimported\\[A]GonFef.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\[A]Natsu ef roar.mdx", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count == 1000 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 8 * GetHeroAgi(u, true))
            call knockbackUnit(t, 600, a, 0.6)
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(t), GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set t = null
    endfunction
   
    private function action takes nothing returns nothing
        local timer z
        local unit u = GetTriggerUnit()
        local unit t = GetSpellTargetUnit()
        local real x = GetSpellTargetX()
        local real y = GetSpellTargetY()
        local real a = Angle(GetUnitX(u), GetUnitY(u), x, y)
        local real dist = Distance(GetUnitX(u), GetUnitY(u), x, y)
        local integer abilId = GetSpellAbilityId()

        if abilId == 'A0K4' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, x)
            call SaveReal(ht, GetHandleId(z), 1, y)
            call TimerStart(z, 0.02, true, function period1)
        endif
        
        if abilId == 'A0K5' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call TimerStart(z, 0.02, true, function period2)
        endif
        
        if abilId == 'A0K6' then
            call SoundStart("war3mapImported\\Hibiki_3.mp3")
        endif
        
        if abilId == 'A0K7' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
            call TimerStart(z, 0.02, true, function period3)
        endif
        
        if abilId == 'A0K8' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
            call TimerStart(z, 0.02, true, function period4)
        endif
        
        if abilId == 'A0K9' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
            call TimerStart(z, 0.02, true, function period5)
        endif
        
        if abilId == 'A0KA' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
            call TimerStart(z, 0.02, true, function period6)
        endif
      
        set z = null
        set u = null
        set t = null
    endfunction
        
    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_SPELL_EFFECT, function action)
    endfunction
endscope