scope escanorspell initializer init
   
    private function period1 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local group g = LoadGroupHandle(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real a = LoadReal(ht, zid, 0)
        local real x
        local real y
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        if count == 1 then
            if GetRandomInt(1, 2) == 1 then 
                call SoundStart("war3mapImported\\Escanor_1.mp3")
            else
                call SoundStart("war3mapImported\\Escanor_1-1.mp3")
            endif
            call ShakeCamera(1, GetOwningPlayer(u), 5)
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 6)
            call SetUnitTimeScale(u, 3.5)
            call Effect("war3mapImported\\djcjb.mdl", GetUnitX(u), GetUnitY(u), 200, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count == 5 then
            call SoundStart("war3mapImported\\Escanor_1-2.mp3")
        endif
        if count <= 15 then
            set e = LoadEffectHandle(ht, zid, 100)
            set x = PolarX(GetEffectX(e), 80, a)
            set y = PolarY(GetEffectY(e), 80, a)
            call SetEffectXY(e, x, y, 1)
            call GroupEnumUnitsInRange(gGroup, x, y, 300, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then
                    call DamageUnit(u, gUnit, 100 * GetUnitAbilityLevel(u, 'A0CE'))
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 3 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\SZBYAFB2.mdl", x, y, 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_3.mdl", x, y, 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdl", x, y, 0, a, 0, 0, 2, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 15 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call IssueImmediateOrderById(u, 851972)
            call DestroyGroup(g)
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set g = null
        set e = null
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
        local real h
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SetUnitAnimationByIndex(u, 9)
            call Effect("war3mapImported\\asknhq.mdl", GetUnitX(u), GetUnitY(u), 600, randomAngle(), 0, 0, 12, 0.6, 255, 255, 255, PercentTo255(90))
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count <= 20 then
            set e = LoadEffectHandle(ht, zid, 100)
            set x = PolarX(GetEffectX(e), dist / 20, a)
            set y = PolarY(GetEffectY(e), dist / 20, a)
            call SetEffectXY(e, x, y, 0)
            set h = GetEffectZ(e) - GetAxisZ(x, y) + GetAxisZ(x + 0.01, y)
            call SetSpecialEffectZ(e, h - 25)
        endif
        if count == 20 then
            call SoundStart("war3mapImported\\Escanor_2.mp3")
            call SoundStart("war3mapImported\\Escanor_2-1.mp3")
            call Effect("war3mapImported\\Dls1.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\shuozhu1.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_3.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\az_tormentedsoul_t1.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
        endif
        if count == 25 then 
            call ShakeCamera(1, GetOwningPlayer(u), 10)
            call ShakeCamera(1, GetOwningPlayer(t), 10)
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1 + GetUnitAbilityLevel(u, 'A0CF')) * GetHeroStr(u, true))
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
        local integer i

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        if count <= 30 then
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
        endif
        if count == 1 then
            if GetRandomInt(1, 2) == 1 then 
                call SoundStart("war3mapImported\\Escanor_3.mp3")
            else
                call SoundStart("war3mapImported\\Escanor_3-1.mp3")
            endif
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
            call UnitAddAbility(t, 'Amrf')
            call UnitRemoveAbility(t, 'Amrf')
            call SetUnitAnimationByIndex(u, 11)
            call SetUnitTimeScale(u, 2.25)
            call Effect("war3mapImported\\a_new_k3.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count == 1 or count == 20 or count == 40 then
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 0.7, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 1.25, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\wind3.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(40))
        endif
        if count <= 20 then 
            if dist > 140 then 
                set x = PolarX(GetUnitX(u), dist / 15, a)
                set y = PolarY(GetUnitY(u), dist / 15, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif
            if count > 10 then 
                call SetUnitFlyHeight(u, GetUnitFlyHeight(u) - 20, 0)
            else
                call SetUnitFlyHeight(u, GetUnitFlyHeight(u) + 20, 0)
            endif
        endif
        if count == 25 then
            call SoundStart("war3mapImported\\Escanor_3-2.mp3")
            call ShakeCamera(1, GetOwningPlayer(u), 10)
            call ShakeCamera(1, GetOwningPlayer(t), 10)
            call SetUnitFlyHeight(u, 0, 0)
            call Effect("war3mapImported\\SBXZAFB2.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\XZDL2.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Eat_DiBanZhaKai.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            set i = 0
            loop
                exitwhen i > 7
                set x = PolarX(GetUnitX(t), 400, i * 45)
                set y = PolarY(GetUnitY(t), 400, i * 45)
                call Effect("war3mapImported\\SZBYAFB2.mdl", x, y, 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                set i = i + 1
            endloop
        endif
        if count == 30 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1.5 + 0.5 * GetUnitAbilityLevel(u, 'A0CG')) * GetHeroStr(u, true))
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(t), GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call SaveReal(ht, zid, 0, a)
        endif
        if count >= 30 and count <= 60 then
            set a = LoadReal(ht, zid, 0)
            set x = PolarX(GetUnitX(t), 20, a)
            set y = PolarY(GetUnitY(t), 20, a)
            call SetUnitXY(t, x, y, 2)
            if count > 45 then 
                call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 10, 0)
            else
                call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 10, 0)
            endif
        endif
        if count == 60 then
            call SetUnitFlyHeight(t, 0, 0)
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
        local real a2

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Escanor_4.mp3")
            call SoundStart("war3mapImported\\Escanor_4-1.mp3")
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 7)
            call SetUnitTimeScale(u, 4.5)
            call UnitAddAbility(t, 'Amrf')
            call UnitRemoveAbility(t, 'Amrf')
        endif
        if count == 10 then
            call ShakeCamera(2, GetOwningPlayer(u), 10)
            call ShakeCamera(2, GetOwningPlayer(t), 10)
            call SetUnitFlyHeight(t, 150, 0)
            call Effect("war3mapImported\\asknhq.mdl", GetUnitX(t), GetUnitY(t), 200, randomAngle(), 0, 0, 10, 3, 255, 255, 255, 255)
        endif
        if count == 20 or count == 40 or count == 60 or count == 80 then
            call SoundStart("war3mapImported\\Escanor_4-2.mp3")
        endif
        if count >= 10 and count <= 100 then 
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 10 then 
                call SaveInteger(ht, zid, 1, 0)
                set a2 = randomAngle()
                set x = PolarX(GetUnitX(t), GetRandomReal(- 600, 600), a2)
                set y = PolarY(GetUnitY(t), GetRandomReal(- 600, 600), a2)
                call Effect("war3mapImported\\shuozhu1.mdl", x, y, 0, randomAngle(), 0, 0, GetRandomReal(0.5, 1), 0.6, 255, 255, 255, 255)
            endif
        endif
        if count == 105 then
            call SoundStart("war3mapImported\\Escanor_4-3.mp3")
            call ShakeCamera(1, GetOwningPlayer(u), 15)
            call ShakeCamera(1, GetOwningPlayer(t), 15)
            call Effect("war3mapImported\\shuozhu2.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
        endif
        if count == 160 then 
            call SetUnitFlyHeight(t, 0, 0)
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (6 + 2 * GetUnitAbilityLevel(u, 'A0CH')) * GetHeroStr(u, true))
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
        if count <= 500 then
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
        endif
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, zid, - 1) + 1000 then 
            call SaveReal(ht, zid, - 1, GetUnitState(t, UNIT_STATE_LIFE))
        elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, zid, - 1) then
            call SaveReal(ht, zid, - 1, GetUnitState(t, UNIT_STATE_LIFE))
        endif
        call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, zid, - 1))
        if count == 1 then
            call SoundStart("war3mapImported\\Escanor_5.mp3")
            call UnitAddAbility(t, 'Amrf')
            call UnitRemoveAbility(t, 'Amrf')
            call SetUnitAnimationByIndex(u, 8)
            call Effect("war3mapImported\\shuozhu3.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 2, 10, 255, 255, 255, 255)
            call Effect("war3mapImported\\Black.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 10, 255, 255, 255, PercentTo255(60))
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
        endif
        if count == 5 then
            call Effect("war3mapImported\\asknhq.mdl", GetUnitX(u), GetUnitY(u), 900, a, 0, 0, 17, 16.6, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
            call Effect("war3mapImported\\by_wood_effect_yuzhiboyou_unusual_yuedu_1.mdl", GetUnitX(u), GetUnitY(u), 900, a, 0, 0, 1, 16.6, 255, 255, 255, PercentTo255(20))
            call SaveEffectHandle(ht, zid, 101, bj_lastCreatedEffect)
        endif
        if count == 480 then
            call SetUnitAnimationByIndex(u, 9)
        endif
        if count == 500 then
            call SetUnitInvulnerable(u, false)
            call PauseUnit(u, false)
            call IssueTargetOrderById(u, 851983, t)
            call SetUnitFlyHeight(t, 300, 0)
            call Effect("war3mapImported\\AFBHQ.mdl", GetUnitX(u), GetUnitY(u), 300, a, 0, 0, 2.5, 6.6, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 102, bj_lastCreatedEffect)
        endif
        if count >= 500 and count <= 800 then 
            set e = LoadEffectHandle(ht, zid, 100)
            set x = PolarX(GetUnitX(t), 5, GetSpecialEffectYaw(e))
            set y = PolarY(GetUnitY(t), 5, GetSpecialEffectYaw(e))
            call SetUnitXY(t, x, y, 2)
            call SetEffectX(e, GetUnitX(t))
            call SetEffectY(e, GetUnitY(t))
            call SetSpecialEffectZ(e, 300 + GetAxisZ(GetUnitX(t), GetUnitY(t)))
            set e = LoadEffectHandle(ht, zid, 101)
            call SetEffectX(e, GetUnitX(t))
            call SetEffectY(e, GetUnitY(t))
            call SetSpecialEffectZ(e, 300 + GetAxisZ(GetUnitX(t), GetUnitY(t)))
            set e = LoadEffectHandle(ht, zid, 102)
            call SetEffectX(e, GetUnitX(t))
            call SetEffectY(e, GetUnitY(t))
            call SetSpecialEffectZ(e, 300 + GetAxisZ(GetUnitX(t), GetUnitY(t)))
        endif
        if count == 800 then
            call SoundStart("war3mapImported\\Escanor_5-1.mp3")
            call ShakeCamera(1, GetOwningPlayer(u), 15)
            call ShakeCamera(1, GetOwningPlayer(t), 15)
            call Effect("war3mapImported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_3.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 2, 255, 255, 255, 255)
            call Effect("war3mapImported\\XZDL.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
        endif
        if count == 810 then 
            call SetUnitFlyHeight(t, 0, 0)
            call SetUnitTimeScale(u, 1)
            call PauseUnit(t, false)
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
        local group g = LoadGroupHandle(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real x = LoadReal(ht, zid, 0)
        local real y = LoadReal(ht, zid, 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), x, y)
        local real dist = Distance(GetUnitX(u), GetUnitY(u), x, y)
        local real x2 
        local real y2 
        local real h
        local unit d 
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        if count <= 470 then
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
        endif
        if count == 1 then
            call SoundStart("war3mapImported\\Escanor_6.mp3")
            call VisionArea(GetOwningPlayer(u), 1500, 10, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 8)
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
        endif
        if count <= 20 then
            call SetUnitFlyHeight(u, GetUnitFlyHeight(u) + 20, 0)
        endif
        if count == 20 then
            call ShakeCamera(9, GetOwningPlayer(u), 5)
            set d = CreateUnit(GetOwningPlayer(u), 'h0CO', GetUnitX(u), GetUnitY(u), 0)
            call UnitEnableMovement(d, false, false)
            call UnitApplyTimedLife(d, 'BTLF', 9.4)
            call SaveUnitHandle(ht, zid, 10, d)
            call SaveBoolean(ht, StringHash("EscanorF"), GetHandleId(d), true)
            call SaveReal(ht, StringHash("EscanorF_X"), GetHandleId(d), x)
            call SaveReal(ht, StringHash("EscanorF_Y"), GetHandleId(d), y)
            call SelectUnitForPlayerSingle(d, GetOwningPlayer(u))
            call Effect("war3mapImported\\asknhq.mdl", GetUnitX(u), GetUnitY(u), 1180, a, 0, 0, 17, 11, 255, 255, 0, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
            call Effect("war3mapImported\\by_wood_effect_yuzhiboyou_unusual_yuedu_1.mdl", GetUnitX(u), GetUnitY(u), 1180, a, 0, 0, 1, 11, 255, 255, 0, PercentTo255(20))
            call SaveEffectHandle(ht, zid, 101, bj_lastCreatedEffect)
        endif
        if count == 40 or count == 80 or count == 120 or count == 160 or count == 220 or count == 280 or count == 340 or count == 370 or count == 410 or count == 450 then
            set d = LoadUnitHandle(ht, zid, 10)
            call SelectUnitForPlayerSingle(d, GetOwningPlayer(u))
        endif
        if count == 450 then
            call SetUnitAnimationByIndex(u, 9)
        endif
        if count >= 20 and count <= 470 then
            set d = LoadUnitHandle(ht, zid, 10)
            if x != LoadReal(ht, StringHash("EscanorF_X"), GetHandleId(d)) or y != LoadReal(ht, StringHash("EscanorF_Y"), GetHandleId(d)) then
                set x = LoadReal(ht, StringHash("EscanorF_X"), GetHandleId(d))
                set y = LoadReal(ht, StringHash("EscanorF_Y"), GetHandleId(d))
                set a = Angle(GetUnitX(u), GetUnitY(u), x, y)
                set dist = Distance(GetUnitX(u), GetUnitY(u), x, y)
                if dist <= 1000 then
                    call SaveReal(ht, zid, 0, x)
                    call SaveReal(ht, zid, 1, y)
                    call SaveReal(ht, zid, 2, a)
                    call SaveReal(ht, zid, 3, dist)
                else
                    set x = PolarX(GetUnitX(u), 1000, a)
                    set y = PolarY(GetUnitY(u), 1000, a)
                    set a = Angle(GetUnitX(u), GetUnitY(u), x, y)
                    set dist = Distance(GetUnitX(u), GetUnitY(u), x, y)
                    call SaveReal(ht, zid, 0, x)
                    call SaveReal(ht, zid, 1, y)
                    call SaveReal(ht, zid, 2, a)
                    call SaveReal(ht, zid, 3, dist)
                endif
            endif
            call SetUnitFacing(u, a)
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectYaw(e, a)
            set e = LoadEffectHandle(ht, zid, 101)
            call SetSpecialEffectYaw(e, a)
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 2500, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if not IsUnitInGroup(gUnit, g) then 
                    call GroupAddUnit(g, gUnit)
                endif
                call SetUnitMoveSpeed(gUnit, GetUnitDefaultMoveSpeed(gUnit) * 0.01)
            endloop
            call GroupClear(gGroup)
        endif
        if count == 470 then
            call ForGroup(g, function ResetMoveSpeed)
            call DestroyGroup(g)
            call SetUnitFlyHeight(u, 0, 400 / 0.4)
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call IssueImmediateOrderById(u, 851972)
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectPitch(e, - 40)
            set e = LoadEffectHandle(ht, zid, 101)
            call SetSpecialEffectPitch(e, 40)
            call Effect("war3mapImported\\AFBHQ.mdl", GetUnitX(u), GetUnitY(u), 1180, a, - 40, 0, 2, 1.6, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 102, bj_lastCreatedEffect)
        endif
        if count >= 470 and count <= 500 then
            set a = LoadReal(ht, zid, 2)
            set dist = LoadReal(ht, zid, 3)
            set e = LoadEffectHandle(ht, zid, 100)
            set x2 = PolarX(GetEffectX(e), dist / 30, a)
            set y2 = PolarY(GetEffectY(e), dist / 30, a)
            set h = GetEffectZ(e) - GetAxisZ(x2, y2) + GetAxisZ(x2 + 0.01, y2)
            call SetEffectXY(e, x2, y2, 1)
            call SetSpecialEffectZ(e, h - 36)
            set e = LoadEffectHandle(ht, zid, 101)
            call SetEffectXY(e, x2, y2, 1)
            call SetSpecialEffectZ(e, h - 36)
            set e = LoadEffectHandle(ht, zid, 102)
            call SetEffectXY(e, x2, y2, 1)
            call SetSpecialEffectZ(e, h - 36)
        endif
        if count == 505 then
            call SoundStart("war3mapImported\\Escanor_6-1.mp3")
            call ShakeCamera(1, GetOwningPlayer(u), 10)
            call Effect("war3mapImported\\XZDL2.mdl", x, y, 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count == 510 then
            call Effect("war3mapImported\\shuozhu2.mdl", x, y, 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
        endif
        if count >= 500 and count <= 550 then
            call GroupEnumUnitsInRange(gGroup, x, y, 600, null)
            loop 
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null 
                if FilterGeneral(u, gUnit) then 
                    call DamageUnit(u, gUnit, 11 * GetHeroStr(u, true) / 50)
                    call IssueImmediateOrderById(gUnit, 851972)
                endif
            endloop
            call GroupClear(gGroup)
        endif
        if count == 550 then 
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set g = null
        set d = null
        set e = null
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

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Escanor_7.mp3")
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
            call Effect("war3mapImported\\a_new_k3.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count == 10 then
            call SoundStart("war3mapImported\\Escanor_7-1.mp3")
            call ShakeCamera(1, GetOwningPlayer(u), 10)
            call ShakeCamera(1, GetOwningPlayer(t), 10)
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 5)
            call Effect("war3mapImported\\BY_Wood_Decade_RiderKick_Ring.mdl", GetUnitX(t), GetUnitY(t), 200, a, - 90, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Hit_DaJi_Add.mdl", GetUnitX(t), GetUnitY(t), 200, a, - 90, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\earthdetonation.mdl", GetUnitX(t), GetUnitY(t), 200, a, - 90, 0, 1.3, 1, 255, 255, 255, 255)
        endif
        if count >= 10 and count <= 40 then
            set x = PolarX(GetUnitX(t), 20, a)
            set y = PolarY(GetUnitY(t), 20, a)
            call SetUnitXY(t, x, y, 2)
        endif
        if count >= 30 and count <= 50 then
            if dist > 140 then 
                set x = PolarX(GetUnitX(u), 2 + dist / 15, a)
                set y = PolarY(GetUnitY(u), 2 + dist / 15, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif
            if count > 40 then 
                call SetUnitFlyHeight(u, GetUnitFlyHeight(u) - 20, 0)
            else
                call SetUnitFlyHeight(u, GetUnitFlyHeight(u) + 20, 0)
            endif
        endif
        if count == 35 then
            call SoundStart("war3mapImported\\Escanor_7-2.mp3")
            call SetUnitAnimationByIndex(u, 11)
        endif
        if count == 50 then
            call ShakeCamera(1, GetOwningPlayer(u), 15)
            call ShakeCamera(1, GetOwningPlayer(t), 15)
            call SetUnitFlyHeight(u, 0, 0)
            call Effect("war3mapImported\\SBXZAFB2.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\yayacleave.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 3, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Eat_DiBanZhaKai.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        endif
        if count == 60 then 
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

        if abilId == 'A0CE' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period1)
        endif

        if abilId == 'A0CF' then
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

        if abilId == 'A0CG' then
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

        if abilId == 'A0CH' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call TimerStart(z, 0.02, true, function period4)
        endif

        if abilId == 'A0CI' then
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

        if abilId == 'A0CJ' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, x)
            call SaveReal(ht, GetHandleId(z), 1, y)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period6)
        endif

        if abilId == 'A0CK' then
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

    private function action2 takes nothing returns nothing
        local unit u = GetTriggerUnit()
        local real x = GetOrderPointX()
        local real y = GetOrderPointY()
        if LoadBoolean(ht, StringHash("EscanorF"), GetHandleId(u)) then 
            if GetIssuedOrderId() == 851986 or GetIssuedOrderId() == 851971 then
                call SaveReal(ht, StringHash("EscanorF_X"), GetHandleId(u), x)
                call SaveReal(ht, StringHash("EscanorF_Y"), GetHandleId(u), y)
            endif
        endif
        set u = null
    endfunction
        
    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_SPELL_EFFECT, function action)
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER, function action2)
    endfunction
endscope