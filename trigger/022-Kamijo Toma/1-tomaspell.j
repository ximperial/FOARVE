scope tomaspell initializer init

    private function period1 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local real x = LoadReal(ht, zid, 0)
        local real y = LoadReal(ht, zid, 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), x, y)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Toma_1.mp3")
            call SetUnitAnimationByIndex(u, 3)
            call Effect("war3mapImported\\blackblink.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\zxd1.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count == 10 then
            call SoundStart("war3mapImported\\Toma_1-1.mp3")
            call ShakeCamera(0.5, GetOwningPlayer(u), 10)
            call SetUnitXY(u, x, y, 1)
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call Effect("war3mapImported\\by_wood_gongchengsipai_3.mdx", GetUnitX(u), GetUnitY(u), 250, randomAngle(), 0, 0, 3.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_3.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 0.8, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_3.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_3.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 500, null)
            loop 
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) then 
                    call DamageUnit(u, gUnit, 100 * GetUnitAbilityLevel(u, 'A0AV'))
                endif 
            endloop
            call GroupClear(gGroup)
            call SetUnitTimeScale(u, 1)
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
            call SoundStart("war3mapImported\\Toma_2.mp3")
            call SetUnitAnimationByIndex(u, 5)
            call SetUnitTimeScale(u, 2)
            call Effect("war3mapImported\\Chongfengnew.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\punchshot.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 0.6, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\a_new_k3.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 0.9, 1, 255, 255, 255, 255)
        endif
        if count == 10 then
            call Effect("war3mapImported\\Chongfengnew.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\punchshot.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 0.6, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\a_new_k3.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 0.9, 1, 255, 255, 255, 255)
        endif
        if count <= 25 then
            if dist > 140 then
                set x = PolarX(GetUnitX(u), dist / 15, a)
                set y = PolarY(GetUnitY(u), dist / 15, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif
        endif
        if count == 30 then
            call SoundStart("war3mapImported\\Toma_2-1.mp3")
            call ShakeCamera(1, GetOwningPlayer(u), 10)
            call ShakeCamera(1, GetOwningPlayer(t), 10)
            call Effect("war3mapImported\\by_wood_gongchengsipai_3.mdx", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 4, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\zxd1.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            set x = PolarX(GetUnitX(t), - 50, a)
            set y = PolarY(GetUnitY(t), - 50, a)
            call Effect("war3mapImported\\dls2.mdx", x, y, 100, a, - 90, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count == 35 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1 + GetUnitAbilityLevel(u, 'A0AW')) * GetHeroStr(u, true))
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
            call SoundStart("war3mapImported\\toma_3.mp3")
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
            set x = PolarX(GetUnitX(t), - 70, a)
            set y = PolarY(GetUnitY(t), - 70, a)
            call Effect("war3mapImported\\SZBYAFB2.mdx", x, y, 100, a, - 90, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\62.mdx", x, y, 100, a, - 90, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call ShakeCamera(0.5, GetOwningPlayer(u), 10)
            call ShakeCamera(0.5, GetOwningPlayer(u), 10)
        endif
        if count == 35 then
            call SoundStart("war3mapImported\\toma_3-1.mp3")
            call SetUnitAnimationByIndex(u, 7)
            call SetUnitTimeScale(u, 0.9)
        endif
        if count <= 60 then
            set x = PolarX(GetUnitX(t), 12, a)
            set y = PolarY(GetUnitY(t), 12, a)
            call SetUnitXY(t, x, y, 2)
            if count >= 35 then
                if dist > 140 then
                    set x = PolarX(GetUnitX(u), 2 + dist / 10, a)
                    set y = PolarY(GetUnitY(u), 2 + dist / 10, a)
                    call SetUnitXY(u, x, y, 0)
                else
                    set x = PolarX(GetUnitX(t), - 120, a)
                    set y = PolarY(GetUnitY(t), - 120, a)
                    call SetUnitXY(u, x, y, 0)
                endif
                if count <= 50 then
                    call SetUnitFlyHeight(u, GetUnitFlyHeight(u) + 10, 0)
                else
                    call SetUnitFlyHeight(u, GetUnitFlyHeight(u) - 15, 0)
                endif
            endif
        endif
        if count == 60 then
            call SoundStart("war3mapImported\\toma_3-2.mp3")
            call SetUnitFlyHeight(u, 0, 0)
            call ShakeCamera(0.5, GetOwningPlayer(u), 15)
            call ShakeCamera(0.5, GetOwningPlayer(u), 15)
            call Effect("war3mapImported\\[A]SlamWithOut.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.2, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\[A]Sand3.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.2, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\by_wood_gongchengsipai_3.mdx", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 4, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        endif
        if count == 70 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1.5 + 0.5 * GetUnitAbilityLevel(u, 'A091')) * GetHeroStr(u, true))
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
        if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, zid, - 1) + 1000 then 
            call SaveReal(ht, zid, - 1, GetUnitState(t, UNIT_STATE_LIFE))
        elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, zid, - 1) then
            call SaveReal(ht, zid, - 1, GetUnitState(t, UNIT_STATE_LIFE))
        endif
        call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, zid, - 1))
        if count == 1 then
            call SoundStart("war3mapImported\\toma_4-2.mp3")
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 5)
            call SetUnitTimeScale(u, 2)
            call Effect("war3mapImported\\Black.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 10, 255, 255, 255, PercentTo255(60))
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
            call Effect("war3mapImported\\az_airfloww12.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 10, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\az_airfloww12.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 10, 255, 255, 255, 255)
        endif
        if count == 20 then
            call SetUnitTimeScale(u, 0)
        endif
        if count <= 440 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator == 20 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\ToumaReffect.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\2953.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 0.8))
            endif
        endif
        if count == 460 then
            call SetUnitTimeScale(u, 1.75)
        endif
        if count == 470 then
            call SoundStart("war3mapImported\\Toma_4-3.mp3")
            set x = PolarX(GetUnitX(t), - 50, a)
            set y = PolarY(GetUnitY(t), - 50, a)
            call Effect("war3mapImported\\62.mdx", x, y, 100, a, - 90, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
            call Effect("war3mapImported\\AZ_DK_T2.mdx", x, y, 50, a, 0, 0, 10, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\pltx.mdx", x, y, 0, a, 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        endif
        if count == 475 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (6 + 2 * GetUnitAbilityLevel(u, 'A0AY')) * GetHeroStr(u, true))
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
            call SoundStart("war3mapImported\\Toma_5.mp3")
            call ShakeCamera(1, GetOwningPlayer(u), 10)
            call ShakeCamera(1, GetOwningPlayer(t), 10)
            call CinematicFilterGenericEx(GetOwningPlayer(u), 3, BLEND_MODE_BLEND, "war3mapImported\\tomaT.tga", 255, 255, 255, 0, 255, 255, 255, 255)
            call CinematicFilterGenericEx(GetOwningPlayer(t), 3, BLEND_MODE_BLEND, "war3mapImported\\tomaT.tga", 255, 255, 255, 0, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), - 140, a)
            set y = PolarY(GetUnitY(t), - 140, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 5)
            call Effect("war3mapImported\\shanguangbiubiu.mdl", GetUnitX(u), GetUnitY(u), 100, a, 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        endif
        if count == 25 or count == 90 then
            call SetUnitTimeScale(u, 0)
        endif
        if count == 65 then
            call SetUnitTimeScale(u, 1.75)
            set x = PolarX(GetUnitX(t), - 50, a)
            set y = PolarY(GetUnitY(t), - 50, a)
            call Effect("war3mapImported\\glowline(blue).mdl", x, y, 200, a + 90, - 90, 0, 4.5, 23, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
            call Effect("war3mapImported\\Black.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 23, 255, 255, 255, 255)
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
            call SaveEffectHandle(ht, zid, 101, bj_lastCreatedEffect)
        endif
        if count >= 65 and count <= 1255 then
            set e = LoadEffectHandle(ht, zid, 100)
            set x = PolarX(GetUnitX(t), - 50, a)
            set y = PolarY(GetUnitY(t), - 50, a)
            call SetEffectXY(e, x, y, 0)
            call SetSpecialEffectZ(e, 150 + GetAxisZ(x, y))
            if GetUnitFacing(u) != a then
                call SetUnitFacingEx(u, a, true)
                call SetSpecialEffectYaw(e, a + 90)
            endif
            set e = LoadEffectHandle(ht, zid, 101)
            set x = GetUnitX(t)
            set y = GetUnitY(t)
            call SetEffectXY(e, x, y, 0)
            call SetSpecialEffectZ(e, GetAxisZ(x, y))
        endif
        if count == 80 then
            call ShakeCamera(1, GetOwningPlayer(u), 10)
            call ShakeCamera(1, GetOwningPlayer(t), 10)
            call Effect("war3mapImported\\BY_Wood_Effect_Order_DanGe_Fgo_SuiPian_1_2.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\QQQQQ.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), - 50, a)
            set y = PolarY(GetUnitY(t), - 50, a)
            call Effect("war3mapImported\\AFB_SatomiRentaro_KuDing.mdl", x, y, 100, a, - 90, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\by_wood_gongchengsipai_3.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
        endif
        if count == 120 then
            call ShakeCamera(6.5, GetOwningPlayer(u), 15)
            call ShakeCamera(6.5, GetOwningPlayer(t), 15)
        endif
        if count >= 100 and count <= 455 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator == 5 then
                if GetRandomInt(1, 2) == 1 then
                    call SetUnitAnimationByIndex(u, 8)
                else
                    call SetUnitAnimationByIndex(u, 10)
                endif
                call SetUnitTimeScale(u, 1)
            endif
            if iterator >= 20 then
                call SaveInteger(ht, zid, 1, 0)
                set x = PolarX(GetUnitX(t), 30, a)
                set y = PolarY(GetUnitY(t), 30, a)
                call SetUnitXY(t, x, y, 2)
                set x = PolarX(GetUnitX(t), - 140, a)
                set y = PolarY(GetUnitY(t), - 140, a)
                call SetUnitXY(u, x, y, 0)
                call Effect("war3mapImported\\BY_Wood_Effect_Order_DanGe_Fgo_SuiPian_1_2.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
                call Effect("war3mapImported\\QQQQQ.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\by_wood_gongchengsipai_3.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            endif
        endif
        if count == 470 then
            call SetUnitTimeScale(u, 0.55)
            call SetUnitAnimationByIndex(u, 13)
        endif
        if count == 505 then
            call UnitAddAbility(t, 'Amrf')
            call UnitRemoveAbility(t, 'Amrf')
            call ShakeCamera(1, GetOwningPlayer(u), 10)
            call ShakeCamera(1, GetOwningPlayer(t), 10)
            call Effect("war3mapImported\\BY_Wood_Effect_Order_DanGe_Fgo_SuiPian_1_2.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\QQQQQ.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), - 50, a)
            set y = PolarY(GetUnitY(t), - 50, a)
            call Effect("war3mapImported\\AFB_SatomiRentaro_KuDing.mdl", x, y, 100, a, - 45, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\by_wood_gongchengsipai_3.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
        endif
        if count >= 505 and count <= 535 then
            set x = PolarX(GetUnitX(t), 10, a)
            set y = PolarY(GetUnitY(t), 10, a)
            call SetUnitXY(t, x, y, 2)
            if count <= 525 then
                call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 10, 0)
            else
                call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 20, 0)
            endif
        endif
        if count == 535 then
            call SetUnitFlyHeight(t, 0, 0)
        endif
        if count == 720 then
            set x = PolarX(GetUnitX(t), - 100, a)
            set y = PolarY(GetUnitY(t), - 100, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 4)
            call SetUnitTimeScale(u, 1)
            call Effect("war3mapImported\\ToumaE2.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 0.85, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\ToumaE.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 0.75, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\62.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\by_wood_gongchengsipai_3.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count == 810 then
            call SetUnitAnimationByIndex(u, 5)
            call SetUnitTimeScale(u, 2)
            call Effect("war3mapImported\\az_airfloww12.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 7.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\az_airfloww12.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 7.5, 255, 255, 255, 255)
        endif
        if count == 830 then
            call SetUnitTimeScale(u, 0)
        endif
        if count == 1150 then
            call SetUnitTimeScale(u, 1.75)
        endif
        if count == 1180 then
            call SoundStart("war3mapImported\\Toma_5-1.mp3")
            call ShakeCamera(1, GetOwningPlayer(u), 15)
            call ShakeCamera(1, GetOwningPlayer(t), 15)
            call Effect("war3mapImported\\by_wood_gongchengsipai_3.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\[A]GrassPisses.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 10, 3, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\dls1.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.2, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Effect_Texture_Flow_gqqg_blue.mdl", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 0.5, 1, 255, 255, 255, 0)
            set x = PolarX(GetUnitX(t), - 50, a)
            set y = PolarY(GetUnitY(t), - 50, a)
            call Effect("war3mapImported\\[A]blue-shoot.mdl", x, y, 50, a, 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        endif
        if count == 1200 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 15 * GetHeroStr(u, true))
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
            call SoundStart("war3mapImported\\toma_6.mp3")
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 8)
        endif
        if count == 10 or count == 90 then
            call ShakeCamera(0.5, GetOwningPlayer(u), 10)
            call ShakeCamera(0.5, GetOwningPlayer(t), 10)
            call Effect("war3mapImported\\by_wood_gongchengsipai_3.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\QQQQQ.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            set x = PolarX(GetUnitX(t), - 80, a)
            set y = PolarY(GetUnitY(t), - 80, a)
            call Effect("war3mapImported\\szbyafb2.mdl", x, y, 50, a, - 90, 0, 0.8, 1, 255, 255, 255, 255)
        endif
        if count >= 10 and count <= 50 or count >= 90 and count <= 130 then
            set x = PolarX(GetUnitX(t), 10, a)
            set y = PolarY(GetUnitY(t), 10, a)
            call SetUnitXY(t, x, y, 2)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                set x = PolarX(GetUnitX(t), 30, a)
                set y = PolarY(GetUnitY(t), 30, a)
                call Effect("war3mapImported\\wind2.mdl", x, y, 100, a, - 90, 0, 0.6, 1, 255, 255, 255, PercentTo255(60))
            endif
        endif
        if count == 60 or count == 140 then
            call SetUnitAnimationByIndex(u, 1)
            call SetUnitFacingEx(u, a, true)
        endif
        if count >= 60 and count <= 90 or count >= 140 and count <= 170 then
            if dist > 140 then
                set x = PolarX(GetUnitX(u), dist / 15, a)
                set y = PolarY(GetUnitY(u), dist / 15, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif
        endif
        if count == 80 then
            call SetUnitAnimationByIndex(u, 10)
        endif
        if count == 160 then
            call SetUnitAnimationByIndex(u, 13)
        endif
        if count == 170 then
            call Effect("war3mapImported\\zxd1.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            set x = PolarX(GetUnitX(t), - 60, a)
            set y = PolarY(GetUnitY(t), - 60, a)
            call Effect("war3mapImported\\AFB_SatomiRentaro_KuDing.mdl", x, y, 100, a, - 90, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call UnitAddAbility(t, 'Amrf')
            call UnitRemoveAbility(t, 'Amrf')
        endif
        if count >= 170 and count <= 200 then
            set x = PolarX(GetUnitX(t), 10, a)
            set y = PolarY(GetUnitY(t), 10, a)
            call SetUnitXY(t, x, y, 2)
            if count <= 190 then
                call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 10, 0)
            else
                call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 20, 0)
            endif
        endif
        if count == 200 then
            call SoundStart("war3mapImported\\toma_7.mp3")
            call SetUnitFlyHeight(t, 0, 0)
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
            call SetUnitAnimationByIndex(u, 7)
            call SetUnitTimeScale(u, 0.8)
        endif
        if count >= 200 and count <= 240 then
            if dist > 140 then
                set x = PolarX(GetUnitX(u), dist / 25, a)
                set y = PolarY(GetUnitY(u), dist / 25, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif
            if count <= 230 then
                call SetUnitFlyHeight(u, GetUnitFlyHeight(u) + 5, 0)
            else
                call SetUnitFlyHeight(u, GetUnitFlyHeight(u) - 15, 0)
            endif
        endif
        if count == 240 then
            call SoundStart("war3mapImported\\toma_3-2.mp3")
            call SetUnitFlyHeight(u, 0, 0)
            call ShakeCamera(1, GetOwningPlayer(u), 15)
            call ShakeCamera(1, GetOwningPlayer(u), 15)
            call Effect("war3mapImported\\[A]SlamWithOut.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.2, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\[A]Sand3.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.2, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\by_wood_gongchengsipai_3.mdx", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 4, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        endif
        if count == 250 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 11 * GetHeroStr(u, true))
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

    private function period7 takes nothing returns nothing
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
        if count == 1 then
            call SoundStart("war3mapImported\\Toma_7-1.mp3")
            call ShakeCamera(3, GetOwningPlayer(u), 5)
            call ShakeCamera(3, GetOwningPlayer(t), 5)
            call CinematicFilterGenericEx(GetOwningPlayer(u), 2, BLEND_MODE_BLEND, "war3mapImported\\tomaD.tga", 255, 255, 255, 0, 255, 255, 255, 255)
            call CinematicFilterGenericEx(GetOwningPlayer(t), 2, BLEND_MODE_BLEND, "war3mapImported\\tomaD.tga", 255, 255, 255, 0, 255, 255, 255, 255)
            call SetUnitVertexColor(u, 255, 255, 255, 0)
            set x = PolarX(GetUnitX(t), - 1000, a)
            set y = PolarY(GetUnitY(t), - 1000, a)
            call Effect("war3mapImported\\touma2.mdx", x, y, 0, a, 0, 0, 1, 0, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count <= 150 then
            set e = LoadEffectHandle(ht, zid, 100)
            set x = PolarX(GetEffectX(e), 5, a)
            set y = PolarY(GetEffectY(e), 5, a) 
            call SetEffectXY(e, x, y, 0)
            call SetSpecialEffectZ(e, GetAxisZ(x, y))
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 15 then
                call SaveInteger(ht, zid, 1, 0)
                set x = PolarX(GetEffectX(e), - 100, a)
                set y = PolarY(GetEffectY(e), - 100, a) 
                call Effect("war3mapImported\\Chongfengnew.mdx", x, y, 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
                set x = PolarX(GetEffectX(e), 50, a)
                set y = PolarY(GetEffectY(e), 50, a)
                call Effect("war3mapImported\\punchshot.mdx", x, y, 0, a, 0, 0, GetRandomReal(0.5, 0.65), 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\a_new_k3.mdx", x, y, 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 140 then
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectAnimationByIndex(e, 10)
            call SetUnitAnimationByIndex(u, 10)
        endif
        if count == 150 then
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectPosition(e, WorldBounds.maxX, WorldBounds.maxY)
            call DestroyEffect(e)
            call SetUnitVertexColor(u, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), 120, a)
            set y = PolarY(GetUnitY(t), 120, a)
            call SetUnitXY(u, x, y, 0)
        endif
        if count == 160 then
            call ShakeCamera(1, GetOwningPlayer(u), 10)
            call ShakeCamera(1, GetOwningPlayer(t), 10)
            call Effect("war3mapImported\\Lulu_shadsd.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\Light_chushou_by_wood_effect_huozhu_black.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\Lulu_kaizokusfxbyvalk888.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, GetRandomReal(0.8, 1.4), 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 0.75))
            call Effect("war3mapImported\\Lulu_kaizokusfxbyvalk888.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, GetRandomReal(0.8, 1.4), 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 0.75))
            call Effect("war3mapImported\\Lulu_kaizokusfxbyvalk888.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, GetRandomReal(0.8, 1.4), 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 0.75))
        endif
        if count == 165 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 8 * GetHeroStr(u, true))
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

    private function action takes nothing returns nothing
        local timer z
        local unit u = GetTriggerUnit()
        local unit t = GetSpellTargetUnit()
        local real x = GetSpellTargetX()
        local real y = GetSpellTargetY()
        local real a = Angle(GetUnitX(u), GetUnitY(u), x, y)
        local real dist = Distance(GetUnitX(u), GetUnitY(u), x, y)
        local integer abilId = GetSpellAbilityId()

        if abilId == 'A0AV' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, x)
            call SaveReal(ht, GetHandleId(z), 1, y)
            call TimerStart(z, 0.02, true, function period1)
        endif

        if abilId == 'A0AW' then
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

        if abilId == 'A091' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call TimerStart(z, 0.02, true, function period3)
        endif

        if abilId == 'A0AY' then
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

        if abilId == 'A0AZ' then
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

        if abilId == 'A0B0' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call TimerStart(z, 0.02, true, function period6)
        endif

        if abilId == 'A0B1' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call TimerStart(z, 0.02, true, function period7)
        endif

        set z = null
        set u = null
        set t = null
    endfunction

    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_SPELL_EFFECT, function action)
    endfunction
endscope