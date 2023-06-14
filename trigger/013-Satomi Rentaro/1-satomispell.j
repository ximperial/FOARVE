scope satomispell initializer init

    private function period1 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local real a = GetUnitFacing(u)
        local real x = LoadReal(ht, GetHandleId(z), 0)
        local real y = LoadReal(ht, GetHandleId(z), 1)
        local integer count = LoadInteger(ht, GetHandleId(z), 0) + 1
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)

        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Satomi_1.mp3")
            call SetUnitAnimationByIndex(u, 8)
            call SetUnitTimeScale(u, 10)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Dus_Kuosan_1_2_2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count == 10 then
            call SetUnitXY(u, x, y, 1)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Eat_DiBanZhaKai.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_2_2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Dls1.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.1, 1, 255, 255, 255, 255)
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 500, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) then
                    call DamageUnit(u, gUnit, 100 * GetUnitAbilityLevel(u, 'A01F'))
                endif
            endloop
            call GroupClear(gGroup)
            call SetUnitTimeScale(u, 1)
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call PauseUnit(u, false)
            call IssueImmediateOrderById(u, 851972)
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
    endfunction

    private function period2 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x 
        local real y 
        local integer count = LoadInteger(ht, GetHandleId(z), 0) + 1
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)

        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Satomi_2.mp3")
            call SetUnitAnimationByIndex(u, 10)
        endif
        if count == 20 then
            call SetUnitAnimationByIndex(u, 14)
            call SetUnitTimeScale(u, 1.5)
        endif
        if count <= 30 then
            if dist > 140 then
                set x = PolarX(GetUnitX(u), dist / 20, a)
                set y = PolarY(GetUnitY(u), dist / 20, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif
        endif
        if count == 30 then
            call Effect("war3mapImported\\zxd1.mdl", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\djcjb.mdl", GetUnitX(t), GetUnitY(t), 200, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Hit_DaJi_Add.mdl", GetUnitX(t), GetUnitY(t), 200, a, 0, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\djcjb.mdl", GetUnitX(t), GetUnitY(t), 200, a + 20, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Hit_DaJi_Add.mdl", GetUnitX(t), GetUnitY(t), 200, a + 20, 0, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\djcjb.mdl", GetUnitX(t), GetUnitY(t), 200, a - 20, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Hit_DaJi_Add.mdl", GetUnitX(t), GetUnitY(t), 200, a - 20, 0, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\AFB_SatomiRentaro_KuDing.mdl", GetUnitX(t), GetUnitY(t), 150, a, - 90, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count == 40 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1 + GetUnitAbilityLevel(u, 'A01G')) * GetHeroStr(u, true))
            call knockbackUnit(t, 600, a, 0.6)
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set t = null
    endfunction

    private function period3 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y
        local integer count = LoadInteger(ht, GetHandleId(z), 0) + 1
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)

        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Satomi_4.mp3")
            call SetUnitAnimationByIndex(u, 8)
            call SetUnitTimeScale(u, 2.5)
            call Effect("war3mapImported\\a_new_k3.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 2, 1, 255, 255, 255, 255)
        endif
        if count == 10 then
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\punchshot.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count <= 30 then
            if dist > 140 then
                set x = PolarX(GetUnitX(u), dist / 20, a)
                set y = PolarY(GetUnitY(u), dist / 20, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call Effect("war3mapImported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 30 then
            call SoundStart("war3mapImported\\Satomi_4-1.mp3")
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
            call UnitAddAbility(t, 'Amrf')
            call UnitRemoveAbility(t, 'Amrf')
            call SetUnitAnimationByIndex(u, 17)
        endif
        if count == 40 then
            call SoundStart("war3mapImported\\Satomi_4-2.mp3")
            call Effect("war3mapImported\\fire-boom-new.mdl", GetUnitX(u), GetUnitY(u), 100, a, - 45, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\SZBYAFB2.mdl", GetUnitX(u), GetUnitY(u), 100, a, - 45, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\zxd1.mdl", GetUnitX(u), GetUnitY(u), 100, a, - 45, 0, 2, 1, 255, 255, 255, 255)
        endif
        if count >= 40 and count <= 60 then
            set x = PolarX(GetUnitX(t), 30, a)
            set y = PolarY(GetUnitY(t), 30, a)
            call SetUnitXY(t, x, y, 2)
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 30, 0)
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_3.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), a, - 45, 0, 1.5, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 60 then
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitFlyHeight(u, 600, 0)
            call SetUnitAnimationByIndex(u, 16)
            call SetUnitTimeScale(u, 1.75)
        endif
        if count == 90 then
            call SoundStart("war3mapImported\\Satomi_4-3.mp3")
            call SoundStart("war3mapImported\\Satomi_4-4.mp3")
        endif
        if count >= 90 and count <= 100 then
            call SetUnitFlyHeight(u, GetUnitFlyHeight(u) - 60, 0)
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 60, 0)
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 2 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call Effect("war3mapImported\\fire-boom-new.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 100 then
            call SoundStart("war3mapImported\\Satomi_4-5.mp3")
            call SetUnitFlyHeight(u, 0, 0)
            call SetUnitFlyHeight(t, 0, 0)
            call Effect("war3mapImported\\SZBYAFB2.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Dls1.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\zxd1.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, 255)
        endif
        if count == 110 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (6 + 2 * GetUnitAbilityLevel(u, 'A00H')) * GetHeroStr(u, true))
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(t), GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set t = null
    endfunction

    private function period4 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y
        local integer count = LoadInteger(ht, GetHandleId(z), 0) + 1
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)

        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Satomi_5.mp3")
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
            call UnitAddAbility(t, 'Amrf')
            call UnitRemoveAbility(t, 'Amrf')
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 18)
        endif
        if count == 10 then
            call SoundStart("war3mapImported\\Satomi_5-1.mp3")
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_3.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.8, 1, 255, 255, 255, 255)
        endif
        if count >= 10 and count <= 50 then
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 20, 0)
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_1.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), a, - 90, 0, 1.2, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 50 then
            call SoundStart("war3mapImported\\Satomi_5-2.mp3")
            call SoundStart("war3mapImported\\Satomi_5-3.mp3")
            call SetUnitAnimationByIndex(u, 7)
            call SetUnitFlyHeight(u, GetUnitFlyHeight(t) + 50, 1450)
        endif
        if count == 80 then
            call SetUnitAnimationByIndex(u, 16)
            call SetUnitTimeScale(u, 1.25)
        endif
        if count == 90 then
            call SoundStart("war3mapImported\\Satomi_5-4.mp3")
            call SetUnitFlyHeight(u, 0, 4250)
            call Effect("war3mapImported\\AFB_SatomiRentaro_KuDing.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), a, - 180, 0, 1.2, 1, 255, 255, 255, 255) 
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        endif
        if count >= 90 and count <= 100 then
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 80, 0)
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_1.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), a, - 90, 0, 1.2, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 100 then
            call SoundStart("war3mapImported\\Satomi_5-5.mp3")
            call SoundStart("war3mapImported\\Satomi_5-6.mp3")
            call SetUnitFlyHeight(u, 0, 0)
            call SetUnitFlyHeight(t, 0, 0)
            call Effect("war3mapImported\\zxd6.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.7, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\EarthDetonation.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\SZBYAFB2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2.2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Eat_DiBanZhaKai.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.1, 1, 255, 255, 255, 255) 
        endif
        if count == 110 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 15 * GetHeroStr(u, true))
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(t), GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set t = null
    endfunction

    private function period5 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y
        local integer count = LoadInteger(ht, GetHandleId(z), 0) + 1
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
        local integer i = 0

        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Satomi_6.mp3")
            call SoundStart("war3mapImported\\Satomi_6-1.mp3")
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
            call SetUnitFlyHeight(u, 600, 3000)
            call SetUnitAnimationByIndex(u, 8)
            call SetUnitTimeScale(u, 1.75)
            call SaveEffectHandle(ht, GetHandleId(z), 10, AddSpecialEffectTarget("war3mapImported\\mbdm.mdx", u, "hand left"))
            call SaveEffectHandle(ht, GetHandleId(z), 11, AddSpecialEffectTarget("war3mapImported\\mbdm.mdx", u, "hand right"))
            call SaveEffectHandle(ht, GetHandleId(z), 12, AddSpecialEffectTarget("war3mapImported\\mbdm.mdx", u, "foot left"))
            call SaveEffectHandle(ht, GetHandleId(z), 13, AddSpecialEffectTarget("war3mapImported\\mbdm.mdx", u, "foot right"))
            call SaveEffectHandle(ht, GetHandleId(z), 14, AddSpecialEffectTarget("war3mapImported\\mbdm.mdx", u, "origin"))
        endif
        if count >= 10 and count <= 50 then 
            if dist > 140 then 
                set x = PolarX(GetUnitX(u), dist / 30, a)
                set y = PolarY(GetUnitY(u), dist / 30, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif
            call SetUnitFlyHeight(u, GetUnitFlyHeight(u) - 15, 0) 
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 4 then 
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_2.mdl", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), a, 0, 0, GetRandomReal(1, 1.4), 1, 255, 255, 255, 255)
            endif
        endif
        if count == 50 then 
            call SoundStart("war3mapImported\\Satomi_6-2.mp3")
            call SetUnitFlyHeight(u, 0, 0)
            call Effect("war3mapImported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_2_2.mdl", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\SZBYAFB2.mdl", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 2.6, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Eat_DiBanZhaKai.mdl", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\zxd6.mdl", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.6, 1, 255, 255, 255, 255)
        endif
        if count == 60 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 11 * GetHeroStr(u, true))
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(t), GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z), 10))
            call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z), 11))
            call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z), 12))
            call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z), 13))
            call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z), 14))
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set t = null
    endfunction

    private function period6 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y
        local integer count = LoadInteger(ht, GetHandleId(z), 0) + 1
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
        local integer i = 0

        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Satomi_7.mp3")
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
            call UnitAddAbility(t, 'Amrf')
            call UnitRemoveAbility(t, 'Amrf')
            call SetUnitAnimationByIndex(u, 9)
            call SetUnitTimeScale(u, 1.5)
            call SaveEffectHandle(ht, GetHandleId(z), 10, AddSpecialEffectTarget("war3mapImported\\mbdm.mdx", u, "hand left"))
            call SaveEffectHandle(ht, GetHandleId(z), 11, AddSpecialEffectTarget("war3mapImported\\mbdm.mdx", u, "hand right"))
            call SaveEffectHandle(ht, GetHandleId(z), 12, AddSpecialEffectTarget("war3mapImported\\mbdm.mdx", u, "foot left"))
            call SaveEffectHandle(ht, GetHandleId(z), 13, AddSpecialEffectTarget("war3mapImported\\mbdm.mdx", u, "foot right"))
            call SaveEffectHandle(ht, GetHandleId(z), 14, AddSpecialEffectTarget("war3mapImported\\mbdm.mdx", u, "origin"))
        endif
        if count <= 20 then 
            set x = PolarX(GetUnitX(u), - 20, a)
            set y = PolarY(GetUnitY(u), - 20, a)
            call SetUnitXY(u, x, y, 1)
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 5 then 
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call Effect("war3mapImported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, GetRandomReal(0.9, 1.2), 1, 255, 255, 255, 255)
            endif
        endif
        if count == 20 then 
            call SetUnitAnimationByIndex(u, 11)
            call SetUnitTimeScale(u, 1)
        endif
        if count >= 20 and count <= 50 then 
            if dist > 140 then 
                set x = PolarX(GetUnitX(u), dist / 20, a)
                set y = PolarY(GetUnitY(u), dist / 20, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 5 then 
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call Effect("war3mapImported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, GetRandomReal(0.9, 1.2), 1, 255, 255, 255, 255)
            endif
        endif
        if count == 40 then 
            call SetUnitAnimationByIndex(u, 12)
        endif
        if count == 50 then 
            call Effect("war3mapImported\\djcjb.mdl", GetUnitX(t), GetUnitY(t), 120, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\SZBYAFB2.mdl", GetUnitX(t), GetUnitY(t), 80, a, - 90, 0, 2.1, 1, 255, 255, 255, 255)
        endif
        if count >= 50 and count <= 70 then
            set x = PolarX(GetUnitX(t), 30, a)
            set y = PolarY(GetUnitY(t), 30, a)
            call SetUnitXY(t, x, y, 1)
        endif
        if count == 70 then 
            call SetUnitAnimationByIndex(u, 14)
            call SetUnitTimeScale(u, 1.2)
        endif
        if count >= 70 and count <= 100 then 
            if dist > 140 then 
                set x = PolarX(GetUnitX(u), dist / 20, a)
                set y = PolarY(GetUnitY(u), dist / 20, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 5 then 
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call Effect("war3mapImported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, GetRandomReal(0.9, 1.2), 1, 255, 255, 255, 255)
            endif
        endif
        if count == 100 then
            call Effect("war3mapImported\\fire-boom-new.mdl", GetUnitX(t), GetUnitY(t), 80, a, - 45, 0, 1.8, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\SZBYAFB2.mdl", GetUnitX(t), GetUnitY(t), 120, a + 180, - 45, 0, 3.2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\zxd1.mdl", GetUnitX(t), GetUnitY(t), 90, a, - 45, 0, 1.8, 1, 255, 255, 255, 255) 
        endif
        if count >= 100 and count <= 130 then
            set x = PolarX(GetUnitX(t), 30, a)
            set y = PolarY(GetUnitY(t), 30, a)
            call SetUnitXY(t, x, y, 2)
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 30, 0)
            if count > 110 then
                if dist > 140 then 
                    set x = PolarX(GetUnitX(u), dist / 5, a)
                    set y = PolarY(GetUnitY(u), dist / 5, a)
                    call SetUnitXY(u, x, y, 0)
                else
                    set x = PolarX(GetUnitX(t), - 120, a)
                    set y = PolarY(GetUnitY(t), - 120, a)
                    call SetUnitXY(u, x, y, 0)
                endif
            endif
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 5 then 
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_3.mdl", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(t), a, - 45, 0, GetRandomReal(0.9, 1.2), 1, 255, 255, 255, 255)
            endif
        endif
        if count == 110 then
            call SetUnitAnimationByIndex(u, 4)
            call SetUnitFlyHeight(u, 950, 2375) 
        endif
        if count == 130 then 
            call SetUnitAnimationByIndex(u, 8)
            call SetUnitTimeScale(u, 1.5)
            call SetUnitFlyHeight(u, 0, 2375)
        endif
        if count >= 130 and count <= 150 then
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 45, 0)
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 5 then 
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_2.mdl", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(t), a, 0, 0, GetRandomReal(1.3, 1.6), 1, 255, 255, 255, 255) 
            endif
        endif
        if count == 150 then 
            call SoundStart("war3mapImported\\Satomi_4-5.mp3")
            call SetUnitFlyHeight(t, 0, 0)
            call SetUnitFlyHeight(u, 0, 0)
            call Effect("war3mapImported\\SZBYAFB2.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3.3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Dls1.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.8, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\zxd1.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2.4, 1, 255, 255, 255, 255)
        endif
        if count == 160 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (8 + 0.4 * GetUnitAbilityLevel(u, 'A01K')) * GetHeroStr(u, true))
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(t), GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z), 10))
            call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z), 11))
            call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z), 12))
            call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z), 13))
            call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z), 14))
            call FlushChildHashtable(ht, GetHandleId(z))
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

        if abilId == 'A01F' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, x)
            call SaveReal(ht, GetHandleId(z), 1, y)
            call TimerStart(z, 0.02, true, function period1)
        endif

        if abilId == 'A01G' then
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

        if abilId == 'A00H' then
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

        if abilId == 'A01I' then
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

        if abilId == 'A01J' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call TimerStart(z, 0.02, true, function period5)
        endif

        if abilId == 'A01M' then
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

        set z = null
        set u = null
        set t = null
    endfunction

    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_SPELL_EFFECT, function action)
    endfunction
endscope